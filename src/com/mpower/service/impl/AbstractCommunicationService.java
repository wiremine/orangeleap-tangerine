package com.mpower.service.impl;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.mpower.dao.interfaces.CommunicationDao;
import com.mpower.domain.model.communication.AbstractCommunicationEntity;
import com.mpower.domain.util.SeasonalDateSpan;
import com.mpower.service.AuditService;
import com.mpower.service.CommunicationService;
import com.mpower.service.InactivateService;
import com.mpower.type.ActivationType;

public abstract class AbstractCommunicationService<T extends AbstractCommunicationEntity> extends AbstractTangerineService implements CommunicationService<T>, InactivateService {

    /** Logger for this class and subclasses */
    protected final Log logger = LogFactory.getLog(getClass());
    
    @Resource(name = "auditService")
    private AuditService auditService;

    protected abstract CommunicationDao<T> getDao();
    protected abstract T createEntity(Long constituentId);

    @Transactional(propagation = Propagation.REQUIRED)
    @Override
    public T save(T entity) {
        if (logger.isDebugEnabled()) {
            logger.debug("save: entity = " + entity);
        }
        entity = getDao().maintainEntity(entity);
        if (entity.isInactive()) {
            auditService.auditObjectInactive(entity);
        } 
        else {
            auditService.auditObject(entity);
        }
        return entity;
    }

    @Override
    public List<T> readByConstituentId(Long constituentId) {
        if (logger.isDebugEnabled()) {
            logger.debug("readByConstituentId: constituentId = " + constituentId);
        }
        return getDao().readByConstituentId(constituentId);
    }

    @Override
    public List<T> filterValid(Long constituentId) {
        if (logger.isDebugEnabled()) {
            logger.debug("filterValid: constituentId = " + constituentId);
        }
        return filterValidEntities(readByConstituentId(constituentId));
    }

    @Override
    public T readById(Long entityId) {
        if (logger.isDebugEnabled()) {
            logger.debug("read: entityId = " + entityId);
        }
        return getDao().readById(entityId);
    }
    
    @Override
    public void findReferenceDataByConstituentId(Map<String, Object> refData, Long constituentId, String entitiesKey, String activeEntitiesKey, String activeMailEntitiesKey) {
        if (logger.isDebugEnabled()) {
            logger.debug("findReferenceDataByConstituentId: constituentId = " + constituentId + " entitiesKey = " + entitiesKey + " activeEntitiesKey = " + 
                    activeEntitiesKey + " activeMailEntitiesKey = " + activeMailEntitiesKey);
        }
        List<T> entities = readByConstituentId(constituentId);
        List<T> activeEntities = new ArrayList<T>();
        
        for (T entity : entities) {
            if (entity.isInactive() == false) {
                activeEntities.add(entity);
            }
        }
        activeEntities = filterByActivationType(activeEntities, false);
        List<T> mailOnlyEntities = filterByActivationType(activeEntities, true);
        
        refData.put(entitiesKey, entities);
        refData.put(activeEntitiesKey, activeEntities);
        refData.put(activeMailEntitiesKey, mailOnlyEntities);
    }

    @Override
    public T readByIdCreateIfNull(String entityId, Long constituentId) {
        if (logger.isDebugEnabled()) {
            logger.debug("readByIdCreateIfNull: entityId = " + entityId + " constituentId = " + constituentId);
        }
        T entity;
        if (entityId == null) {
            entity = createEntity(constituentId);
        }
        else {
            entity = getDao().readById(new Long(entityId));
        }
        return entity;
    }

    @Transactional(propagation = Propagation.REQUIRED)
    public void inactivateEntities() {
        if (logger.isDebugEnabled()) {
            logger.debug("inactivateEntities:");
        }
        getDao().inactivateEntities();
    }

    @Transactional(propagation = Propagation.REQUIRED)
    @Override
    public void inactivate(Long id) {
        if (logger.isDebugEnabled()) {
            logger.debug("inactivate: id = " + id);
        }
        T entity = readById(id);
        entity.setInactive(true);
        this.save(entity);
    }
   
    /**
     * Method that can be overridden in unit tests
     * @return today's date
     */
    protected Date getNowDate() {
        return Calendar.getInstance().getTime();
    }
    
    protected List<T> filterValidEntities(final List<T> entities) {
        List<T> filteredEntities = new ArrayList<T>();
        for (T entity : entities) {
            if (entity.isValid()) {
                filteredEntities.add(entity);
            }
        }
        return filteredEntities;
    }
    
    protected List<T> filterByActivationType(final List<T> entities, final boolean mailOnly) {
        if (logger.isDebugEnabled()) {
            logger.debug("filterByActivationType: entities = " + entities + " mailOnly = " + mailOnly);
        }
        // create an ordered map of "status" -> (ordered map of "activationType" -> entity)
        Map<ActivationType, LinkedHashMap<String, List<T>>> statusMap = new LinkedHashMap<ActivationType, LinkedHashMap<String, List<T>>>();
        Set<String> communicationTypeSet = new LinkedHashSet<String>(); // store types of entities
        Date nowDate = getNowDate();

        for (T entity : entities) {
            if (ActivationType.temporary.equals(entity.getActivationStatus())) {
                if (entity.getTemporaryStartDate() != null && entity.getTemporaryEndDate() != null && 
                    !nowDate.before(entity.getTemporaryStartDate()) && !nowDate.after(entity.getTemporaryEndDate())) {
                    addToMap(statusMap, communicationTypeSet, ActivationType.temporary, entity);
                }
            } 
            else if (ActivationType.seasonal.equals(entity.getActivationStatus())) {
                SeasonalDateSpan dateSpan = new SeasonalDateSpan(entity.getSeasonalStartDate(), entity.getSeasonalEndDate());
                if (dateSpan.contains(nowDate)) {
                    addToMap(statusMap, communicationTypeSet, ActivationType.seasonal, entity);
                }
            } 
            else if (ActivationType.permanent.equals(entity.getActivationStatus())) {
                if (entity.getEffectiveDate() == null || !entity.getEffectiveDate().after(nowDate)) {
                    addToMap(statusMap, communicationTypeSet, ActivationType.permanent, entity);
                }
            }
        }
        return createAppendedList(statusMap, communicationTypeSet, mailOnly);
    }
    
    private List<T> createAppendedList(Map<ActivationType, LinkedHashMap<String, List<T>>> statusMap, Set<String> communicationTypeSet, boolean mailOnly) {
        List<T> newList = new ArrayList<T>();
        for (String communicationType : communicationTypeSet) {
            LinkedHashMap<String, List<T>> tempMap = statusMap.get(ActivationType.temporary);
            LinkedHashMap<String, List<T>> seasonalMap = statusMap.get(ActivationType.seasonal);
            LinkedHashMap<String, List<T>> permanentMap = statusMap.get(ActivationType.permanent);
            
            if (tempMap != null && tempMap.get(communicationType) != null) {
                newList.addAll(tempMap.get(communicationType));
            } 
            else if (seasonalMap != null && seasonalMap.get(communicationType) != null) {
                newList.addAll(seasonalMap.get(communicationType));
            } 
            else if (permanentMap != null && permanentMap.get(communicationType) != null) {
                newList.addAll(permanentMap.get(communicationType));
            }
        }
        // If want only those accepting mail, then filter out no mail addresses
        for (Iterator<T> iterator = newList.iterator(); iterator.hasNext();) {
            T entity = iterator.next();
            if (mailOnly && !entity.isReceiveMail()) {
                iterator.remove();
            }
        }
        return newList;
    }

    protected void addToMap(Map<ActivationType, LinkedHashMap<String, List<T>>> statusMap, Set<String> communicationTypeSet, ActivationType actType, T entity) {
        LinkedHashMap<String, List<T>> communicationTypeMap = statusMap.get(actType);
        if (communicationTypeMap == null) {
            communicationTypeMap = new LinkedHashMap<String, List<T>>();
        }
        List<T> aList = communicationTypeMap.get(entity.getCommunicationType());
        if (aList == null) {
            aList = new ArrayList<T>();
        }
        aList.add(entity);
        communicationTypeSet.add(entity.getCommunicationType());
        communicationTypeMap.put(entity.getCommunicationType(), aList);
        statusMap.put(actType, communicationTypeMap);
    }
}

/*
 * Copyright (c) 2009. Orange Leap Inc. Active Constituent
 * Relationship Management Platform.
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

package com.orangeleap.tangerine.service.impl;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.joda.time.DateMidnight;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.BindException;

import com.orangeleap.tangerine.dao.CommunicationDao;
import com.orangeleap.tangerine.domain.communication.AbstractCommunicationEntity;
import com.orangeleap.tangerine.domain.util.SeasonalDateSpan;
import com.orangeleap.tangerine.service.AuditService;
import com.orangeleap.tangerine.service.CommunicationService;
import com.orangeleap.tangerine.service.ConstituentService;
import com.orangeleap.tangerine.service.InactivateService;
import com.orangeleap.tangerine.type.ActivationType;
import com.orangeleap.tangerine.util.OLLogger;

public abstract class AbstractCommunicationService<T extends AbstractCommunicationEntity> extends AbstractTangerineService implements CommunicationService<T>, InactivateService {

    /** Logger for this class and subclasses */
    protected final Log logger = OLLogger.getLog(getClass());
    
    @Resource(name = "auditService")
    private AuditService auditService;

    @Resource(name = "constituentService")
    private ConstituentService constituentService;

    protected abstract CommunicationDao<T> getDao();
    protected abstract T createEntity(Long constituentId);
    
    @Override
    public T alreadyExists(T entity) {
        if (logger.isTraceEnabled()) {
            logger.trace("alreadyExists: entity = " + entity);
        }
        List<T> entities = readByConstituentId(entity.getConstituentId());
        T returnEntity = null;
        for (T existingEntity : entities) {
            if (existingEntity.equals(entity) && ! existingEntity.getId().equals(entity.getId())) {
                returnEntity = existingEntity;
                break;
            }
        }
        return returnEntity;
    }

    protected abstract void validate(T entity) throws BindException;
    
    @Transactional(propagation = Propagation.REQUIRED, rollbackFor = {BindException.class})
    @Override
    public T save(T entity) throws BindException {
        if (logger.isTraceEnabled()) {
            logger.trace("save: entity = " + entity);
        }
        validate(entity);
        List<T> entities = readByConstituentId(entity.getConstituentId());
        if (!entity.isPrimary()) {
        	checkIfOnlyOneActive(entity, entities);
        }
        if (entity.isPrimary()) {
        	checkIfOtherPrimariesExist(entity, entities);
        } 
        entity = getDao().maintainEntity(entity);
        if (entity.isInactive()) {
            auditService.auditObjectInactive(entity, entity.getConstituentId());
        } 
        else {
            auditService.auditObject(entity, entity.getConstituentId());
        }
        constituentService.updateFullTextSearchIndex(entity.getConstituentId());

        return entity;
    }
    
    protected void checkIfOtherPrimariesExist(T entity, List<T> entities) {
    	for (T item : entities) {
    		if (!item.getId().equals(entity.getId()) && item.isPrimary()) {
    			item.setPrimary(false);
    			getDao().maintainEntity(item);
    		}
    	}
    }
    
    protected void checkIfOnlyOneActive(T entity, List<T> entities) {
    	List<T> list = filterValid(entities);
    	if (list.isEmpty() || list.get(0).getId().equals(entity.getId())) {
    		entity.setPrimary(true);
    	}
    }

    @Override
    public List<T> readByConstituentId(Long constituentId) {
        if (logger.isTraceEnabled()) {
            logger.trace("readByConstituentId: constituentId = " + constituentId);
        }
        return getDao().readByConstituentId(constituentId);
    }

    @Override
    public List<T> filterValid(Long constituentId) {
        if (logger.isTraceEnabled()) {
            logger.trace("filterValid: constituentId = " + constituentId);
        }
        return filterValid(readByConstituentId(constituentId));
    }

	@Override
    public List<T> filterValid(List<T> entities) {
        if (logger.isTraceEnabled()) {
            logger.trace("filterValid:");
        }
        return filterValidEntities(entities);
    }

    @Override
    public T readById(Long entityId) {
        if (logger.isTraceEnabled()) {
            logger.trace("read: entityId = " + entityId);
        }
        return getDao().readById(entityId);
    }
    
    @Override
    public void findReferenceDataByConstituentId(Map<String, Object> refData, Long constituentId, String entitiesKey, String activeEntitiesKey, String activeMailEntitiesKey) {
        if (logger.isTraceEnabled()) {
            logger.trace("findReferenceDataByConstituentId: constituentId = " + constituentId + " entitiesKey = " + entitiesKey + " activeEntitiesKey = " + 
                    activeEntitiesKey + " activeMailEntitiesKey = " + activeMailEntitiesKey);
        }
        List<T> entities = readByConstituentId(constituentId);
        
        List<T> activeEntities = filterByActive(entities);
        activeEntities = filterByActivationType(activeEntities, false);
        List<T> mailOnlyEntities = filterByActivationType(activeEntities, true);
        
        refData.put(entitiesKey, entities);
        refData.put(activeEntitiesKey, activeEntities);
        refData.put(activeMailEntitiesKey, mailOnlyEntities);
    }

    @Override
    public T filterByPrimary(List<T> entities, Long constituentId) {
        List<T> activeEntities = filterByActive(entities);
        for (T entity : activeEntities) {
            if (entity.isPrimary()) {
                return entity;
            }
        }
        // An inactive entity cannot be a primary, so return a blank one.
        return createEntity(constituentId);        
    }

    @Override
    public T getPrimary(Long constituentId) {
        if (logger.isTraceEnabled()) {
            logger.trace("getPrimary: constituentId = " + constituentId);
        }
        List<T> entities = readByConstituentId(constituentId);
        return filterByPrimary(entities, constituentId);
    }

	@Override
	public List<T> filterByActive(Long constituentId) {
		if (logger.isTraceEnabled()) {
		    logger.trace("filterByActive: constituentId = " + constituentId);
		}
	    return filterByActive(readByConstituentId(constituentId));
	}

    @Override
    public List<T> filterByActive(List<T> entities) {
        List<T> activeEntities = new ArrayList<T>();
        for (T entity : entities) {
            if ( ! entity.isInactive()) {
                activeEntities.add(entity);
            }
        }
        return activeEntities;
    }

    @Override
    public T readByIdCreateIfNull(String entityId, Long constituentId) {
        if (logger.isTraceEnabled()) {
            logger.trace("readByIdCreateIfNull: entityId = " + entityId + " constituentId = " + constituentId);
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
    @Override
    public void maintainResetReceiveCorrespondence(Long constituentId) {
        if (logger.isTraceEnabled()) {
            logger.trace("resetReceiveCorrespondence: constituentId = " + constituentId);
        }
        List<T> entities = readByConstituentId(constituentId);
        if (entities != null) {
            for (T communicationEntity : entities) {
                resetReceiveCorrespondence(communicationEntity);
                getDao().maintainEntity(communicationEntity);
            }
        }
    }

    @Override
    public void resetReceiveCorrespondence(T entity) {
        if (logger.isTraceEnabled()) {
            logger.trace("resetReceiveCorrespondence: entity.id = " + entity.getId());
        }
        if (entity != null) {
            entity.setReceiveCorrespondence(false);
        }
    }

    @Transactional(propagation = Propagation.REQUIRED)
    public void inactivateEntities() {
        if (logger.isTraceEnabled()) {
            logger.trace("inactivateEntities:");
        }
        getDao().inactivateEntities();
    }

    @Transactional(propagation = Propagation.REQUIRED, rollbackFor = {BindException.class})
    @Override
    public void inactivate(Long id) throws BindException {
        if (logger.isTraceEnabled()) {
            logger.trace("inactivate: id = " + id);
        }
        T entity = readById(id);
        entity.setInactive(true);
        entity.setPrimary(false);
        entity.setReceiveCorrespondence(false);
        this.save(entity);
    }
   
    /**
     * Method that can be overridden in unit tests
     * @return today's date as midnight
     */
    protected DateMidnight getNowDateMidnight() {
        return new DateMidnight();
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

    @Override
    public boolean isCurrent(final T entity) {
        if (logger.isTraceEnabled()) {
            logger.trace("isCurrent: entity = " + entity);
        }
        boolean isCurrent = false;
        DateMidnight nowDate = getNowDateMidnight();
        if (ActivationType.temporary.equals(entity.getActivationStatus())) {
            if (entity.getTemporaryStartDate() != null && entity.getTemporaryEndDate() != null &&
                !nowDate.isBefore(new DateMidnight(entity.getTemporaryStartDate())) && !nowDate.isAfter(new DateMidnight(entity.getTemporaryEndDate()))) {
                isCurrent = true;
            }
        }
        else if (ActivationType.seasonal.equals(entity.getActivationStatus())) {
            SeasonalDateSpan dateSpan = new SeasonalDateSpan(entity.getSeasonalStartDate(), entity.getSeasonalEndDate());
            if (dateSpan.contains(nowDate.toDate())) {
                isCurrent = true;
            }
        }
        else if (ActivationType.permanent.equals(entity.getActivationStatus())) {
            if (entity.getEffectiveDate() == null || !new DateMidnight(entity.getEffectiveDate()).isAfter(nowDate)) {
                isCurrent = true;
            }
        }
        return isCurrent;
    }

    protected List<T> filterByActivationType(final List<T> entities, final boolean mailOnly) {
        if (logger.isTraceEnabled()) {
            logger.trace("filterByActivationType: entities = " + entities + " mailOnly = " + mailOnly);
        }
        // create an ordered map of "status" -> (ordered map of "activationType" -> entity)
        Map<ActivationType, LinkedHashMap<String, List<T>>> statusMap = new LinkedHashMap<ActivationType, LinkedHashMap<String, List<T>>>();
        Set<String> communicationTypeSet = new LinkedHashSet<String>(); // store types of entities
        DateMidnight nowDate = getNowDateMidnight();
        
        for (T entity : entities) {
            if (ActivationType.temporary.equals(entity.getActivationStatus())) {
                if (entity.getTemporaryStartDate() != null && entity.getTemporaryEndDate() != null && 
                    !nowDate.isBefore(new DateMidnight(entity.getTemporaryStartDate())) && !nowDate.isAfter(new DateMidnight(entity.getTemporaryEndDate()))) {
                    addToMap(statusMap, communicationTypeSet, ActivationType.temporary, entity);
                }
            } 
            else if (ActivationType.seasonal.equals(entity.getActivationStatus())) {
                SeasonalDateSpan dateSpan = new SeasonalDateSpan(entity.getSeasonalStartDate(), entity.getSeasonalEndDate());
                if (dateSpan.contains(nowDate.toDate())) {
                    addToMap(statusMap, communicationTypeSet, ActivationType.seasonal, entity);
                }
            } 
            else if (ActivationType.permanent.equals(entity.getActivationStatus())) {
                if (entity.getEffectiveDate() == null || !new DateMidnight(entity.getEffectiveDate()).isAfter(nowDate)) {
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
            if (seasonalMap != null && seasonalMap.get(communicationType) != null) {
                newList.addAll(seasonalMap.get(communicationType));
            } 
            if (permanentMap != null && permanentMap.get(communicationType) != null) {
                newList.addAll(permanentMap.get(communicationType));
            }
        }
        // If want only those accepting mail, then filter out no mail addresses
        for (Iterator<T> iterator = newList.iterator(); iterator.hasNext();) {
            T entity = iterator.next();
            if (mailOnly && !entity.isReceiveCorrespondence()) {
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

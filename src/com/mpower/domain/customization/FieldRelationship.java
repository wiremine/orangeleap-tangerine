package com.mpower.domain.customization;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.persistence.UniqueConstraint;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.mpower.domain.Site;
import com.mpower.type.RelationshipType;

@Entity
@Table(name = "FIELD_RELATIONSHIP", uniqueConstraints = { @UniqueConstraint(columnNames = { "SITE_NAME", "MASTER_FIELD_DEFINITION_ID", "DETAIL_FIELD_DEFINITION_ID" }) })
public class FieldRelationship implements Serializable {

    private static final long serialVersionUID = 1L;

    @SuppressWarnings("unused")
    @Transient
    private final Log logger = LogFactory.getLog(getClass());

    @Id
    @GeneratedValue
    @Column(name = "FIELD_RELATIONSHIP_ID")
    private Long id;

    @Column(name = "RELATIONSHIP_TYPE")
    @Enumerated(EnumType.STRING)
    private RelationshipType relationshipType;

    // For ONE_TO_MANY relationships, if this flag is true, the following rule prohibiting loops in the tree will be enforced:
    // User can't set the master (parent) field of an object to any of its children, or children's children, etc.
    // (Adding a new detail child will also check this rule for the child.)
    @Column(name = "CHECK_RECURSION")
    private boolean recursive;

    @ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @JoinColumn(name = "MASTER_FIELD_DEFINITION_ID", referencedColumnName = "FIELD_DEFINITION_ID")
    private FieldDefinition masterRecordField;

    @ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @JoinColumn(name = "DETAIL_FIELD_DEFINITION_ID", referencedColumnName = "FIELD_DEFINITION_ID")
    private FieldDefinition detailRecordField;

    @ManyToOne
    @JoinColumn(name = "SITE_NAME")
    private Site site;

	public void setId(Long id) {
		this.id = id;
	}

	public Long getId() {
		return id;
	}

	public void setRelationshipType(RelationshipType relationshipType) {
		this.relationshipType = relationshipType;
	}

	public RelationshipType getRelationshipType() {
		return relationshipType;
	}

	public void setRecursive(boolean recursive) {
		this.recursive = recursive;
	}

	public boolean isRecursive() {
		return recursive;
	}

	public void setMasterRecordField(FieldDefinition masterRecordField) {
		this.masterRecordField = masterRecordField;
	}

	public FieldDefinition getMasterRecordField() {
		return masterRecordField;
	}

	public void setDetailRecordField(FieldDefinition detailRecordField) {
		this.detailRecordField = detailRecordField;
	}

	public FieldDefinition getDetailRecordField() {
		return detailRecordField;
	}

	public void setSite(Site site) {
		this.site = site;
	}

	public Site getSite() {
		return site;
	}


 }

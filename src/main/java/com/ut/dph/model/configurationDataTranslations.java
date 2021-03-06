package com.ut.dph.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name="REL_CONFIGURATIONDATATRANSLATIONS")
public class configurationDataTranslations {
	
	@Transient
	String fieldName = null;
	
	@Transient
	String crosswalkName = null;
	
	@Transient
	String macroName = null;
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="ID", nullable = false)
	private int id;
	
	@Column(name="CONFIGID", nullable = false) 
	private int configId;
	
	@Column(name="TRANSPORTMETHOD", nullable = false)
	private int transportMethod;
	
	@Column(name="FIELDID", nullable = false) 
	private int fieldId;
	
	@Column(name="CROSSWALKID", nullable = false) 
	private int crosswalkId;
	
	@Column(name="MACROID", nullable = true)
	private int macroId;
	
	@Column(name="PASSCLEAR", nullable = true)
	private int passClear = 1;
	
	@Column(name="FIELDA", nullable = true)
	private String fieldA = null;
	
	@Column(name="FIELDB", nullable = true)
	private String fieldB = null;
	
	@Column(name="CONSTANT1", nullable = true)
	private String constant1 = null;
	
	@Column(name="CONSTANT2", nullable = true)
	private String constant2 = null;
	
	@Column(name="PROCESSORDER", nullable = false) 
	private int processOrder;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public int getconfigId() {
		return configId;
	}
	public void setconfigId(int configId) {
		this.configId = configId;
	}
	
	public int gettransportMethod() {
		return transportMethod;
	}
	
	public void settransportMethod(int transportMethod) {
		this.transportMethod = transportMethod;
	}
	
	public int getFieldId() {
		return fieldId;
	}
	public void setFieldId(int fieldId) {
		this.fieldId = fieldId;
	}

	public int getCrosswalkId() {
		return crosswalkId;
	}
	public void setCrosswalkId(int crosswalkId) {
		this.crosswalkId = crosswalkId;
	}
	
	public int getMacroId() {
		return macroId;
	}
	
	public void setMacroId(int macroId) {
		this.macroId = macroId;
	}
	
	public int getPassClear() {
		return passClear;
	}
	
	public void setPassClear(int passClear) {
		this.passClear = passClear;
	}
	
	public String getFieldA() {
		return fieldA;
	}
	
	public void setFieldA(String fieldA) {
		this.fieldA = fieldA;
	}
	
	public String getFieldB() {
		return fieldB;
	}
	
	public void setFieldB(String fieldB) {
		this.fieldB = fieldB;
	}
	
	public String getConstant1() {
		return constant1;
	}
	
	public void setConstant1(String constant1) {
		this.constant1 = constant1;
	}
	
	public String getConstant2() {
		return constant2;
	}
	
	public void setConstant2(String constant2) {
		this.constant2 = constant2;
	}
	
	public int getProcessOrder() {
		return processOrder;
	}
	public void setProcessOrder(int processOrder) {
		this.processOrder = processOrder;
	}
	
	public void setfieldName(String fieldName) {
		this.fieldName = fieldName;
	}
	
	public String getfieldName() {
		return fieldName;
	}
	
	public void setcrosswalkName(String crosswalkName) {
		this.crosswalkName = crosswalkName;
	}
	
	public String getcrosswalkName() {
		return crosswalkName;
	}
	
	public void setMacroName(String macroName) {
		this.macroName = macroName;
	}
	
	public String getMacroName() {
		return macroName;
	}

}

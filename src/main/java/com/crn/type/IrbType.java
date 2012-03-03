package com.crn.type;

public class IrbType implements java.io.Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L; 
	private Integer typeId;
	private Integer typeName;
	private Integer frequency;
	public Integer getTypeId() {
		return typeId;
	}
	public void setTypeId(Integer typeId) {
		this.typeId = typeId;
	}
	public Integer getTypeName() {
		return typeName;
	}
	public void setTypeName(Integer typeName) {
		this.typeName = typeName;
	}
	public Integer getFrequency() {
		return frequency;
	}
	public void setFrequency(Integer frequency) {
		this.frequency = frequency;
	}

}

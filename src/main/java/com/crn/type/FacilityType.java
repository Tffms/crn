package com.crn.type;

import java.io.Serializable;

public class FacilityType implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L; 
	
	private String typeName;
	private Integer typeId;
	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	public Integer getTypeId() {
		return typeId;
	}
	public void setTypeId(Integer typeId) {
		this.typeId = typeId;
	}

}

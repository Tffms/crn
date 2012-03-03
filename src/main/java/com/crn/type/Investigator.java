package com.crn.type;

import java.io.Serializable;

public class Investigator implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L; 
	private String name;
	private String subi;
	private String experience;
	private String area;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSubi() {
		return subi;
	}
	public void setSubi(String subi) {
		this.subi = subi;
	}
	public String getExperience() {
		return experience;
	}
	public void setExperience(String experience) {
		this.experience = experience;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}	

}

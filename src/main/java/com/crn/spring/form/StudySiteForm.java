package com.crn.spring.form;

import java.io.Serializable;

import com.crn.type.FacilityType;

public class StudySiteForm implements Serializable{
	
	/**
	 * 
	 */ 
	private static final long serialVersionUID = 1L;
	private String siteName;
	private String addressLine1;
	private String addressLine2;
	private String city;
	private String state;
	private String zip;
	private String phone;
	private String fax;
	private String email;
	private String website;
	private FacilityType facilityType;

	public String getAddressLine1() {
		return addressLine1;
	}
	public void setAddressLine1(String addressLine1) {
		this.addressLine1 = addressLine1;
	}
	public String getAddressLine2() {
		return addressLine2;
	}
	public void setAddressLine2(String addressLine2) {
		this.addressLine2 = addressLine2;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getZip() {
		return zip;
	}
	public void setZip(String zip) {
		this.zip = zip;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getFax() {
		return fax;
	}
	public void setFax(String fax) {
		this.fax = fax;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getWebsite() {
		return website;
	}
	public void setWebsite(String website) {
		this.website = website;
	}
	public String getSiteName() {
		return siteName;
	}
	public void setSiteName(String siteName) {
		this.siteName = siteName;
	}
	public FacilityType getFacilityType() {
		return facilityType;
	}
	public void setFacilityType(FacilityType facilityType) {
		this.facilityType = facilityType;
	}

}

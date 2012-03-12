package com.crn.spring.form;

import java.io.Serializable;
import java.util.List;

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

import com.crn.type.FacilityType;
import com.crn.type.Investigator;
import com.crn.type.IrbType;
import com.google.appengine.api.datastore.Key;

@PersistenceCapable
public class StudySiteForm implements Serializable{
	
	/**
	 * 
	 */ 
	
	private static final long serialVersionUID = 1L;
	@PrimaryKey
    @Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
    private Key key;
	
	@Persistent
	private String siteName;
	@Persistent
	private String addressLine1;
	@Persistent
	private String addressLine2;
	@Persistent
	private String city;
	@Persistent
	private String state;
	@Persistent
	private String zip;
	@Persistent
	private String phone;
	@Persistent
	private String fax;
	@Persistent
	private String email;
	@Persistent
	private String website;
	@Persistent
	private FacilityType facilityType;
	@Persistent
	private IrbType irbType;
	@Persistent
	private List<Investigator> investigators;
	@Persistent
	private List<String> specialisedAreas;

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
	public List<Investigator> getInvestigators() {
		return investigators;
	}
	public void setInvestigators(List<Investigator> investigators) {
		this.investigators = investigators;
	}
	public IrbType getIrbType() {
		return irbType;
	}
	public void setIrbType(IrbType irbType) {
		this.irbType = irbType;
	}
	public List<String> getSpecialisedAreas() {
		return specialisedAreas;
	}
	public void setSpecialisedAreas(List<String> specialisedAreas) {
		this.specialisedAreas = specialisedAreas;
	}
	public Key getKey() {
		return key;
	}
	public void setKey(Key key) {
		this.key = key;
	}

}

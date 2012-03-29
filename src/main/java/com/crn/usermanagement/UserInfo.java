package com.crn.usermanagement;

import java.io.Serializable;
import java.util.List;

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;
import javax.jdo.annotations.Unique;

import com.google.appengine.api.datastore.Key;

@PersistenceCapable
public class UserInfo implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L; 
	
	@PrimaryKey
    @Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
    private Key key;
	@Persistent
	@Unique(name="USERNAME_IDX")
	private String userName;
	@Persistent
	private String password;
	@Persistent
	private String firstName;
	@Persistent
	private String lastName;
	@Persistent
	private String email;
	@Persistent
	private List<String> authorities;
	
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	/**
	 * @return the userName
	 */
	public String getUserName() {
		return userName;
	}
	/**
	 * @param userName the userName to set
	 */
	public void setUserName(String userName) {
		this.userName = userName;
	}
	/**
	 * @return the password
	 */
	public String getPassword() {
		return password;
	}
	/**
	 * @param password the password to set
	 */
	public void setPassword(String password) {
		this.password = password;
	}
	/**
	 * @return the authorities
	 */
	public List<String> getAuthorities() {
		return authorities;
	}
	/**
	 * @param authorities the authorities to set
	 */
	public void setAuthorities(List<String> authorities) {
		this.authorities = authorities;
	}
	/**
	 * @return the key
	 */
	public Key getKey() {
		return key;
	}
	/**
	 * @param key the key to set
	 */
	public void setKey(Key key) {
		this.key = key;
	}

}

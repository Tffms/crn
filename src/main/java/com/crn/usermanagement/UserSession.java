package com.crn.usermanagement;

import java.io.Serializable;

public class UserSession implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public static enum AuthTypeEnum{ 
		GOOGLE, FACEBOOK
	}
	
	private AuthTypeEnum authTypeEnum;
	private String goh5Id;
	private UserInfo userInfo;

	public String getGoh5Id() {
		return goh5Id;
	}
	public void setGoh5Id(String goh5Id) {
		this.goh5Id = goh5Id;
	}
	public AuthTypeEnum getAuthTypeEnum() {
		return authTypeEnum;
	}
	public void setAuthTypeEnum(AuthTypeEnum authTypeEnum) {
		this.authTypeEnum = authTypeEnum;
	}
	public UserInfo getUserInfo() {
		return userInfo;
	}
	public void setUserInfo(UserInfo userInfo) {
		this.userInfo = userInfo;
	}


}

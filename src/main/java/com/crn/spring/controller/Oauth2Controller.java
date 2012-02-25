package com.crn.spring.controller;

import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.Type;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Logger;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.crn.usermanagement.UserInfo;
import com.crn.usermanagement.UserSession;
import com.crn.usermanagement.UserSession.AuthTypeEnum;
import com.google.api.client.auth.oauth2.draft10.AccessTokenResponse;
import com.google.api.client.googleapis.auth.oauth2.draft10.GoogleAccessTokenRequest.GoogleAuthorizationCodeGrant;
import com.google.api.client.googleapis.auth.oauth2.draft10.GoogleAuthorizationRequestUrl;
import com.google.api.client.http.HttpTransport;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.jackson.JacksonFactory;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

@Controller
@RequestMapping("/display")
public class Oauth2Controller {

	public static final java.util.logging.Logger log = Logger.getLogger(Oauth2Controller.class
			.getName());
	//public static final org.apache.log4j.Logger logger = org.apache.log4j.Logger.getLogger(Oauth2Controller.class);
	private static final String SCOPE = "https://www.googleapis.com/auth/userinfo.email";
	private static final String CALLBACK_URL = "http://www.galaxy-space.com/display/authRedirect.htm";
	private static final HttpTransport TRANSPORT = new NetHttpTransport();
	private static final JsonFactory JSON_FACTORY = new JacksonFactory();

	// FILL THESE IN WITH YOUR VALUES FROM THE API CONSOLE
	private static final String CLIENT_ID = "916376634676.apps.googleusercontent.com";
	private static final String CLIENT_SECRET = "BK3YU3NWk7YKRlx3L9p7UcHf";

	@RequestMapping("/googleLogin.htm")
	public String launchOauth() throws IOException {
		GoogleAuthorizationRequestUrl url = new GoogleAuthorizationRequestUrl();
		url.clientId = CLIENT_ID;
		url.scope = SCOPE;
		url.redirectUri = CALLBACK_URL;
		url.state = "/profile";
		url.responseType = "code";
		return "redirect:" + url.build();
	}
	
	@RequestMapping("/logout.htm")
	public String logout(HttpSession session){
		session.removeAttribute("userSession");
		return "crn.welcome";
	}
	
	@RequestMapping("/launch.htm") 
	public ModelAndView launchHome(HttpSession session){
		UserSession userSession = (UserSession) session.getAttribute("userSession");
		
		if(userSession != null){
			//logger.info(userSession.getUserInfo());
			return new ModelAndView("welcome");			
		} else{
			//logger.info("user session is null... ");
			return new ModelAndView("unauth_welcome");
		}
		
	}

	@RequestMapping("/authRedirect.htm")
	public ModelAndView handleRedirect(@RequestParam("code") String authorizationCode, HttpSession session)
			throws Exception {
		GoogleAuthorizationCodeGrant authRequest = new GoogleAuthorizationCodeGrant(TRANSPORT,
				JSON_FACTORY, CLIENT_ID, CLIENT_SECRET, authorizationCode, CALLBACK_URL);
		authRequest.useBasicAuthorization = false;
		AccessTokenResponse authResponse = authRequest.execute();
		Map<String, String> userInfoMap = getUserInfoMap(authResponse.accessToken);
		UserSession userSession = new UserSession();
		UserInfo userInfo = new UserInfo();
		if(authResponse.accessToken != null){			
			userInfo.setEmail(userInfoMap.get("email") );
			userInfo.setFirstName(userInfoMap.get("given_name"));
			userInfo.setLastName(userInfoMap.get("family_name"));
			userSession.setAuthTypeEnum(AuthTypeEnum.GOOGLE);
			userSession.setUserInfo(userInfo);
			session.setAttribute("userSession", userSession);
			return new ModelAndView("auth_success_close");
		}		
		System.out.println(authResponse.accessToken);
		return new ModelAndView("crn.welcome");
	}

	private Map<String, String> getUserInfoMap(String accessToken) throws Exception {
		InputStream input2 = new URL("https://www.googleapis.com/oauth2/v1/userinfo?access_token="
				+ accessToken).openStream();
		StringBuilder data2 = new StringBuilder();
		int c2;
		while ((c2 = input2.read()) != -1) {
			data2.append((char) c2);
		}
		Type resultMapType = new TypeToken<HashMap<String, String>>(){}.getType();
		Map<String, String> infoMap = new Gson().fromJson(data2.toString(), resultMapType);
		log.info(infoMap.toString());
		return infoMap;
	}
	
	@RequestMapping("/testPage.htm")
	public String testPage(){
		return "welcome";
	}

}

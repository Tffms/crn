package com.crn.spring.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.jdo.PersistenceManager;
import javax.jdo.PersistenceManagerFactory;
import javax.jdo.Query;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.crn.usermanagement.UserInfo;

@Controller
@SessionAttributes({"newUser"})
@RequestMapping("/public/register") 
public class UserController {
	
	@Autowired
	@Qualifier("authenticationManager") 
	AuthenticationManager authenticationManager;
	
	@Autowired
	@Qualifier("persistenceManagerFactory") 
	PersistenceManagerFactory persistenceManagerFactory;
	
	public static final org.apache.log4j.Logger logger = org.apache.log4j.Logger.getLogger(UserController.class);
			
	@RequestMapping("registerUser.htm") 
	public @ResponseBody String registerUser(@ModelAttribute("newUser") UserInfo user, HttpServletRequest request, HttpServletResponse response){
		logger.info("user " + user.getFirstName());
		List<String> authorities = new ArrayList<String>();
		authorities.add("ROLE_USER");
        user.setAuthorities(authorities);
        user.setEnabled(Boolean.TRUE);
        
        PersistenceManager manager = persistenceManagerFactory.getPersistenceManager();
        Query query = manager.newQuery(UserInfo.class);
		query.setFilter("userName == userNameParam");
		query.declareParameters("String userNameParam");
		List<UserInfo> userEntities = (List<UserInfo>) query.execute(user.getUserName());
		if(userEntities.size() > 0){
			// user already exists
			return "user name already exists .. ";
		}
        user = manager.makePersistent(user);
        user = manager.detachCopy(user);
        manager.close();
		UsernamePasswordAuthenticationToken authToken = new UsernamePasswordAuthenticationToken(user.getUserName(), user.getPassword());
		Authentication authentication = authenticationManager.authenticate(authToken);
		SecurityContextHolder.getContext().setAuthentication(authentication);
		StringBuilder registerResponse = new StringBuilder("success"); 
		/*registerResponse.append(",");
		
		SavedRequest savedReq = (SavedRequest) request.getSession().getAttribute(WebAttributes.SAVED_REQUEST); 
		String redirectSavedReq = savedReq.getRedirectUrl();
		registerResponse.append("redirect:" + redirectSavedReq);*/
		return registerResponse.toString();
	}
	
	@RequestMapping("showForm.htm")
	public ModelAndView showForm(){
		UserInfo user = new UserInfo();
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("newUser", user);
		return new ModelAndView("registrationForm", model);
	}
	
	public static void main(String... args){
		ApplicationContext ctx1 = new ClassPathXmlApplicationContext(""); 
		ApplicationContext ctx2 = (ApplicationContext) ctx1.getBean("ear.context");
		System.out.println(" application context found... " + ctx2);
	}
}

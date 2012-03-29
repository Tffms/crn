package com.crn.spring.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.jdo.PersistenceManager;
import javax.jdo.PersistenceManagerFactory;
import javax.jdo.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.crn.usermanagement.UserInfo;

@Controller
@RequestMapping("/admin/user") 
public class UserAccessController {
	
	public static final org.apache.log4j.Logger logger = org.apache.log4j.Logger.getLogger(UserAccessController.class);
	
	@Autowired
	@Qualifier("persistenceManagerFactory") 
	PersistenceManagerFactory persistenceManagerFactory;
	
	@RequestMapping("/showAllUsers.htm") 
	public ModelAndView showAllUsers(){
		PersistenceManager persistenceManager = persistenceManagerFactory.getPersistenceManager();
		Query query = persistenceManager.newQuery(UserInfo.class);
		List<UserInfo> userList = (List<UserInfo>) query.execute();
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("userList", userList);
		return new ModelAndView("userList", model);
	}
	
	@RequestMapping("/editStatus.htm") 
	public @ResponseBody String changeUserStatus(@RequestParam Long userId, @RequestParam Boolean status){
		logger.info("Status changed.. ");
		return "success";
	}
}

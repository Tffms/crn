package com.crn.spring.controller;

import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.crn.usermanagement.UserInfo;
import com.crn.usermanagement.UserModel;

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
	
	@RequestMapping(value = "/showAllUsersData.htm")
	public @ResponseBody Map<String, List<UserModel>> showAllUsersData(){
		PersistenceManager persistenceManager = persistenceManagerFactory.getPersistenceManager();
		Query query = persistenceManager.newQuery(UserInfo.class);
		List<UserInfo> userList = (List<UserInfo>) query.execute();
		userList = (List<UserInfo>) persistenceManager.detachCopyAll(userList); 
		List<UserModel> users = new ArrayList<UserModel>();
		Map<String , List<UserModel>> result = new HashMap<String, List<UserModel>>();
		for(UserInfo entity : userList){
			UserModel user = new UserModel();
			user.setEnabled(entity.getEnabled());
			user.setFirstName(entity.getFirstName());
			user.setUserName(entity.getUserName());
			user.setId(entity.getKey().getId());
			users.add(user);
		}
		result.put("items", users);
		return result; 
	}
	
	@RequestMapping("/editStatus.htm") 
	public @ResponseBody String changeUserStatus(@RequestParam("user_id") Long userId, @RequestParam("status") Boolean status){
		PersistenceManager persistenceManager = persistenceManagerFactory.getPersistenceManager();
		UserInfo userEntity = persistenceManager.getObjectById(UserInfo.class, userId);
		userEntity.setEnabled(status);
		persistenceManager.close();
		logger.info("Status changed.. ");
		return "success";
	}
}

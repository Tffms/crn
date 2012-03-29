package com.crn.spring.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.jdo.PersistenceManager;
import javax.jdo.PersistenceManagerFactory;
import javax.jdo.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.crn.spring.form.StudySiteForm;
import com.crn.usermanagement.UserInfo;


@Controller
@RequestMapping("/studysite/report") 
public class StudySiteReportController {
	
	@Autowired
	@Qualifier("persistenceManagerFactory") 
	PersistenceManagerFactory persistenceManagerFactory;
	
	@SuppressWarnings("unchecked")
	@RequestMapping("/viewAllForUser.htm") 
	public ModelAndView viewReport(){
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		UserInfo user = (UserInfo)authentication.getPrincipal();
		
		PersistenceManager persistenceManager = persistenceManagerFactory.getPersistenceManager();		
		Query query = persistenceManager.newQuery(StudySiteForm.class);
		
		query.setFilter("userInfoKey == userNameParam");
		query.declareParameters("String userNameParam");
		
		List<StudySiteForm> studySiteForms = (List<StudySiteForm>) query.execute(user.getKey()); 
		studySiteForms = (List<StudySiteForm>) persistenceManager.detachCopyAll(studySiteForms);
		persistenceManager.close();
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("studySites", studySiteForms);
		return new ModelAndView("studySites", model);
	}
	
	@RequestMapping("/info.htm") 
	public ModelAndView siteInfo(@RequestParam("siteId") String siteId){
		PersistenceManager persistenceManager = persistenceManagerFactory.getPersistenceManager();
		StudySiteForm studySite = persistenceManager.getObjectById(StudySiteForm.class, Long.valueOf(siteId));
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("studySite", studySite);
		return new ModelAndView("studySiteInfo", model); 
	}
}

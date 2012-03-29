package com.crn.spring.controller;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.jdo.PersistenceManager;
import javax.jdo.PersistenceManagerFactory;
import javax.jdo.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.core.io.ClassPathResource;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.crn.spring.form.StudySiteForm;
import com.crn.type.FacilityType;
import com.crn.usermanagement.UserInfo;

@Controller
@RequestMapping("/form/register")
@SessionAttributes({"studySite", "specialisedItems"})
public class StudySiteFormController {
	
	@Autowired
	@Qualifier("persistenceManagerFactory") 
	PersistenceManagerFactory persistenceManagerFactory;
	
	public static final org.apache.log4j.Logger logger = org.apache.log4j.Logger.getLogger(StudySiteFormController.class);
	
	@RequestMapping(value = "/viewStudySiteForm.htm", method = RequestMethod.GET)
	public ModelAndView showStudySiteForm() {
		StudySiteForm studySite = new StudySiteForm();
		FacilityType facilityType = new FacilityType();
		studySite.setFacilityType(facilityType);

		List<String> areas = new ArrayList<String>();
		try {
			Reader fileReader = new FileReader(new ClassPathResource("utils/specialisations.text").getFile());
			BufferedReader br = new BufferedReader(fileReader);
			String line = "";
			while ((line = br.readLine()) != null) {
				areas.add(line);
			}

		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("specialisedItems", areas);
		model.put("studySite", studySite);
		return new ModelAndView("studySiteForm", model);
	}
	
	@RequestMapping("/editForm.htm")
	public ModelAndView showFormForEdit(@ModelAttribute("studySite") StudySiteForm studySiteForm, @ModelAttribute("specialisedItems") List<String> splAreas){
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("specialisedItems", splAreas);
		model.put("studySite", studySiteForm);
		return new ModelAndView("studySiteForm", model);
	}
	
	@RequestMapping("/showSuccess.htm") 
	public ModelAndView showSuccessform(){		
		
		return new ModelAndView("studySiteFormSuccess");
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping("/confirmData.htm") 
	public ModelAndView showConfirmationScreen(@ModelAttribute("studySite") StudySiteForm studySiteForm){
		logger.info("site name is : "  + studySiteForm.getSiteName());
		logger.info(studySiteForm.getCity());
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		UserInfo user = (UserInfo)authentication.getPrincipal();
		PersistenceManager manager = persistenceManagerFactory.getPersistenceManager();
		logger.info(manager);
		Query query = manager.newQuery(UserInfo.class);
		query.setFilter("userName == userNameParam");
		query.declareParameters("String userNameParam");
		UserInfo userEntity = ((List<UserInfo>) query.execute(user.getUserName())).get(0); 
		logger.info("user key " + userEntity.getKey().getId());
		studySiteForm.setUserInfoKey(userEntity.getKey()); 
		
		studySiteForm = manager.makePersistent(studySiteForm);
		studySiteForm = manager.detachCopy(studySiteForm);
		manager.close();
		return new ModelAndView("redirect:/form/register/showSuccess.htm");
	}
	
	@RequestMapping(value = "/submitStudySiteForm.htm", method = RequestMethod.POST ) 
	public ModelAndView submitStudySiteForm(@ModelAttribute("studySite") StudySiteForm studySiteForm){		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("studySite", studySiteForm);
		return new ModelAndView("studySiteFormConfirm", model);
	}

}

package com.crn.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.crn.spring.form.StudySiteForm;
import com.crn.type.FacilityType;

@Controller
@RequestMapping("/form/register") 
@SessionAttributes("studySite")
public class StudySiteFormController {
	
	@RequestMapping(value="/viewStudySiteForm.htm", method = RequestMethod.GET)
	public ModelAndView showStudySiteForm(){
		StudySiteForm studySite = new StudySiteForm();
		FacilityType facilityType = new FacilityType();
		studySite.setFacilityType(facilityType);
		return new ModelAndView("studySiteForm", "studySite", studySite);
	}

}

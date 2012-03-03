package com.crn.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/public/home")
public class HomeController {
	
	@RequestMapping("index.htm") 
	public ModelAndView displayHome(){		
		return new ModelAndView("crn.welcome");
	}
	
	@RequestMapping("homePane.htm")
	public ModelAndView displayHomePane(){
		return new ModelAndView("crnWelcome");
	}
	
	@RequestMapping("whyUsPane.htm")
	public ModelAndView displayWhyUs(){
		return new ModelAndView("crnWhyUs"); 
	}
	
	@RequestMapping("crnFaqs.htm")
	public ModelAndView displayFaqs(){
		return new ModelAndView("crnFaqs"); 
	}
	
	@RequestMapping("crnAboutUs.htm")
	public ModelAndView displayAboutUs(){
		return new ModelAndView("crnAboutUs"); 
	}
	
	@RequestMapping("crnOutsourcing.htm")
	public ModelAndView displayOutsourcing(){
		return new ModelAndView("crnOutsourcing"); 
	}
	
	@RequestMapping("crnTraining.htm")
	public ModelAndView displayTraining(){
		return new ModelAndView("crntraining"); 
	}
	
	@RequestMapping("crnSupport.htm")
	public ModelAndView displaySupportServivce(){
		return new ModelAndView("supportService"); 
	}
	

	@RequestMapping("crnStaffing.htm")
	public ModelAndView displayStaffing(){
		return new ModelAndView("crnStaffing"); 
	}
	
	@RequestMapping("crnCILocationServices.htm")
	public ModelAndView displayCILocation(){
		return new ModelAndView("ciLocationServices"); 
	}
	
	@RequestMapping("revisedHome.htm") 
	public ModelAndView revisedView(){
		return new ModelAndView("revised.crn");
	}
	
}

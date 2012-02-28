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

}

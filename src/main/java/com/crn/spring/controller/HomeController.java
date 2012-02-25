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

}

package com.crn.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/user") 
public class UserController {
	
	@RequestMapping("login.htm")   
	public ModelAndView login(){
		return new ModelAndView("login");
	}
}

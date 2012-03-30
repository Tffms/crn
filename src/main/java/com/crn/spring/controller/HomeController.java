package com.crn.spring.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.crn.usermanagement.UserInfo;

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
	public ModelAndView revisedView(HttpServletRequest request){
		HttpSession session = request.getSession();
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		if(authentication.getPrincipal() instanceof UserInfo){
			UserInfo user = (UserInfo) authentication.getPrincipal();
			session.setAttribute("sessionUserName", user.getFirstName() + " " + user.getLastName());
		} else {
			session.setAttribute("sessionUserName", "Admin User");
		}
		
		return new ModelAndView("revised.crn");
	}
	
	@RequestMapping("pharmaHome.htm") 
	public ModelAndView pharmaHomeDisplay(){
		return new ModelAndView("pharmaHome");
	}
	
	@RequestMapping("outsourcingHome.htm")
	public ModelAndView outSourcingHome(){
		return new ModelAndView("crnOutsourcing"); 
	}
	
	@RequestMapping("userTest.htm")
	public ModelAndView outSourcingTest(){
		return new ModelAndView("crnOutsourcing"); 
	}
	
	@RequestMapping("trainingHome.htm") 
	public ModelAndView trainingHome(){
		return new ModelAndView("crntraining");
	}
	
	@RequestMapping("investigorHome.htm") 
	public ModelAndView investigatorServicesHome(){
		return new ModelAndView("investigatorServicesHome");
	}
	
	@RequestMapping("login.htm") 
	public ModelAndView login(){
		return new ModelAndView("login");
	}
	
}

package com.crn.spring.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/imagepane")
public class ImagePaneController {

	@RequestMapping("/staffing.htm")
	public ModelAndView renderStaffingImagePane(){
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("imageurl", "/static/images/home_pic1.png");
		return new ModelAndView("headerBlockImage", model);
	}
	
	@RequestMapping("/home.htm")
	public ModelAndView renderHomeImagePane(@RequestParam("tab") String selectedTab){
		Map<String, Object> model = new HashMap<String, Object>();
		if(selectedTab.equalsIgnoreCase("ABOUT_US")){
			//model.put("crnCycle", "/static/images/crn_cycle.png");
			model.put("imageurl", "/static/images/home_pic2.png");
		} else if(selectedTab.equalsIgnoreCase("FAQS")){
			model.put("imageurl", "/static/images/home_pic3.png");
		} else if(selectedTab.equalsIgnoreCase("PHARMA_HOME")){
			model.put("imageurl", "/static/images/home_pic4.png");
		}
		return new ModelAndView("headerBlockImage", model);
	}
}

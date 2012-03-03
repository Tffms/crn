package com.crn.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/imagepane")
public class ImagePaneController {

	@RequestMapping("/staffing.htm")
	public String renderStaffingImagePane(){
		return "headerBlockImage";
	}
}

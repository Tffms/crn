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

import org.springframework.core.io.ClassPathResource;
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

}

package com.bolgadd.member.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bolgadd.member.services.memberServices;

/**
 * Handles requests for the application home page.
 */
@Controller
public class memberController {
	
	@Autowired
	private memberServices memberServices;
	
	private static final Logger logger = LoggerFactory.getLogger(memberController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping("/home")
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		List<Map<String, Object>> list = memberServices.selectTest();
		
		Map<String, Object> map = list.get(0);
		
		model.addAttribute("list", map);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
}
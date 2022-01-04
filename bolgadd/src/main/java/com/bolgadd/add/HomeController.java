package com.bolgadd.add;

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

import com.bolgadd.services.testServices;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	private testServices testServices;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping("/home")
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		System.out.println(">>>>> 컨트롤러 진입");
		List<Map<String, Object>> list = testServices.selectTest();
		System.out.println(">>>>> list : " + list);
		
		System.out.println(">>>>> list.0.INDEX_ID : " + list.get(0).get("INDEX_ID"));
		
		Map<String, Object> map = list.get(0);
		
		model.addAttribute("list", map);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
}

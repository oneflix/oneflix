package com.main.oneflix.help.notice.client.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class NoticeController {
	
	
	@RequestMapping("/help.do")
	public ModelAndView help(ModelAndView mav) {
		mav.setViewName("help");
		return mav;
	}
}

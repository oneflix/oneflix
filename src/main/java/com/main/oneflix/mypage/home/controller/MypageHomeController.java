package com.main.oneflix.mypage.home.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.main.oneflix.watch.service.GetCountWatchGenreService;

@Controller
public class MypageHomeController {
	
		@Autowired
		GetCountWatchGenreService getCountWatchGenreService;
		
		@RequestMapping("/mypageHome.do")
		public ModelAndView mypageHome(ModelAndView mav) {
		mav.setViewName("mypageHome");
		return mav;
	}
}

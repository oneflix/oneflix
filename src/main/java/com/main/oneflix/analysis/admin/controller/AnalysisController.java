package com.main.oneflix.analysis.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.main.oneflix.analysis.service.GetCountAgeService;
import com.main.oneflix.analysis.service.GetCountGenderService;
import com.main.oneflix.analysis.service.GetCountPopularMovieService;
import com.main.oneflix.analysis.service.GetCountSubscriberService;
import com.main.oneflix.analysis.service.GetCountViewService;

@Controller
public class AnalysisController {
	
	@Autowired
	private GetCountAgeService getCountAgeService;
	@Autowired
	private GetCountGenderService getCountGenderService;
	@Autowired
	private GetCountPopularMovieService getCountPopularService;
	@Autowired
	private GetCountViewService getCountViewService;
	@Autowired
	private GetCountSubscriberService getCountSubscriberService;
	
	
	@RequestMapping("/getAnalysisProc.mdo")
	public ModelAndView getAnalysisListProc(ModelAndView mav) {
		mav.setViewName("analysis");
		return mav;
	}
	
	

}

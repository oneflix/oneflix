package com.main.oneflix.analysis.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.main.oneflix.analysis.service.AnalysisAgeService;
import com.main.oneflix.analysis.service.AnalysisGenderService;
import com.main.oneflix.analysis.service.AnalysisPopularMovieService;
import com.main.oneflix.analysis.service.AnalysisSalesService;
import com.main.oneflix.analysis.service.AnalysisSubscriberService;
import com.main.oneflix.analysis.service.AnalysisViewCountService;
import com.main.oneflix.sales.service.GetTotalSalesService;

@Controller
public class AnalysisController {

	@Autowired
	private AnalysisAgeService analysisAgeService;
	@Autowired
	private AnalysisGenderService analysisGenderService;
	@Autowired
	private AnalysisPopularMovieService analysisPopularMovieService;
	@Autowired
	private AnalysisViewCountService analysisViewCountService;
	@Autowired
	private AnalysisSubscriberService analysisSubscriberService;
	@Autowired
	private AnalysisSalesService analysisSalesService;

	@RequestMapping("/analysis.mdo")
	public ModelAndView analysis(ModelAndView mav) {
		mav.setViewName("analysis");
		return mav;
	}

	//매출분석
	@RequestMapping("/getAnalysisSalesProcAjax.mdo")
	@ResponseBody
	public Map<String, Object> getAnalysisSalesProcAjax(@RequestBody HashMap<String, Object> map) {
		return analysisSalesService.analysisSales(map);
	}
	
	@RequestMapping("/getAnalysisGenderProcAjax.mdo")
	@ResponseBody
	public Map<String, Object> getAnalysisGenderProcAjax(@RequestBody HashMap<String, Object> map) {
		return analysisGenderService.analysisGender(map);
	}
		
		
		


}

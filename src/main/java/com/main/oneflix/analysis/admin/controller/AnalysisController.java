package com.main.oneflix.analysis.admin.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.main.oneflix.analysis.service.AnalysisAgeService;
import com.main.oneflix.analysis.service.AnalysisGenderService;
import com.main.oneflix.analysis.service.AnalysisGenreCountService;
import com.main.oneflix.analysis.service.AnalysisGenreRankService;
import com.main.oneflix.analysis.service.AnalysisMovieRankService;
import com.main.oneflix.analysis.service.AnalysisSalesService;
import com.main.oneflix.analysis.service.AnalysisSubscriberService;


@Controller
public class AnalysisController {

	@Autowired
	private AnalysisAgeService analysisAgeService;
	@Autowired
	private AnalysisGenderService analysisGenderService;
	@Autowired
	private AnalysisSubscriberService analysisSubscriberService;
	@Autowired
	private AnalysisSalesService analysisSalesService;
	@Autowired
	private AnalysisMovieRankService analysisMovieRankService;
	@Autowired
	private AnalysisGenreRankService analysisGenreRankService;
	@Autowired
	private AnalysisGenreCountService analysisGenreCountService;

	@RequestMapping("/analysis.mdo")
	public ModelAndView analysis(ModelAndView mav) {
		mav.setViewName("analysis");
		return mav;
	}

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
	
	@RequestMapping("/analysisSubscriberProcAjax.mdo")
	@ResponseBody
	public Map<String, Object> analysisSubscriberProcAjax(@RequestBody HashMap<String, Object> map){
		return analysisSubscriberService.analysisSubscriberService(map);
	}
/*	
	@RequestMapping("/analysisMovieRankProcAjax.mdo")
	@ResponseBody
	public Map<String, Object> analysisMovieRankProcAjax(@RequestBody HashMap<String, Object> map){
		return analysisMovieRankService.analysisMovieRank(map);
	}
	
	@RequestMapping("/analysisGenreRankProcAjax.mdo")
	@ResponseBody
	public Map<String, Object> analysisGenreRankProcAjax(@RequestBody HashMap<String, Object> map){
		return analysisGenreRankService.analysisGenreRank(map);
	}
	
	@RequestMapping("/analysisGenreCountProcAjax.mdo")
	@ResponseBody
	public Map<String, Object> analysisGenreCountProcAjax(@RequestBody HashMap<String, Object> map){
		return analysisGenreCountService.analysisGenreCount(map);
	}
*/		
		
		


}

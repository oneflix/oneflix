package com.main.oneflix.analysis.admin.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.main.oneflix.analysis.service.AnalysisGenderService;
import com.main.oneflix.analysis.service.AnalysisGenreCountService;
import com.main.oneflix.analysis.service.AnalysisGenreRankingService;
import com.main.oneflix.analysis.service.AnalysisMemberAgeService;
import com.main.oneflix.analysis.service.AnalysisMovieRankingService;
import com.main.oneflix.analysis.service.AnalysisSalesService;
import com.main.oneflix.analysis.service.AnalysisSubscriberService;


@Controller
public class AnalysisController {

	@Autowired
	private AnalysisGenderService analysisGenderService;
	@Autowired
	private AnalysisSubscriberService analysisSubscriberService;
	@Autowired
	private AnalysisSalesService analysisSalesService;
	@Autowired
	private AnalysisMemberAgeService analysisMemberAgeService; 
	@Autowired
	private AnalysisMovieRankingService analysisMovieRankingService;
	@Autowired
	private AnalysisGenreRankingService analysisGenreRankingService;
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
	
	@RequestMapping("/getAnalysisSubscriberProcAjax.mdo")
	@ResponseBody
	public Map<String, Object> getAnalysisSubscriberProcAjax(@RequestBody HashMap<String, Object> map){
		return analysisSubscriberService.analysisSubscriber(map);
	}
	
	@RequestMapping("/getAnalysisMemberAgeProcAjax.mdo")
	@ResponseBody
	public Map<String, Object> getAnalysisMemberAgeProcAjax(@RequestBody HashMap<String, Object> map){
		return analysisMemberAgeService.analysisMemberAge(map);
	}
	
	@RequestMapping("/getAnalysisMovieRankingProcAjax.mdo")
	@ResponseBody
	public Map<String, Object> analysisMovieRankingProcAjax(@RequestBody HashMap<String, Object> map){
		return analysisMovieRankingService.analysisMovieRanking(map);
	}
	
	@RequestMapping("/getAnalysisGenreRankingProcAjax.mdo")
	@ResponseBody
	public Map<String, Object> analysisGenreRankingProcAjax(@RequestBody HashMap<String, Object> map){
		return analysisGenreRankingService.analysisGenreRanking(map);
	}

	@RequestMapping("/getAnalysisGenreCountProcAjax.mdo")
	@ResponseBody
	public Map<String, Object> analysisGenreCountProcAjax(@RequestBody HashMap<String, Object> map){
		return analysisGenreCountService.analysisGenreCount(map);
	}		
}

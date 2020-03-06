package com.main.oneflix.analysis.admin.controller;

import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.main.oneflix.analysis.service.GetCountAgeService;
import com.main.oneflix.analysis.service.GetCountGenderService;
import com.main.oneflix.analysis.service.GetCountPopularMovieService;
import com.main.oneflix.analysis.service.GetCountSubscriberService;
import com.main.oneflix.analysis.service.GetCountViewService;
import com.main.oneflix.member.vo.MemberVO;
import com.main.oneflix.movie.vo.MovieVO;

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

	@RequestMapping("/getAnalysisProcAjax.mdo")
	public JSONObject getAnalysisListProcAjax(MemberVO memberVO, MovieVO movieVO) {
		// 성별데이터
		Map<String, Integer> genderMap = getCountGenderService.getCountGender(memberVO);

		// 최종으로 넘길 데이터
		JSONObject data = new JSONObject();

		// col 추가
		JSONObject col1 = new JSONObject();
		JSONObject col2 = new JSONObject();
		// 위의 컬럼을 담을 배열
		JSONArray arrayCols = new JSONArray();
		JSONArray arrayRows = new JSONArray();
		col1.put("type", "string"); //여성,남성
		col2.put("type", "number"); //수
		arrayCols.add(col1);
		arrayCols.add(col2);

		return data;
	}

}

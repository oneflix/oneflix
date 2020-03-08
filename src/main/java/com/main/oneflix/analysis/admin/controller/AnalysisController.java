package com.main.oneflix.analysis.admin.controller;

import java.util.Iterator;
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
	public JSONObject getAnalysisProcAjax(MemberVO memberVO, MovieVO movieVO) {
		System.out.println("/getAnalysisProcAjax.mdo 요청 받음");
		// 최종으로 넘길 데이터
		// JSONArray analysisDatas = new JSONArray();

		// ==================성별데이터========================
		Map<String, Integer> genderMap = getCountGenderService.getCountGender(memberVO);

		JSONObject genderData = new JSONObject();

		// col 추가
		JSONObject col1 = new JSONObject();
		JSONObject col2 = new JSONObject();
		// 위의 컬럼을 담을 배열
		JSONArray arrayCols = new JSONArray();
		JSONArray arrayRows = new JSONArray();
		col1.put("type", "string"); // 여성,남성
		col2.put("type", "number"); // 수
		arrayCols.add(col1);
		arrayCols.add(col2);

		System.out.println("arrayCols.get(0)" + arrayCols.get(0));
		System.out.println("arrayCols.get(1)" + arrayCols.get(1));

		// map을 json으로
		// map에서 key와 Value 뽑아서 Row 추가하기
		// key: genreId value: watchCount
		Iterator<Map.Entry<String, Integer>> entries = genderMap.entrySet().iterator();
		while (entries.hasNext()) {
			System.out.println("Iterator while문 들어옴");
			Map.Entry<String, Integer> entry = entries.next();
			System.out.println("entry : " + entry);
			
			JSONObject legend = new JSONObject();
			legend.put("v", entry.getKey());
			legend.put("f", null);

			JSONObject value = new JSONObject();
			value.put("v", entry.getValue());
			value.put("f", null);

			JSONArray cValueArray = new JSONArray();
			cValueArray.add(legend);
			cValueArray.add(value);

			JSONObject cValueObject = new JSONObject();
			cValueObject.put("c", cValueArray);

			arrayRows.add(cValueObject);
		}
		genderData.put("cols", arrayCols);
		genderData.put("rows", arrayRows);

		// ==================/성별데이터========================

		// analysisDatas.add(genderData); //성별 JSONObj

		System.out.println("genderData : " + genderData);

		return genderData;
	}

}

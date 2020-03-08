package com.main.oneflix.analysis.admin.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.main.oneflix.analysis.service.GetCountAgeService;
import com.main.oneflix.analysis.service.GetCountGenderService;
import com.main.oneflix.analysis.service.GetCountPopularMovieService;
import com.main.oneflix.analysis.service.GetCountSubscriberService;
import com.main.oneflix.analysis.service.GetCountViewService;
import com.main.oneflix.member.vo.MemberVO;
import com.main.oneflix.movie.vo.MovieVO;
import com.main.oneflix.sales.service.GetSalesListService;
import com.main.oneflix.sales.service.GetTotalSalesService;
import com.main.oneflix.sales.vo.SalesVO;

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
	@Autowired
	private GetTotalSalesService getTotalSalesService;

	@RequestMapping("/getAnalysisProc.mdo")
	public ModelAndView getAnalysisListProc(ModelAndView mav) {
		mav.setViewName("analysis");
		return mav;
	}

	@RequestMapping("/getAnalysisProcAjax.mdo")
	@ResponseBody
	public Map<String, Object> getAnalysisProcAjax(@RequestParam ("dateList") List<String> dateList, MemberVO memberVO, MovieVO movieVO) {
		System.out.println("/getAnalysisProcAjax.mdo 요청 받음");
		// 최종으로 넘길 데이터
		// JSONArray analysisDatas = new JSONArray();
		
		// ==================매출데이터========================
		
		SalesVO salesVO = new SalesVO();
		List<Integer> totalSalesList = new ArrayList<Integer>();
		for (int i = 0; i<dateList.size(); i++) {
			salesVO.setStartDate(dateList.get(i) + "0101");
			salesVO.setStartDate(dateList.get(i) + "1231");
			totalSalesList.add(getTotalSalesService.getTotalSales(salesVO));
		}
		
		for (int i = 0; i<dateList.size(); i++) {
			salesVO.setStartDate(dateList.get(i) + "01");
			salesVO.setStartDate(dateList.get(i) + "31");
			totalSalesList.add(getTotalSalesService.getTotalSales(salesVO));
		}
		
		
		// ==================/매출데이터========================
		
		
		// ==================구독자데이터========================
		// ==================/구독자데이터========================

		
		
		
		// ==================성별데이터========================
		Map<String, Integer> genderMap = getCountGenderService.getCountGender(memberVO);

		JSONObject genderData = new JSONObject();

		// col 추가
		JSONObject genderCol1 = new JSONObject();
		JSONObject genderCol2 = new JSONObject();
		// 위의 컬럼을 담을 배열
		JSONArray genderCols = new JSONArray();
		JSONArray genderRows = new JSONArray();
		genderCol1.put("type", "string"); // 여성,남성
		genderCol2.put("type", "number"); // 수
		genderCols.add(genderCol1);
		genderCols.add(genderCol2);

		System.out.println("arrayCols.get(0)" + genderCols.get(0));
		System.out.println("arrayCols.get(1)" + genderCols.get(1));

		// map을 json으로
		// map에서 key와 Value 뽑아서 Row 추가하기
		// key: genreId value: watchCount
		Iterator<Map.Entry<String, Integer>> genderEntry = genderMap.entrySet().iterator();
		while (genderEntry.hasNext()) {
			System.out.println("Iterator while문 들어옴");
			Map.Entry<String, Integer> gender = genderEntry.next();
			System.out.println("entry : " + gender);
			
			JSONObject genderLegend = new JSONObject();
			genderLegend.put("v", gender.getKey());
			genderLegend.put("f", null);

			JSONObject genderValue = new JSONObject();
			genderValue.put("v", gender.getValue());
			genderValue.put("f", null);

			JSONArray cGenderValueArray = new JSONArray();
			cGenderValueArray.add(genderLegend);
			cGenderValueArray.add(genderValue);

			JSONObject cGenderValueObject = new JSONObject();
			cGenderValueObject.put("c", cGenderValueArray);

			genderRows.add(cGenderValueObject);
		}
		genderData.put("genderCols", genderCols);
		genderData.put("genderRows", genderRows);

		// ==================/성별데이터========================

		
		// ==================연령데이터========================
		Map<String, Integer> ageMap = getCountAgeService.getCountAge(memberVO);
		
		JSONObject ageData = new JSONObject();

		// col 추가
		JSONObject ageCol1 = new JSONObject();
		JSONObject ageCol2 = new JSONObject();
		// 위의 컬럼을 담을 배열
		JSONArray ageCols = new JSONArray();
		JSONArray ageRows = new JSONArray();
		ageCol1.put("type", "string"); // 여성,남성
		ageCol2.put("type", "number"); // 수
		ageCols.add(ageCol1);
		ageCols.add(ageCol2);

		// map을 json으로
		// map에서 key와 Value 뽑아서 Row 추가하기
		// key: genreId value: watchCount
		Iterator<Map.Entry<String, Integer>> ageEntries = ageMap.entrySet().iterator();
		while (ageEntries.hasNext()) {
			System.out.println("Iterator while문 들어옴");
			Map.Entry<String, Integer> age = ageEntries.next();
			System.out.println("entry : " + age);
			
			JSONObject ageLegend = new JSONObject();
			ageLegend.put("v", age.getKey());
			ageLegend.put("f", null);

			JSONObject ageValue = new JSONObject();
			ageValue.put("v", age.getValue());
			ageValue.put("f", null);

			JSONArray cAgeValueArray = new JSONArray();
			cAgeValueArray.add(ageLegend);
			cAgeValueArray.add(ageValue);

			JSONObject cAgeValueObject = new JSONObject();
			cAgeValueObject.put("c", cAgeValueArray);

			ageRows.add(cAgeValueObject);
		}
		ageData.put("cols", ageCols);
		ageData.put("rows", ageRows);
		
		// ==================/연령데이터========================
		
		// ==================누적조회순영화데이터========================
		
		// ==================/누적조회순영화데이터========================
		
		// ==================30일내 인기영화 데이터========================
		// ==================/30일내 인기영화 데이터========================
		
		
		// analysisDatas.add(genderData); //성별 JSONObj

		System.out.println("genderData : " + genderData);

		return genderData;
	}

}

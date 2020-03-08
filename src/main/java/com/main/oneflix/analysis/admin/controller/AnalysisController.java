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

	@RequestMapping("/getAnalysisProc.mdo")
	public ModelAndView getAnalysisListProc(ModelAndView mav) {
		mav.setViewName("analysis");
		return mav;
	}

	@RequestMapping("/getAnalysisSalesProcAjax.mdo")
	@ResponseBody
	public Map<String, Object> getAnalysisSalesProcAjax(@RequestBody HashMap<String, Object> map) {
		System.out.println("/getAnalysisSalesProcAjax.mdo 요청 받음");
		// 최종으로 넘길 데이터
		// JSONArray analysisDatas = new JSONArray();
		Map<String, Object> mapmap = analysisSalesService.analysisSales(map);
		System.out.println(mapmap);
		System.out.println(map);
		System.out.println(map.get("salesButton"));
		System.out.println(map.get("yearList"));
		List<String> list = (List<String>) map.get("yearList");
		for(String year : list) {
			System.out.println(year);
		}
		
//		System.out.println(salesButton);
//		for(String year : yearList) {
//			System.out.println(year);
//		}
//		
//		// ==================매출데이터========================
//		
//		SalesVO salesVO = new SalesVO();
//		List<Integer> totalSalesList = new ArrayList<Integer>();
//		for (int i = 0; i<yearList.size(); i++) {
//			salesVO.setStartDate(yearList.get(i) + "0101");
//			salesVO.setStartDate(yearList.get(i) + "1231");
//			totalSalesList.add(getTotalSalesService.getTotalSales(salesVO));
//		}
//		
//		for (int i = 0; i<yearList.size(); i++) {
//			salesVO.setStartDate(yearList.get(i) + "01");
//			salesVO.setStartDate(yearList.get(i) + "31");
//			totalSalesList.add(getTotalSalesService.getTotalSales(salesVO));
//		}
		
		
		// ==================/매출데이터========================
		
		
		// ==================구독자데이터========================
		// ==================/구독자데이터========================

		
		
		
//		// ==================성별데이터========================
//		Map<String, Integer> genderMap = getCountGenderService.getCountGender(memberVO);
//
//		JSONObject genderData = new JSONObject();
//
//		// col 추가
//		JSONObject genderCol1 = new JSONObject();
//		JSONObject genderCol2 = new JSONObject();
//		// 위의 컬럼을 담을 배열
//		JSONArray genderCols = new JSONArray();
//		JSONArray genderRows = new JSONArray();
//		genderCol1.put("type", "string"); // 여성,남성
//		genderCol2.put("type", "number"); // 수
//		genderCols.add(genderCol1);
//		genderCols.add(genderCol2);
//
//		System.out.println("arrayCols.get(0)" + genderCols.get(0));
//		System.out.println("arrayCols.get(1)" + genderCols.get(1));
//
//		// map을 json으로
//		// map에서 key와 Value 뽑아서 Row 추가하기
//		// key: genreId value: watchCount
//		Iterator<Map.Entry<String, Integer>> genderEntry = genderMap.entrySet().iterator();
//		while (genderEntry.hasNext()) {
//			System.out.println("Iterator while문 들어옴");
//			Map.Entry<String, Integer> gender = genderEntry.next();
//			System.out.println("entry : " + gender);
//			
//			JSONObject genderLegend = new JSONObject();
//			genderLegend.put("v", gender.getKey());
//			genderLegend.put("f", null);
//
//			JSONObject genderValue = new JSONObject();
//			genderValue.put("v", gender.getValue());
//			genderValue.put("f", null);
//
//			JSONArray cGenderValueArray = new JSONArray();
//			cGenderValueArray.add(genderLegend);
//			cGenderValueArray.add(genderValue);
//
//			JSONObject cGenderValueObject = new JSONObject();
//			cGenderValueObject.put("c", cGenderValueArray);
//
//			genderRows.add(cGenderValueObject);
//		}
//		genderData.put("genderCols", genderCols);
//		genderData.put("genderRows", genderRows);
//
//		// ==================/성별데이터========================
//
//		
//		// ==================연령데이터========================
//		Map<String, Integer> ageMap = getCountAgeService.getCountAge(memberVO);
//		
//		JSONObject ageData = new JSONObject();
//
//		// col 추가
//		JSONObject ageCol1 = new JSONObject();
//		JSONObject ageCol2 = new JSONObject();
//		// 위의 컬럼을 담을 배열
//		JSONArray ageCols = new JSONArray();
//		JSONArray ageRows = new JSONArray();
//		ageCol1.put("type", "string"); // 여성,남성
//		ageCol2.put("type", "number"); // 수
//		ageCols.add(ageCol1);
//		ageCols.add(ageCol2);
//
//		// map을 json으로
//		// map에서 key와 Value 뽑아서 Row 추가하기
//		// key: genreId value: watchCount
//		Iterator<Map.Entry<String, Integer>> ageEntries = ageMap.entrySet().iterator();
//		while (ageEntries.hasNext()) {
//			System.out.println("Iterator while문 들어옴");
//			Map.Entry<String, Integer> age = ageEntries.next();
//			System.out.println("entry : " + age);
//			
//			JSONObject ageLegend = new JSONObject();
//			ageLegend.put("v", age.getKey());
//			ageLegend.put("f", null);
//
//			JSONObject ageValue = new JSONObject();
//			ageValue.put("v", age.getValue());
//			ageValue.put("f", null);
//
//			JSONArray cAgeValueArray = new JSONArray();
//			cAgeValueArray.add(ageLegend);
//			cAgeValueArray.add(ageValue);
//
//			JSONObject cAgeValueObject = new JSONObject();
//			cAgeValueObject.put("c", cAgeValueArray);
//
//			ageRows.add(cAgeValueObject);
//		}
//		ageData.put("cols", ageCols);
//		ageData.put("rows", ageRows);
//		
//		// ==================/연령데이터========================
//		
//		// ==================누적조회순영화데이터========================
//		
//		// ==================/누적조회순영화데이터========================
//		
//		// ==================30일내 인기영화 데이터========================
//		// ==================/30일내 인기영화 데이터========================
//		
//		
//		// analysisDatas.add(genderData); //성별 JSONObj
//
//		System.out.println("genderData : " + genderData);

		return null;
	}

}

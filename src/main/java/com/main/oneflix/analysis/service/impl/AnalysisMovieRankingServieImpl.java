package com.main.oneflix.analysis.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.oneflix.analysis.dao.AnalysisDAO;
import com.main.oneflix.analysis.service.AnalysisMovieRankingService;

@Service
public class AnalysisMovieRankingServieImpl implements AnalysisMovieRankingService {

	@Autowired
	private AnalysisDAO analysisDAO;
	
	@Override
	public Map<String, Object> analysisMovieRanking(Map<String, Object> map) {
		Map<String, Object> response = new HashMap<>();
		String rankingSelect = (String) map.get("rankingSelect");
		
		Map<String,String> dbMap = new HashMap<>();
		String rankingYear = (String) map.get("rankingYear");
		String rankingMonth = (String) map.get("rankingMonth");
		String yearPlusOne = Integer.toString(Integer.parseInt(rankingYear)+1);
		String monthPlusOne = Integer.toString(Integer.parseInt(rankingMonth)+1);
		if (Integer.parseInt(rankingMonth) < 10) {
			rankingMonth = "0"+ rankingMonth;
			if (Integer.parseInt(rankingMonth) < 9) {
				monthPlusOne = "0"+ monthPlusOne;
			}
		}
		
		if(rankingSelect.equals("year")) {
				dbMap.put("startDate", (rankingYear + "0101"));
				dbMap.put("endDate", (yearPlusOne + "0101"));
				response.put(rankingYear, analysisDAO.analysisMovieRanking(dbMap));
		
		} else {	
				dbMap.put("startDate", (rankingYear + rankingMonth + "01"));
				if (Integer.parseInt(rankingMonth) == 12) {
					dbMap.put("endDate", (yearPlusOne  + "0101"));
				} else if (Integer.parseInt(rankingMonth) == 9) {
					dbMap.put("endDate", (rankingYear + "1001"));
				} else {
					dbMap.put("endDate", (rankingYear + monthPlusOne + "01"));
				}
				response.put(rankingYear+rankingMonth, analysisDAO.analysisMovieRanking(dbMap));	
		}
		// 최종으로 넘길 데이터
		JSONObject data = new JSONObject();

		// col 추가
		JSONObject col1 = new JSONObject();
		JSONObject col2 = new JSONObject();
		// 위의 컬럼을 담을 배열
		JSONArray arrayCols = new JSONArray();
		JSONArray arrayRows = new JSONArray();
		
		col1.put("type", "string");
		col2.put("type","number");
		
		arrayCols.add(col1);
		arrayCols.add(col2);

		    for (Map<String, Object> valueMap : analysisDAO.analysisMovieRanking(dbMap)) {
				// map을 json으로
				// map에서 key와 Value 뽑아서 Row 추가하기
				// key: genreId value: watchCount

					JSONObject legend = new JSONObject();
					legend.put("v", valueMap.get("movieTitle"));
					legend.put("f", null);

					JSONObject value = new JSONObject();
					value.put("v", valueMap.get("count"));
					value.put("f", null);

					JSONArray cValueArry = new JSONArray();
					cValueArry.add(legend);
					cValueArry.add(value);

					JSONObject cValueObj = new JSONObject();
					cValueObj.put("c", cValueArry);

					arrayRows.add(cValueObj);
				}
				data.put("cols", arrayCols);
				data.put("rows", arrayRows);
		return data;
	}
}


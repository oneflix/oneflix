package com.main.oneflix.analysis.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		@SuppressWarnings("unchecked")
		List<String> yearList = (List<String>) map.get("yearList");
		@SuppressWarnings("unchecked")
		List<String> monthList = (List<String>) map.get("monthList");
		
		Map<String,String> dbMap = new HashMap<>();
		
		if(rankingSelect.equals("year")) {
			for(String year : yearList) {
				dbMap.put("startDate", (year + "0101"));
				String yearPlusOne = Integer.toString(Integer.parseInt(year)+1);
				dbMap.put("endDate", (yearPlusOne + "0101"));
				response.put(year, analysisDAO.analysisMovieRankingYear(dbMap));
			}
		}else {	
			for(String year : yearList) {
				for(String month : monthList) {
					if (Integer.parseInt(month) < 10) {
						month = "0"+ month;
					}
				dbMap.put("startDate", (year + month + "01"));
				if (Integer.parseInt(month) == 9) {
						dbMap.put("endDate", (year + "1001"));
					} else if (Integer.parseInt(month) == 12) {
						String yearPlusOne = Integer.toString(Integer.parseInt(year)+1);
						dbMap.put("endDate", (yearPlusOne  + "0101"));
					} else {
					String monthPlusOne = Integer.toString(Integer.parseInt(month)+1);
					dbMap.put("endDate", (year + monthPlusOne + "01"));
					}
				response.put(month, analysisDAO.analysisMovieRankingMonth(dbMap));	
				}
			}
		}
		return response;
	}
}


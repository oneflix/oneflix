package com.main.oneflix.analysis.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.oneflix.analysis.dao.AnalysisDAO;
import com.main.oneflix.analysis.service.AnalysisGenreRankingService;

@Service
public class AnalysisGenreRankingServiceImpl implements AnalysisGenreRankingService {
	
	@Autowired
	private AnalysisDAO analysisDAO;
	
	@Override
	public Map<String, Object> analysisGenreRanking(Map<String, Object> map) {
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
				response.put(rankingYear, analysisDAO.analysisGenreRanking(dbMap));
		
		} else {	
				dbMap.put("startDate", (rankingYear + rankingMonth + "01"));
				if (Integer.parseInt(rankingMonth) == 12) {
					dbMap.put("endDate", (yearPlusOne  + "0101"));
				} else if (Integer.parseInt(rankingMonth) == 9) {
					dbMap.put("endDate", (rankingYear + "1001"));
				} else {
					dbMap.put("endDate", (rankingYear + monthPlusOne + "01"));
				}
				response.put(rankingYear+rankingMonth, analysisDAO.analysisGenreRanking(dbMap));	
		}
		return response;
	}
}


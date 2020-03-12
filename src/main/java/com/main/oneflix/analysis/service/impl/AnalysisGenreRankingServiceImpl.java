package com.main.oneflix.analysis.service.impl;

import java.util.HashMap;
import java.util.List;
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
		String year = (String) map.get("year");
		String month = (String) map.get("month");
		
		if(rankingSelect.equals("year")) {
				dbMap.put("startDate", (year + "0101"));
				String yearPlusOne = Integer.toString(Integer.parseInt(year)+1);
				dbMap.put("endDate", (yearPlusOne + "0101"));
				response.put(year, analysisDAO.analysisGenreRankingYear(dbMap));
		}else {	
				if (Integer.parseInt(month) < 10) {
						month = "0"+ month;
						dbMap.put("startDate", (year + month + "01"));
					}
				if (Integer.parseInt(month) == 9) {
						dbMap.put("endDate", (year + "1001"));
					} else if (Integer.parseInt(month) == 12) {
						String yearPlusOne = Integer.toString(Integer.parseInt(year)+1);
						dbMap.put("endDate", (yearPlusOne  + "0101"));
					} else {
					String monthPlusOne = Integer.toString(Integer.parseInt(month)+1);
					dbMap.put("endDate", (year + monthPlusOne + "01"));
					}
				response.put(month, analysisDAO.analysisGenreRankingMonth(dbMap));	
			}
		System.out.println("GenreRanking response : "+response);
		return response;
	}
}


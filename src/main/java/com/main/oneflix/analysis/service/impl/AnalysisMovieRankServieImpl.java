package com.main.oneflix.analysis.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.oneflix.analysis.dao.AnalysisDAO;
import com.main.oneflix.analysis.service.AnalysisMovieRankService;

@Service
public class AnalysisMovieRankServieImpl implements AnalysisMovieRankService {

	@Autowired
	private AnalysisDAO analysisDAO;
	
	@Override
	public Map<String, Object> analysisMovieRank(Map<String, Object> map) {
		Map<String, Object> response = new HashMap<>();
		String movieRankSelect = (String) map.get("movieRankSelect");
		@SuppressWarnings("unchecked")
		List<String> yearList = (List<String>) map.get("yearList");
		
		Map<String,String> dbMap = new HashMap<String, String>();
		if(movieRankSelect.equals("year")) {
			for(String year : yearList) {
				dbMap.put("startDate", (year + "0101"));
				String yearPlusOne = Integer.toString(Integer.parseInt(year)+1);
				dbMap.put("endDate", (yearPlusOne + "0101"));
				response.put(key, value)
			}
		}
		
		
		return response;
	}

}

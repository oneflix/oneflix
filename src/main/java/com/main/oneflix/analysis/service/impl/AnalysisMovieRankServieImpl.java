package com.main.oneflix.analysis.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.oneflix.analysis.dao.AnalysisDAO;
import com.main.oneflix.analysis.service.AnalysisMovieRankService;
import com.main.oneflix.movie.vo.MovieVO;

@Service
public class AnalysisMovieRankServieImpl implements AnalysisMovieRankService {

	@Autowired
	private AnalysisDAO analysisDAO;
	
	@Override
	public Map<String, Object> analysisMovieRank(Map<String, Object> map) {
		Map<String, Object> response = new HashMap<>();
//		String movieRankSelect = (String) map.get("movieRankSelect");
//		@SuppressWarnings("unchecked")
//		List<String> yearList = (List<String>) map.get("yearList");
//		MovieVO vo = new MovieVO();
//		Map<String,String> dbMap = new HashMap<String, String>();
//		if(movieRankSelect.equals("year")) {
//			for(String year : yearList) {
//				dbMap.put("startDate", (year + "0101"));
//				String yearPlusOne = Integer.toString(Integer.parseInt(year)+1);
//				dbMap.put("endDate", (yearPlusOne + "0101"));
//				response.put(year, analysisDAO.analysisMovieRankYear(dbMap));
//			}
//		} else {
//			
//			for(String year : yearList) {
//				dbMap.put("startDate", (year + "0101"));
//				String yearPlusOne = Integer.toString(Integer.parseInt(year));
//				dbMap.put("endDate", (yearPlusOne + "0101"));
//				List<List<Map<String, Object>>> tmpList = new ArrayList<>();
//				for(int i = 1; i <= 12; i++) {
//					Map<String, Object> tmpMap = new HashMap<>();
//					tmpMap.put("count", 0);
//					tmpMap.put("movieTitle", String.valueOf(i));
//					tmpMap.put("watchDate", String.valueOf(i));
//					tmpList.add(i-1, tmpMap);
//				}
//				
//				
//			}
//				
//		}
		
		
		return response;
	}

}

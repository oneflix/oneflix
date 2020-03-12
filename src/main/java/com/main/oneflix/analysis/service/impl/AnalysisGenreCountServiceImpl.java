package com.main.oneflix.analysis.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.oneflix.analysis.dao.AnalysisDAO;
import com.main.oneflix.analysis.service.AnalysisGenreCountService;

@Service
public class AnalysisGenreCountServiceImpl implements AnalysisGenreCountService {
	@Autowired
	private AnalysisDAO analysisDAO;
	@Override
	public Map<String, Object> analysisGenreCount(Map<String, Object> map) {
		Map<String, Object> response = new HashMap<>();
		response.put("GenreCount",analysisDAO.analysisGenreCount(map));
		return response;
	}

}

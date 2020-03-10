package com.main.oneflix.analysis.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.oneflix.analysis.dao.AnalysisDAO;
import com.main.oneflix.analysis.service.AnalysisGenreRankService;

@Service
public class AnalysisGenreRankServiceImpl implements AnalysisGenreRankService {
	
	@Autowired
	private AnalysisDAO analysisDAO;
	@Override
	public Map<String, Object> analysisGenreRank(Map<String, Object> map) {
		Map<String, Object> response = new HashMap<>();
		// TODO Auto-generated method stub
		return response;
	}

}

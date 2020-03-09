package com.main.oneflix.analysis.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.oneflix.analysis.dao.AnalysisDAO;
import com.main.oneflix.analysis.service.AnalysisSubscriberService;
import com.main.oneflix.sales.vo.SalesVO;

@Service
public class AnalysisSubscriberServiceImpl implements AnalysisSubscriberService {
	
	@Autowired
	private AnalysisDAO analysisDAO;

	@Override
	public Map<String, Object> analysisSubscriberService(Map<String, Object> map) {
		Map<String, Object> response = new HashMap<String, Object>();
		
		return response;
	}

}

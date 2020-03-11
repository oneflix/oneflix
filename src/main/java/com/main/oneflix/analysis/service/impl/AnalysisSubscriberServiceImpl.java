package com.main.oneflix.analysis.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
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
	public Map<String, Object> analysisSubscriber(Map<String, Object> map) {
		Map<String, Object> response = new HashMap<String, Object>();
		String subscriberButton = (String) map.get("subscriberButton");
		@SuppressWarnings("unchecked")
		List<String> yearList = (List<String>) map.get("yearList");
		SalesVO sales = new SalesVO();
		
		if(subscriberButton.equals("year")) {
			for(String year : yearList) {
				sales.setStartDate(year+"0101");
				String yearPlusOne = Integer.toString(Integer.parseInt(year) + 1);
				sales.setEndDate(yearPlusOne+"0101");
				response.put(year, analysisDAO.analysisSubscriberYear(sales));
			}
		}else {
			for(String year : yearList) {
				sales.setStartDate(year + "0101");
				String yearPlusOne = Integer.toString(Integer.parseInt(year) + 1);
				sales.setEndDate(yearPlusOne + "0101");
				List<Map<String, Object>> tmpList = new ArrayList<Map<String,Object>>();
				tmpList = analysisDAO.analysisSubscriberTicket(sales);
				response.put(year, tmpList);
			}
		}
		return response;
	}

}

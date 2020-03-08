package com.main.oneflix.analysis.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.oneflix.analysis.dao.AnalysisDAO;
import com.main.oneflix.analysis.service.AnalysisSalesService;
import com.main.oneflix.sales.vo.SalesVO;

@Service
public class AnalysisSalesServiceImpl implements AnalysisSalesService{
	
	@Autowired
	private AnalysisDAO analysisDAO;

	@Override
	public Map<String, Object> analysisSales(Map<String, Object> map) {
		Map<String, Object> response = new HashMap<>();
		String salesButton = (String) map.get("salesButton");
		@SuppressWarnings("unchecked")
		List<String> yearList = (List<String>) map.get("yearList");
		Map<String, List<Map<String, Integer>>> monthSalesMap = new HashMap<String, List<Map<String,Integer>>>();;
		SalesVO sales = new SalesVO();
		if(salesButton.equals("year")) {
			for(String year : yearList) {
				sales.setStartDate(year + "0101");
				String yearPlusOne = Integer.toString(Integer.parseInt(year) + 1);
				sales.setEndDate(yearPlusOne+"0101");
				response.put(year, analysisDAO.analysisSalesYear(sales));
			}
		}else {
			for(String year : yearList) {
				sales.setStartDate(year + "0101");
				String yearPlusOne = Integer.toString(Integer.parseInt(year) + 1);
				sales.setEndDate(yearPlusOne+"0101");
				monthSalesMap.put(year, analysisDAO.analysisSalesMonth(sales));
				System.out.println("service에서 monthSalesMap : " + monthSalesMap);
			}
		}
		
		
		return response;
	}

}

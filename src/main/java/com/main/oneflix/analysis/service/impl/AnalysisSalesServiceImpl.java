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
	            List<Map<String, Object>> tmpList = new ArrayList<>();
	            for (int i = 1; i <= 12; i++) {
	               Map<String, Object> tmpMap = new HashMap<>();
	               tmpMap.put("totalSales", 0);
	               tmpMap.put("paymentDate", String.valueOf(i));
	               tmpList.add(i-1, tmpMap);
	            }
	            
	            List<Map<String, Object>> monthList = analysisDAO.analysisSalesMonth(sales);
	            for (int i = 0; i < monthList.size(); i++) {
	               for (int j = 0; j < tmpList.size(); j++) {
	                  if (monthList.get(i).get("paymentDate").equals(
	                        tmpList.get(j).get("paymentDate"))) {
	                     tmpList.remove(j);
	                     tmpList.add(j, monthList.get(i));
	                     break;
	                  }
	               }
	            }
	            
	            response.put(year, tmpList);
	         }
		}
		
		return response;
	}

}

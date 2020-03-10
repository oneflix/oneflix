package com.main.oneflix.analysis.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.oneflix.analysis.dao.AnalysisDAO;
import com.main.oneflix.analysis.service.AnalysisGenderService;

@Service
public class AnalysisGenderServiceImpl implements AnalysisGenderService {
	
	@Autowired
	private AnalysisDAO analysisDAO;

	@Override
	public Map<String, Object> analysisGender(Map<String, Object> map) {
		Map<String, Object> response = new HashMap<>();
		String genderButton = (String) map.get("genderButton");
		@SuppressWarnings("unchecked")
		List<String> yearList = (List<String>) map.get("yearList");

		Map<String, String> dbMap = new HashMap<>();
		if(genderButton.equals("year")) {
			for(String year : yearList) {
				dbMap.put("startDate", (year + "0101"));
				String yearPlusOne = Integer.toString(Integer.parseInt(year) + 1);
				dbMap.put("endDate", (yearPlusOne + "0101"));
				response.put(year, analysisDAO.analysisGenderYear(dbMap));
				System.out.println(response);
			}
		}else {
			
//			for(String year : yearList) {
//				dbMap.put("startDate", (year + "0101"));
//	            String yearPlusOne = Integer.toString(Integer.parseInt(year) + 1);
//	            dbMap.put("endDate", (yearPlusOne + "0101"));
//	            List<Map<String, Object>> tmpList = new ArrayList<>();
//	            for (int i = 1; i <= 12; i++) {
//	               Map<String, Object> tmpMap = new HashMap<>();
//	               tmpMap.put("totalSales", 0);
//	               tmpMap.put("paymentDate", String.valueOf(i));
//	               tmpList.add(i-1, tmpMap);
//	            }
//	            
//	            List<Map<String, Object>> monthList = analysisDAO.analysisSalesMonth(sales);
//	            for (int i = 0; i < monthList.size(); i++) {
//	               for (int j = 0; j < tmpList.size(); j++) {
//	                  if (monthList.get(i).get("paymentDate").equals(
//	                        tmpList.get(j).get("paymentDate"))) {
//	                     tmpList.remove(j);
//	                     tmpList.add(j, monthList.get(i));
//	                     break;
//	                  }
//	               }
//	            }
//	            
//	            response.put(year, tmpList);
//	         }
		}
		
		return response;
	}

}

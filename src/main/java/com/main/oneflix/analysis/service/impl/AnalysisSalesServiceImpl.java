package com.main.oneflix.analysis.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.oneflix.analysis.service.AnalysisSalesService;
import com.main.oneflix.sales.dao.SalesDAO;
import com.main.oneflix.sales.vo.SalesVO;

@Service
public class AnalysisSalesServiceImpl implements AnalysisSalesService{
	
	@Autowired
	private SalesDAO salesDAO;

	@Override
	public Map<String, Object> analysisSales(Map<String, Object> map) {
		Map<String, Object> salesMap = new HashMap<String, Object>();
		String salesButton = (String) map.get("salesButton");
		@SuppressWarnings("unchecked")
		List<String> yearList = (List<String>) map.get("yearList");
		List<Integer> salesList = new ArrayList<Integer> ();
		SalesVO sales = new SalesVO();
		if(salesButton.equals("year")) {
			for(String year : yearList) {
				sales.setStartDate(year + "0101");
				sales.setEndDate(year + "1231");
				salesList.addAll(salesDAO.analysisSalesYear(map));
			}
		}else {
			for(String year : yearList) {
				sales.setStartDate(year + "0101");
				String yearPlusOne = Integer.toString(Integer.parseInt(year) + 1);
				sales.setEndDate(yearPlusOne+"1231");
				salesList.addAll(salesDAO.analysisSalesMonth(map));
			}
		}
		for(int i = 0; i<salesList.size(); i++) {
			int year = Integer.parseInt(sales.getStartDate());
			salesMap.put(Integer.toString(year+i),salesList.get(i));
		}
		
		return salesMap;
	}

}

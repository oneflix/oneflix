package com.main.oneflix.analysis.service.impl;

import java.util.ArrayList;
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
		if (genderButton.equals("year")) {
			for (String year : yearList) {
				dbMap.put("startDate", (year + "0101"));
				String yearPlusOne = Integer.toString(Integer.parseInt(year) + 1);
				dbMap.put("endDate", (yearPlusOne + "0101"));
				response.put(year, analysisDAO.analysisGenderYear(dbMap));
			}
		} else {

			for (String year : yearList) {
				dbMap.put("startDate", (year + "0101"));
				String yearPlusOne = Integer.toString(Integer.parseInt(year) + 1);
				dbMap.put("endDate", (yearPlusOne + "0101"));
				List<List<Map<String, Object>>> tmpList = new ArrayList<>();
				for (int i = 1; i <= 12; i++) {
					List<Map<String, Object>> genderBox = new ArrayList<>();
					Map<String, Object> tmpFemaleMap = new HashMap<>();
					tmpFemaleMap.put("count", 0);
					tmpFemaleMap.put("gender", "F");
					tmpFemaleMap.put("joinDate", String.valueOf(i));
					
					Map<String, Object> tmpMaleMap = new HashMap<>();
					tmpMaleMap.put("count", 0);
					tmpMaleMap.put("gender", "M");
					tmpMaleMap.put("joinDate", String.valueOf(i));
					
					genderBox.add(0, tmpFemaleMap);
					genderBox.add(1, tmpMaleMap);
					tmpList.add(i - 1, genderBox);
				}

				List<Map<String, Object>> genderList = analysisDAO.analysisGenderMonth(dbMap);
				for (int i = 0; i < genderList.size(); i++) {
					for (int j = 0; j < tmpList.size(); j++) {
						if (genderList.get(i).get("joinDate").equals(tmpList.get(j).get(0).get("joinDate"))
								&& genderList.get(i).get("gender").equals(tmpList.get(j).get(0).get("gender"))) {
							tmpList.get(j).remove(0);
							tmpList.get(j).add(0, genderList.get(i));
							break;
						} else if (genderList.get(i).get("joinDate").equals(tmpList.get(j).get(1).get("joinDate"))
									&& genderList.get(i).get("gender").equals(tmpList.get(j).get(1).get("gender"))) {
							tmpList.get(j).remove(1);
							tmpList.get(j).add(1, genderList.get(i));
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

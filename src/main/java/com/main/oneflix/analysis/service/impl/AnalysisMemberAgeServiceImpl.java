package com.main.oneflix.analysis.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.oneflix.analysis.dao.AnalysisDAO;
import com.main.oneflix.analysis.service.AnalysisMemberAgeService;

@Service
<<<<<<< HEAD
public class AnalysisMemberAgeServiceImpl implements AnalysisMemberAgeService {

=======
public class AnalysisMemberAgeServiceImpl implements AnalysisMemberAgeService{
	
>>>>>>> master
	@Autowired
	private AnalysisDAO analysisDAO;

	@Override
	public Map<String, Object> analysisMemberAge(Map<String, Object> map) {
<<<<<<< HEAD
		Map<String, Object> response = new HashMap<String, Object>();
		String memberAgeButton = (String) map.get("memberAgeButton");
		@SuppressWarnings("unchecked")
		List<String> yearList = (List<String>) map.get("yearList");

		Map<String, String> dbMap = new HashMap<String, String>();
		if (memberAgeButton.equals("year")) {
			for (String year : yearList) {
				dbMap.put("startDate", (year + "0101"));
				String yearPlusOne = Integer.toString(Integer.parseInt(year) + 1);
				dbMap.put("endDate", (yearPlusOne + "0101"));

				List<Map<String, Object>> tmpList = (List<Map<String, Object>>) analysisDAO
						.analysisMemberAgeYear(dbMap);
				int sixtySum = 0;
				int teenSum = 0;
				for (int i = 0; i < tmpList.size(); i++) {
					int nowAge = (int)tmpList.get(i).get("memberAge");
					if (nowAge >= 60) {
						sixtySum += (int) (tmpList.get(i).get("count"));
						tmpList.remove(i);
						i--;
					} else if (nowAge <= 10) {
						teenSum += (int) (tmpList.get(i).get("count"));
						tmpList.remove(i);
						i--;
					}

=======
		System.out.println(map);
		Map<String , Object> response = new HashMap<String, Object>();
		String memberAgeButton = (String) map.get("memberAgeButton");
		@SuppressWarnings("unchecked")
		List<String> yearList = (List<String>) map.get("yearList");
		
		Map<String, String> dbMap = new HashMap<String, String>();
		if(memberAgeButton.equals("year")) {
			for(String year :  yearList) {
				dbMap.put("startDate", (year+"0101"));
				String yearPlusOne = Integer.toString(Integer.parseInt(year) + 1);
				dbMap.put("endDate", (yearPlusOne + "0101"));

				List<Map<String, Object>> tmpList = (List<Map<String, Object>>) analysisDAO.analysisMemberAgeYear(dbMap);
				System.out.println("tmpList : " + tmpList);
				int sixtySum = 0;
				int teenSum = 0;
				for(int i = 0; i < tmpList.size(); i++) {
					String sixtyUpper = (String)tmpList.get(i).get("memberAge");
					String teenUnder = (String)tmpList.get(i).get("memberAge");
					System.out.println("sixtyUpper : " + sixtyUpper + ", teenUnder : " + teenUnder);
					if(Integer.parseInt(sixtyUpper) >= 60) {
						sixtySum += (int)(tmpList.get(i).get("count"));
						tmpList.remove(i);
					}else if(Integer.parseInt(teenUnder) <= 10) {
						teenSum += (int)(tmpList.get(i).get("count"));
						tmpList.remove(i);
					}
				
>>>>>>> master
				}
				Map<String, Object> tmpSixtyUpper = new HashMap<String, Object>();
				tmpSixtyUpper.put("memberAge", 60);
				tmpSixtyUpper.put("count", sixtySum);
				tmpList.add(tmpSixtyUpper);
<<<<<<< HEAD

=======
				System.out.println("tmpList : " + tmpList);
				
>>>>>>> master
				Map<String, Object> tmpTeenUnder = new HashMap<String, Object>();
				tmpTeenUnder.put("memberAge", 10);
				tmpTeenUnder.put("count", teenSum);
				tmpList.add(tmpTeenUnder);
<<<<<<< HEAD

				response.put(year, tmpList);
			}
		} else {

=======
				
				response.put(year, tmpList);
			}
		} else {
			
>>>>>>> master
			for (String year : yearList) {
				dbMap.put("startDate", (year + "0101"));
				String yearPlusOne = Integer.toString(Integer.parseInt(year) + 1);
				dbMap.put("endDate", (yearPlusOne + "0101"));
				List<List<Map<String, Object>>> tmpList = new ArrayList<>();
				for (int i = 1; i <= 12; i++) {
					List<Map<String, Object>> ageBox = new ArrayList<>();
					Map<String, Object> tmpTeenMap = new HashMap<>();
					tmpTeenMap.put("count", 0);
<<<<<<< HEAD
					tmpTeenMap.put("memberAge", 10);
					tmpTeenMap.put("joinDate", i);

					Map<String, Object> tmpTwentyMap = new HashMap<>();
					tmpTwentyMap.put("count", 0);
					tmpTwentyMap.put("memberAge", 20);
					tmpTwentyMap.put("joinDate", i);

					Map<String, Object> tmpThirtyMap = new HashMap<>();
					tmpThirtyMap.put("count", 0);
					tmpThirtyMap.put("memberAge", 30);
					tmpThirtyMap.put("joinDate", i);

					Map<String, Object> tmpFourtyMap = new HashMap<>();
					tmpFourtyMap.put("count", 0);
					tmpFourtyMap.put("memberAge", 40);
					tmpFourtyMap.put("joinDate", i);

					Map<String, Object> tmpFiftyMap = new HashMap<>();
					tmpFiftyMap.put("count", 0);
					tmpFiftyMap.put("memberAge", 50);
					tmpFiftyMap.put("joinDate", i);

					Map<String, Object> tmpSixtyMap = new HashMap<>();
					tmpSixtyMap.put("count", 0);
					tmpSixtyMap.put("memberAge", 60);
					tmpSixtyMap.put("joinDate", i);

=======
					tmpTeenMap.put("memberAge", "10");
					tmpTeenMap.put("joinDate", String.valueOf(i));
					
					Map<String, Object> tmpTwentyMap = new HashMap<>();
					tmpTwentyMap.put("count", 0);
					tmpTwentyMap.put("memberAge", "20");
					tmpTwentyMap.put("joinDate", String.valueOf(i));
					
					Map<String, Object> tmpThirtyMap = new HashMap<>();
					tmpThirtyMap.put("count", 0);
					tmpThirtyMap.put("memberAge", "30");
					tmpThirtyMap.put("joinDate", String.valueOf(i));
					
					Map<String, Object> tmpFourtyMap = new HashMap<>();
					tmpFourtyMap.put("count", 0);
					tmpFourtyMap.put("memberAge", "40");
					tmpFourtyMap.put("joinDate", String.valueOf(i));
					
					Map<String, Object> tmpFiftyMap = new HashMap<>();
					tmpFiftyMap.put("count", 0);
					tmpFiftyMap.put("memberAge", "50");
					tmpFiftyMap.put("joinDate", String.valueOf(i));
					
					Map<String, Object> tmpSixtyMap = new HashMap<>();
					tmpSixtyMap.put("count", 0);
					tmpSixtyMap.put("memberAge", "60");
					tmpSixtyMap.put("joinDate", String.valueOf(i));
					
>>>>>>> master
					ageBox.add(0, tmpTeenMap);
					ageBox.add(1, tmpTwentyMap);
					ageBox.add(2, tmpThirtyMap);
					ageBox.add(3, tmpFourtyMap);
					ageBox.add(4, tmpFiftyMap);
					ageBox.add(5, tmpSixtyMap);
					tmpList.add(i - 1, ageBox);
				}

				List<Map<String, Object>> ageList = analysisDAO.analysisMemberAgeMonth(dbMap);
<<<<<<< HEAD
				int prevMonth = 1;
				int sixtySum = 0;
				int teenSum = 0;
				for (int i = 0; i < ageList.size(); i++) {
					int nowMonth = (int)ageList.get(i).get("joinDate");
					int nowAge = (int)ageList.get(i).get("memberAge");
					if (nowMonth == prevMonth) {
						if (nowAge >= 60) {
							sixtySum += (int) (ageList.get(i).get("count"));
							ageList.remove(i);
							i--;
						} else if (nowAge <= 10) {
							teenSum += (int) (ageList.get(i).get("count"));
							ageList.remove(i);
							i--;
						}
					}
					if (nowMonth != prevMonth || ageList.size() == i + 1) {
						if (ageList.size() == i + 1) {
							i++;
						}
						Map<String, Object> tmpSixtyUpper = new HashMap<String, Object>();
						tmpSixtyUpper.put("memberAge", 60);
						tmpSixtyUpper.put("count", sixtySum);
						tmpSixtyUpper.put("joinDate", prevMonth);
						ageList.add(i, tmpSixtyUpper);

						Map<String, Object> tmpTeenUnder = new HashMap<String, Object>();
						tmpTeenUnder.put("memberAge", 10);
						tmpTeenUnder.put("count", teenSum);
						tmpTeenUnder.put("joinDate", prevMonth);
						ageList.add(i, tmpTeenUnder);

						sixtySum = 0;
						teenSum = 0;

						if (ageList.size() != i + 1) {
							i++;
						}
						prevMonth++;
						if (prevMonth == 13) {
							break;
						}
					}
				}

				for (int i = 0; i < ageList.size(); i++) {
					for (int j = 0; j < tmpList.size(); j++) {
						boolean check = false;
						for (int k = 0; k < 6; k++) {
							if ((int)ageList.get(i).get("joinDate") == (int)tmpList.get(j).get(k).get("joinDate")) {
								if ((int)ageList.get(i).get("memberAge") == (int)tmpList.get(j).get(k).get("memberAge")) {
									tmpList.get(j).remove(k);
									tmpList.get(j).add(k, ageList.get(i));
									check = true;
									break;
								}
							} else {
								break;
							}
						}
						if (check) {
							break;
						}

					}

				}
				response.put(year, tmpList);
			}

		}

=======
				for (int i = 0; i < ageList.size(); i++) {
					for (int j = 0; j < tmpList.size(); j++) {
						if (ageList.get(i).get("joinDate").equals(tmpList.get(j).get(0).get("joinDate"))
								&& ageList.get(i).get("memberAge").equals(tmpList.get(j).get(0).get("memberAge"))) {
							tmpList.get(j).remove(0);
							tmpList.get(j).add(0, ageList.get(i));
							break;
						} else if (ageList.get(i).get("joinDate").equals(tmpList.get(j).get(1).get("joinDate"))
									&& ageList.get(i).get("memberAge").equals(tmpList.get(j).get(1).get("memberAge"))) {
							tmpList.get(j).remove(1);
							tmpList.get(j).add(1, ageList.get(i));
							break;
						}
					}
				
				}

				response.put(year, tmpList);
			}
		}
		
		System.out.println(response);
>>>>>>> master
		return response;
	}

}

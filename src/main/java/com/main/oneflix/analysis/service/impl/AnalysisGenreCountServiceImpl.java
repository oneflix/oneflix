package com.main.oneflix.analysis.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
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
		response.put("GenreCount", analysisDAO.analysisGenreCount(map));
		
    	// 최종으로 넘길 데이터
		JSONObject data = new JSONObject();

		// col 추가
		JSONObject col1 = new JSONObject();
		JSONObject col2 = new JSONObject();
		JSONObject col3 = new JSONObject();
		// 위의 컬럼을 담을 배열
		JSONArray arrayCols = new JSONArray();
		JSONArray arrayRows = new JSONArray();
		col1.put("type", "string");
		col2.put("type", "number");
		arrayCols.add(col1);
		arrayCols.add(col2);
		
		    for (Map<String, Object> valueMap : analysisDAO.analysisGenreCount(map)) {
				// map을 json으로
				// map에서 key와 Value 뽑아서 Row 추가하기
				// key: genreId value: watchCount

					JSONObject legend = new JSONObject();
					legend.put("v", valueMap.get("genre"));
					legend.put("f", null);

					JSONObject value = new JSONObject();
					value.put("v", valueMap.get("count"));
					value.put("f", null);

					JSONArray cValueArry = new JSONArray();
					cValueArry.add(legend);
					cValueArry.add(value);

					JSONObject cValueObj = new JSONObject();
					cValueObj.put("c", cValueArry);

					arrayRows.add(cValueObj);
				}
				data.put("cols", arrayCols);
				data.put("rows", arrayRows);
		    return data;
		    }
	}


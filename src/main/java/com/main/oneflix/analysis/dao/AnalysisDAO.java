package com.main.oneflix.analysis.dao;

import java.util.List;
import java.util.Map;

import com.main.oneflix.sales.vo.SalesVO;

public interface AnalysisDAO {
	
	Integer analysisSalesYear(SalesVO vo);
	List<Map<String, Object>> analysisSalesMonth(SalesVO vo);

}

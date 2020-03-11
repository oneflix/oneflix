package com.main.oneflix.analysis.dao;

import java.util.List;
import java.util.Map;

import com.main.oneflix.sales.vo.SalesVO;

public interface AnalysisDAO {
	
	Integer analysisSalesYear(SalesVO vo);
	List<Map<String, Object>> analysisSalesMonth(SalesVO vo);
	List<Map<String, Object>> analysisGenderYear(Map<String, String> map);
	Integer analysisSubscriberYear(SalesVO vo);
	List<Map<String, Object>> analysisSubscriberTicket(SalesVO vo);
	List<Map<String, Object>> analysisGenderMonth(Map<String, String> map);
	List<Map<String, Object>> analysisMemberAgeYear(Map<String, String> map);
	List<Map<String, Object>> analysisMemberAgeMonth(Map<String, String> map);
	
	List<Map<String, Object>> analysisMovieRankMonth(Map<String,String>map);
	List<Map<String, Object>> analysisMovieRankYear(Map<String,String>map);
	List<Map<String, Object>> analysisGenreRankMonth(Map<String,String>map);
	List<Map<String, Object>> analysisGenreRankYear(Map<String,String>map);
	List<Map<String, Object>> analysisGenreCount(Map<String, Object> map);
}

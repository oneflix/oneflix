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
	
	List<Map<String, Object>> analysisMovieRankingMonth(Map<String,String>map);
	List<Map<String, Object>> analysisMovieRankingYear(Map<String,String>map);
	List<Map<String, Object>> analysisGenreRankingMonth(Map<String,String>map);
	List<Map<String, Object>> analysisGenreRankingYear(Map<String,String>map);
	List<Map<String, Object>> analysisGenreCount(Map<String, Object> map);
}

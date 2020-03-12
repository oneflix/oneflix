package com.main.oneflix.analysis.dao.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.main.oneflix.analysis.dao.AnalysisDAO;
import com.main.oneflix.member.vo.MemberVO;
import com.main.oneflix.sales.vo.SalesVO;

@Repository
public class OracleAnalysisDAO implements AnalysisDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public Integer analysisSalesYear(SalesVO vo) {
		return sqlSessionTemplate.selectOne("AnalysisDAO.analysisSalesYear", vo);
	}

	@Override
	public List<Map<String, Object>> analysisSalesMonth(SalesVO vo) {
		return sqlSessionTemplate.selectList("AnalysisDAO.analysisSalesMonth", vo);
	}

	@Override
	public List<Map<String, Object>> analysisGenderYear(Map<String, String> map) {
		return sqlSessionTemplate.selectList("AnalysisDAO.analysisGenderYear", map);
	}
	
	@Override
	public List<Map<String, Object>> analysisGenderMonth(Map<String, String> map) {
		return sqlSessionTemplate.selectList("AnalysisDAO.analysisGenderMonth", map);
	}

	@Override
	public Integer analysisSubscriberYear(SalesVO vo) {
		return sqlSessionTemplate.selectOne("AnalysisDAO.analysisSubscriberYear", vo);
	}

	@Override
	public List<Map<String, Object>> analysisSubscriberTicket(SalesVO vo) {
		return sqlSessionTemplate.selectList("AnalysisDAO.analysisSubscriberTicket", vo);
	}

	@Override
	public List<Map<String, Object>> analysisMemberAgeYear(Map<String, String> map) {
		return sqlSessionTemplate.selectList("AnalysisDAO.analysisMemberAgeYear", map);
	}

	@Override
	public List<Map<String, Object>> analysisMemberAgeMonth(Map<String, String> map) {
		return sqlSessionTemplate.selectList("AnalysisDAO.analysisMemberAgeMonth", map);
	}
	
	public List<Map<String, Object>> analysisMovieRanking(Map<String, String> map) {
		return sqlSessionTemplate.selectList("AnalysisDAO.analysisMovieRanking", map);
	}

	@Override
	public List<Map<String, Object>> analysisGenreRanking(Map<String, String> map) {
		return sqlSessionTemplate.selectList("AnalysisDAO.analysisGenreRanking", map);
	}

	@Override
	public List<Map<String, Object>> analysisGenreCount(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("AnalysisDAO.analysisGenreCount",map);
	}


}

package com.main.oneflix.term.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.main.oneflix.term.dao.TermDAO;
import com.main.oneflix.term.vo.TermVO;

@Repository
public class OracleTermDAO implements TermDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public void insertTerm(TermVO vo) {
		sqlSessionTemplate.insert("TermDAO.insertTerm", vo);
	}

	@Override
	public void updateTerm(TermVO vo) {
		sqlSessionTemplate.update("TermDAO.updateTerm", vo);
	}

	@Override
	public void deleteTerm(TermVO vo) {
		sqlSessionTemplate.delete("TermDAO.deleteTerm", vo);
	}

	@Override
	public TermVO getTerm(TermVO vo) {
		return sqlSessionTemplate.selectOne("TermDAO.getTerm", vo);
	}

	@Override
	public List<TermVO> getTermList(TermVO vo) {
		return sqlSessionTemplate.selectList("TermDAO.getTermList", vo);
	}

}

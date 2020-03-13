package com.main.oneflix.term.dao;

import java.util.List;

import com.main.oneflix.term.vo.TermVO;

public interface TermDAO {
	void insertTerm(TermVO vo);
	void updateTerm(TermVO vo);
	void deleteTerm(TermVO vo);
	TermVO getTerm(TermVO vo);
	List<TermVO> getTermList(TermVO vo);
}

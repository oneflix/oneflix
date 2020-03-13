package com.main.oneflix.term.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.oneflix.term.dao.TermDAO;
import com.main.oneflix.term.service.InsertTermService;
import com.main.oneflix.term.vo.TermVO;

@Service
public class InsertTermServiceImpl implements InsertTermService {
	@Autowired
	private TermDAO termDAO;
	
	@Override
	public void insertTerm(TermVO vo) {
		termDAO.insertTerm(vo);
	}

}

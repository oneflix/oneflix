package com.main.oneflix.term.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.oneflix.term.dao.TermDAO;
import com.main.oneflix.term.service.GetTermService;
import com.main.oneflix.term.vo.TermVO;

@Service
public class GetTermServiceImpl implements GetTermService {
	@Autowired
	private TermDAO termDAO;
	
	@Override
	public TermVO getTerm(TermVO vo) {
		return termDAO.getTerm(vo);
	}

}

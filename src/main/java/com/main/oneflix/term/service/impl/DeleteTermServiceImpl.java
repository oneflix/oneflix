package com.main.oneflix.term.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.oneflix.term.dao.TermDAO;
import com.main.oneflix.term.service.DeleteTermService;
import com.main.oneflix.term.vo.TermVO;

@Service
public class DeleteTermServiceImpl implements DeleteTermService {
	@Autowired
	private TermDAO termDAO;
	
	@Override
	public void deleteTerm(TermVO vo) {
		termDAO.deleteTerm(vo);
	}

}

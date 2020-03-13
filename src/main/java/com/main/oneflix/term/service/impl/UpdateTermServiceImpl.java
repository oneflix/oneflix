package com.main.oneflix.term.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.oneflix.term.dao.TermDAO;
import com.main.oneflix.term.service.UpdateTermService;
import com.main.oneflix.term.vo.TermVO;

@Service
public class UpdateTermServiceImpl implements UpdateTermService {
	@Autowired
	private TermDAO termDAO;
	
	@Override
	public void updateTerm(TermVO vo) {
		termDAO.updateTerm(vo);
	}

}

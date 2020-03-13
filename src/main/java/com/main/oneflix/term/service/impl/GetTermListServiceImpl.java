package com.main.oneflix.term.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.oneflix.term.dao.TermDAO;
import com.main.oneflix.term.service.GetTermListService;
import com.main.oneflix.term.vo.TermVO;

@Service
public class GetTermListServiceImpl implements GetTermListService {
	@Autowired
	private TermDAO termDAO;
	
	@Override
	public List<TermVO> getTermList(TermVO vo) {
		return termDAO.getTermList(vo);
	}

}

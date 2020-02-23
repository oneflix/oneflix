package com.main.oneflix.screen.service.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.oneflix.screen.dao.ScreenDAO;

import com.main.oneflix.screen.service.DeleteScreenService;
import com.main.oneflix.screen.vo.ScreenVO;

@Service
public class DeleteScreenServiceImpl implements DeleteScreenService {

	
	@Autowired
	private ScreenDAO screenDAO;
	
	@Override
	public void deleteScreen(ScreenVO vo) {
		screenDAO.deleteScreen(vo);
	}

}

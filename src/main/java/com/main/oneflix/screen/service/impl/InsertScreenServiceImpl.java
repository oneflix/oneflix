package com.main.oneflix.screen.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.oneflix.screen.dao.ScreenDAO;
import com.main.oneflix.screen.service.InsertScreenService;
import com.main.oneflix.screen.vo.ScreenVO;

@Service
public class InsertScreenServiceImpl implements InsertScreenService {
	
	@Autowired
	private ScreenDAO screenDAO;

	@Override
	public void insertScreen(ScreenVO vo) {
		screenDAO.insertScreen(vo);
	}

}

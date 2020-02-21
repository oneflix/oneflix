package com.main.oneflix.screen.service.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.oneflix.screen.dao.ScreenDAO;
import com.main.oneflix.screen.service.UpdateScreenService;
import com.main.oneflix.screen.vo.ScreenVO;

@Service
public class UpdateScreenServiceImpl implements UpdateScreenService {

	
	@Autowired
	private ScreenDAO screenDAO;

	@Override
	public void updateScreen(ScreenVO vo) {
		screenDAO.updateScreen(vo);
	}

}

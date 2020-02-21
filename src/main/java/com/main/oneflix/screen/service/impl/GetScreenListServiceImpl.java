package com.main.oneflix.screen.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.oneflix.screen.dao.ScreenDAO;
import com.main.oneflix.screen.service.GetScreenListService;
import com.main.oneflix.screen.vo.ScreenVO;

@Service
public class GetScreenListServiceImpl implements GetScreenListService {
	
	@Autowired
	private ScreenDAO screenDAO;

	@Override
	public List<ScreenVO> getScreenList(ScreenVO vo) {
		return screenDAO.getScreenList(vo);
	}

}

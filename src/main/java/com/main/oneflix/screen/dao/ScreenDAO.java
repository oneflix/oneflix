package com.main.oneflix.screen.dao;

import java.util.List;

import com.main.oneflix.screen.vo.ScreenVO;

public interface ScreenDAO {
	void insertScreen(ScreenVO vo);
	void updateScreen(ScreenVO vo);
	void deleteScreen(ScreenVO vo);
	List<ScreenVO> getScreenList(ScreenVO vo);
}

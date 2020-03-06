package com.main.oneflix.screen.dao;

import java.util.List;
import java.util.Map;

import com.main.oneflix.screen.vo.ScreenVO;

public interface ScreenDAO {
	void insertScreen(Map<String, List<ScreenVO>> map);
	void updateScreen(Map<String, List<ScreenVO>> map);
	void deleteScreen(ScreenVO vo);
	List<ScreenVO> getScreenList(ScreenVO vo);
}

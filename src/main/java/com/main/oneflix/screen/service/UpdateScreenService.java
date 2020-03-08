package com.main.oneflix.screen.service;

import java.util.List;

import com.main.oneflix.screen.vo.ScreenVO;

public interface UpdateScreenService {
	void updateScreen(ScreenVO vo, List<String> imgPathList);
}

package com.main.oneflix.screen.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public void insertScreen(ScreenVO vo, List<String> imgPathList) {
		List<ScreenVO> newScreenList = new ArrayList<ScreenVO>();
		
		for (int i = 0; i < vo.getScreenIdList().size(); i++) {
			ScreenVO screen;
			
			if (vo.getScreenIdList().get(i) == 0) {
				screen = new ScreenVO();
				
				if(vo.getScreenType().equals("oneflix")) {
					screen.setScreenType("oneflix");
				} else {
					screen.setScreenType("deactivate");
				}
				screen.setScreenImgPath(imgPathList.get(i));
				screen.setScreenTitle(vo.getScreenTitleList().get(i));
				screen.setScreenSubtitle(vo.getScreenSubtitleList().get(i));
				newScreenList.add(screen);
			}
		}
		Map<String, List<ScreenVO>> map = new HashMap<>();
		map.put("newScreenList", newScreenList);
		screenDAO.insertScreen(map);
	}

}

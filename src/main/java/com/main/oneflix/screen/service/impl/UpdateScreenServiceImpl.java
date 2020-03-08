package com.main.oneflix.screen.service.impl;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public void updateScreen(ScreenVO vo, List<String> imgPathList) {
		List<ScreenVO> newScreenList = new ArrayList<>();
		
		for (int i = 0; i < vo.getScreenIdList().size(); i++) {
			ScreenVO screen;
			
			if (vo.getScreenIdList().get(i) != 0) {
				screen = new ScreenVO();
				screen.setScreenId(vo.getScreenIdList().get(i));
				if (vo.getScreenImgPathList().get(i).equals("change")) {
					screen.setScreenImgPath(imgPathList.get(i));
				}
				if (!vo.getScreenStatusList().get(i).equals("new")) {
					screen.setScreenTitle(vo.getScreenTitleList().get(i));
					screen.setScreenSubtitle(vo.getScreenSubtitleList().get(i));
				}
				newScreenList.add(screen);
			}
		}
		Map<String, List<ScreenVO>> map = new HashMap<>();
		map.put("newScreenList", newScreenList);
		screenDAO.updateScreen(map);
	}

}

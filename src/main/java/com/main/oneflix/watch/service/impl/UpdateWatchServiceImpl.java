package com.main.oneflix.watch.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.oneflix.watch.dao.WatchDAO;
import com.main.oneflix.watch.service.UpdateWatchService;
import com.main.oneflix.watch.vo.WatchVO;

@Service
public class UpdateWatchServiceImpl implements UpdateWatchService {
	@Autowired
	private WatchDAO watchDAO;
	
	@Override
	public void updateWatch(WatchVO vo) {
		watchDAO.updateWatch(vo);
	}

}

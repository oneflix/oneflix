package com.main.oneflix.watch.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.oneflix.watch.dao.WatchDAO;
import com.main.oneflix.watch.service.InsertWatchService;
import com.main.oneflix.watch.vo.WatchVO;

@Service
public class InsertWatchServiceImpl implements InsertWatchService {

	@Autowired
	private WatchDAO watchDAO;
	
	@Override
	public void insertWatch(WatchVO vo) {
		watchDAO.insertWatch(vo);
	}

}

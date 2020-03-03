package com.main.oneflix.watch.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.oneflix.watch.dao.WatchDAO;
import com.main.oneflix.watch.service.GetCountWatchService;
import com.main.oneflix.watch.vo.WatchVO;

@Service
public class GetCountWatchServiceImpl implements GetCountWatchService {
	
	@Autowired
	private WatchDAO watchDAO;
	@Override
	public int getCountWatch(WatchVO vo) {
		return watchDAO.getCountWatch(vo);
	}

}

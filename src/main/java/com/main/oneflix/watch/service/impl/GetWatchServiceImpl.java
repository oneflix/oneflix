package com.main.oneflix.watch.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.oneflix.watch.dao.WatchDAO;
import com.main.oneflix.watch.service.GetWatchService;
import com.main.oneflix.watch.vo.WatchVO;

@Service
public class GetWatchServiceImpl implements GetWatchService {
	
	@Autowired
	private WatchDAO watchDAO;
	
	@Override
	public WatchVO getWatch(WatchVO vo) {
		return watchDAO.getWatch(vo);
	}

}

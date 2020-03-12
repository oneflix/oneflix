package com.main.oneflix.watch.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.oneflix.watch.dao.WatchDAO;
import com.main.oneflix.watch.service.GetWatchViewPointService;
import com.main.oneflix.watch.vo.WatchVO;

@Service
public class GetWatchViewPointServiceImpl implements GetWatchViewPointService {
	@Autowired
	WatchDAO watchDAO;
	
	@Override
	public Integer getWatchViewPoint(WatchVO vo) {
		return watchDAO.getWatchViewPoint(vo);
	}

}

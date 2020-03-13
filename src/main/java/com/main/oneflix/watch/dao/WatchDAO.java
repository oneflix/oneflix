package com.main.oneflix.watch.dao;

import com.main.oneflix.watch.vo.WatchVO;

public interface WatchDAO {
	void insertWatch(WatchVO vo);
	void updateWatch(WatchVO vo);
	int getCountWatchGenre(WatchVO vo);
	int getCountWatch(WatchVO vo);
	Integer getWatchViewPoint(WatchVO vo);
}

package com.main.oneflix.watch.dao;

import com.main.oneflix.watch.vo.WatchVO;

public interface WatchDAO {

	int getCountWatchGenre(WatchVO vo);
	int getCountWatch(WatchVO vo);
}

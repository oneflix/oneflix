package com.main.oneflix.watch.service;

import java.util.List;
import java.util.Map;

import com.main.oneflix.genre.vo.GenreVO;
import com.main.oneflix.watch.vo.WatchVO;

public interface GetCountWatchGenreService {
	
	Map<Integer, Integer> getCountWatchGenre(WatchVO vo, List<GenreVO> genreList);
}

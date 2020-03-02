package com.main.oneflix.watch.service.impl;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.oneflix.genre.vo.GenreVO;
import com.main.oneflix.watch.dao.WatchDAO;
import com.main.oneflix.watch.service.GetCountWatchGenreService;
import com.main.oneflix.watch.vo.WatchVO;

@Service
public class GetCountWatchGenreServiceImpl implements GetCountWatchGenreService {

	@Autowired
	private WatchDAO watchDAO;
	
	@Override
	public Map<Integer, Integer> getCountWatchGenre(WatchVO vo, List<GenreVO> genreList) {
		Map<Integer, Integer> unorderWatchGenreList = new HashMap<Integer, Integer>();
		
		for (GenreVO genre : genreList) {
			Integer genreId = genre.getGenreId();
			vo.setGenreId(genreId);
			int count = watchDAO.getCountWatchGenre(vo);
			unorderWatchGenreList.put(genreId, count);
		}
		
		List<Integer> keyList = new ArrayList<Integer>();
		keyList.addAll(unorderWatchGenreList.keySet());

		Collections.sort(keyList, new Comparator<Integer>() {
			@Override
			public int compare(Integer key1, Integer key2) {
				return unorderWatchGenreList.get(key2) - unorderWatchGenreList.get(key1);
			}
		});
		
		Map<Integer, Integer> orderWatchGenreList = new LinkedHashMap<Integer, Integer>();
		for (Integer key : keyList) {
			orderWatchGenreList.put(key, unorderWatchGenreList.get(key));
		}
		return orderWatchGenreList;
	}

}

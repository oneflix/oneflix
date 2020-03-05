package com.main.oneflix.movie.service.impl;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.oneflix.genre.vo.GenreVO;
import com.main.oneflix.movie.dao.MovieDAO;
import com.main.oneflix.movie.service.GetRecommendMovieListService;
import com.main.oneflix.movie.vo.MovieVO;
import com.main.oneflix.watch.dao.WatchDAO;
import com.main.oneflix.watch.vo.WatchVO;

@Service
public class GetRecommendMovieListServiceImpl implements GetRecommendMovieListService {

	@Autowired
	private MovieDAO movieDAO;
	@Autowired
	private WatchDAO watchDAO;
	
	@Override
	public List<MovieVO> getRecommendMovieList(MovieVO vo, List<GenreVO> genreList) {
		List<MovieVO> recommendMovieList = new ArrayList<MovieVO>();
		
		Map<Integer, Integer> unorderWatchGenreList = new HashMap<Integer, Integer>();
		WatchVO watch = new WatchVO();
		watch.setEmail(vo.getEmail());
		for (GenreVO genre : genreList) {
			Integer genreId = genre.getGenreId();
			 
			watch.setGenreId(genreId);
			int count = watchDAO.getCountWatchGenre(watch);
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
		
		/*
		Map<Integer, Integer> orderWatchGenreList = new LinkedHashMap<Integer, Integer>();
		for (Integer key : keyList) {
			orderWatchGenreList.put(key, unorderWatchGenreList.get(key));
		}
		*/
		
		List<Integer> prevKeyList = new ArrayList<>();
		for (int i = 0; i < genreList.size(); i++) {
			Integer key = keyList.get(i);
			vo.setRecommendGenre(key);
			List<MovieVO> movieList = movieDAO.getMovieList(vo);
			for (int j = 0; j < movieList.size(); j++) {
				MovieVO movie = movieList.get(j);
				for (int k = 0; k < prevKeyList.size(); k++) {
					Integer prevKey = prevKeyList.get(k);
					if (movie.getGenreId1() == prevKey.intValue() || movie.getGenreId2() == prevKey.intValue()) {
						movieList.remove(j);
						j--;
						break;
					}
				}
			}
			prevKeyList.add(key);
			recommendMovieList.addAll(movieList);
		}
		
		return recommendMovieList;
	}

}

package com.main.oneflix.genre.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.main.oneflix.genre.dao.GenreDAO;
import com.main.oneflix.genre.service.DeleteGenreService;
import com.main.oneflix.genre.vo.GenreVO;
import com.main.oneflix.movie.dao.MovieDAO;
import com.main.oneflix.movie.vo.MovieVO;

@Service
public class DeleteGenreServiceImpl implements DeleteGenreService {

	@Autowired
	private GenreDAO genreDAO;
	@Autowired
	private MovieDAO movieDAO;
	
	@Override
	@Transactional
	public void deleteGenre(GenreVO vo) {
		MovieVO movie = new MovieVO();
		movie.setSearchDeleteType("genre");
		movie.setSearchDeleteId(vo.getGenreId());
		List<MovieVO> deleteMovieList = movieDAO.searchDeleteId(movie);
		List<MovieVO> changeMovieList = new ArrayList<>();
		for (MovieVO changeMovie : deleteMovieList) {
			if (changeMovie.getGenreId1() == vo.getGenreId()) {
				changeMovie.setSearchDeleteOrder(1);
			} else {
				changeMovie.setSearchDeleteOrder(2);
			}
			changeMovieList.add(changeMovie);
		}
		if (changeMovieList.size() != 0) {
			Map<String, Object> map = new HashMap<>();
			map.put("changeType", "genre");
			map.put("changeMovieList", changeMovieList);
			movieDAO.changeMovie(map);
		}
		genreDAO.deleteGenre(vo);

	}

}


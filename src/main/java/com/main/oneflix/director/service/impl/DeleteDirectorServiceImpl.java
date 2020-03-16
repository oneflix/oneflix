package com.main.oneflix.director.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.oneflix.director.dao.DirectorDAO;
import com.main.oneflix.director.service.DeleteDirectorService;
import com.main.oneflix.director.vo.DirectorVO;
import com.main.oneflix.movie.dao.MovieDAO;
import com.main.oneflix.movie.vo.MovieVO;

@Service
public class DeleteDirectorServiceImpl implements DeleteDirectorService {

	@Autowired
	private DirectorDAO directorDAO;
	@Autowired
	private MovieDAO movieDAO;
	
	@Override
	public void deleteDirector(DirectorVO vo) {
		MovieVO movie = new MovieVO();
		movie.setSearchDeleteType("director");
		movie.setSearchDeleteId(vo.getDirectorId());
		List<MovieVO> changeMovieList = movieDAO.searchDeleteId(movie);
		if (changeMovieList.size() != 0) {
			Map<String, Object> map = new HashMap<>();
			map.put("changeType", "director");
			map.put("changeMovieList", changeMovieList);
			movieDAO.changeMovie(map);
		}
		directorDAO.deleteDirector(vo);
	}

}

package com.main.oneflix.movie.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.oneflix.movie.dao.MovieDAO;
import com.main.oneflix.movie.service.DeleteMovieService;
import com.main.oneflix.movie.vo.MovieVO;

@Service
public class DeleteMovieServiceImpl implements DeleteMovieService {

	@Autowired
	private MovieDAO movieDAO;
	
	@Override
	public void deleteMovie(MovieVO vo) {
		movieDAO.deleteMovie(vo);
	}

}

package com.main.oneflix.movie.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.oneflix.movie.dao.MovieDAO;
import com.main.oneflix.movie.service.UpdateMovieService;
import com.main.oneflix.movie.vo.MovieVO;

@Service
public class UpdateMovieServiceImpl implements UpdateMovieService {

	@Autowired
	private MovieDAO movieDAO;
	
	@Override
	public void updateMovie(MovieVO vo) {
		movieDAO.updateMovie(vo);
	}

}

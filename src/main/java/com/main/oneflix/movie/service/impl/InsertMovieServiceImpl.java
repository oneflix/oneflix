package com.main.oneflix.movie.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.oneflix.movie.dao.MovieDAO;
import com.main.oneflix.movie.service.InsertMovieService;
import com.main.oneflix.movie.vo.MovieVO;

@Service
public class InsertMovieServiceImpl implements InsertMovieService {

	@Autowired
	private MovieDAO movieDAO;
	
	@Override
	public void insertMovie(MovieVO vo) {
		movieDAO.insertMovie(vo);
	}

}

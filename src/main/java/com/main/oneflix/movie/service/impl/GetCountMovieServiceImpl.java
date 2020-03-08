package com.main.oneflix.movie.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.oneflix.movie.dao.MovieDAO;
import com.main.oneflix.movie.service.GetCountMovieService;
import com.main.oneflix.movie.vo.MovieVO;

@Service
public class GetCountMovieServiceImpl implements GetCountMovieService {

	@Autowired
	private MovieDAO movieDAO;
	
	@Override
	public int getCountMovie(MovieVO vo) {
		return movieDAO.getCountMovie(vo);
	}

}

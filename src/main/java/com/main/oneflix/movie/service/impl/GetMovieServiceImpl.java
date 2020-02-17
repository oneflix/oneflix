package com.main.oneflix.movie.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.oneflix.movie.dao.MovieDAO;
import com.main.oneflix.movie.service.GetMovieService;
import com.main.oneflix.movie.vo.MovieVO;

@Service
public class GetMovieServiceImpl implements GetMovieService {

	@Autowired
	private MovieDAO movieDAO;
	
	@Override
	public MovieVO getMovie(MovieVO vo) {
		return movieDAO.getMovie(vo);
	}

}

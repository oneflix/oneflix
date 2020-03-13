package com.main.oneflix.movie.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.oneflix.movie.dao.MovieDAO;
import com.main.oneflix.movie.service.UpdateMovieScoreService;
import com.main.oneflix.movie.vo.MovieVO;

@Service
public class UpdateMovieScoreServiceImpl implements UpdateMovieScoreService {
	
	@Autowired
	private MovieDAO movieDAO;

	@Override
	public void updateMovieScore(MovieVO vo) {
		movieDAO.updateMovieScore(vo);

	}

}

package com.main.oneflix.analysis.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.oneflix.analysis.service.AnalysisPopularMovieService;
import com.main.oneflix.movie.dao.MovieDAO;
import com.main.oneflix.movie.vo.MovieVO;

@Service
public class AnalysisPopularMovieServiceImpl implements AnalysisPopularMovieService {
	
	@Autowired
	private MovieDAO movieDAO;

	@Override
	public List<MovieVO> getCountPopularMovieList(MovieVO vo) {
		vo.setMovieType("popular");
		List<MovieVO> countPopularMovieList = movieDAO.getMovieList(vo);
		
		
		return countPopularMovieList;
	}

	

}

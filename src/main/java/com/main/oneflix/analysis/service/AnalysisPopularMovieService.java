package com.main.oneflix.analysis.service;

import java.util.List;

import com.main.oneflix.movie.vo.MovieVO;

public interface AnalysisPopularMovieService {
	
	List<MovieVO> getCountPopularMovieList(MovieVO vo);

}

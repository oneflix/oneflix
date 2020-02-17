package com.main.oneflix.movie.service;

import java.util.List;

import com.main.oneflix.movie.vo.MovieVO;

public interface GetMovieListService {
	List<MovieVO> getMovieList(MovieVO vo);
}

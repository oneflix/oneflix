package com.main.oneflix.analysis.service;

import java.util.List;
import java.util.Map;

import com.main.oneflix.movie.vo.MovieVO;

public interface GetCountViewService {
	
	List<MovieVO> getCountViewMovieList(MovieVO vo);

}

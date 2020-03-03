package com.main.oneflix.movie.dao;

import java.util.List;

import com.main.oneflix.movie.vo.MovieVO;

public interface MovieDAO {
	
	void insertMovie(MovieVO vo);
	void updateMovie(MovieVO vo);
	void deleteMovie(MovieVO vo);
	MovieVO getMovie(MovieVO vo);
	List<MovieVO> getMovieList(MovieVO vo);
	int getCountMovie(MovieVO vo);

}

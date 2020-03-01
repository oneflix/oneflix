package com.main.oneflix.movie.service;

import java.util.List;

import com.main.oneflix.genre.vo.GenreVO;
import com.main.oneflix.movie.vo.MovieVO;

public interface GetRecommendMovieListService {

	List<MovieVO> getRecommendMovieList(MovieVO vo, String email, List<GenreVO> genreList);
}

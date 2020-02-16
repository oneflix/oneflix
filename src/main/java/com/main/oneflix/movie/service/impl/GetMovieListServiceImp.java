package com.main.oneflix.movie.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.oneflix.movie.dao.MovieDAO;
import com.main.oneflix.movie.service.GetMovieListService;
import com.main.oneflix.movie.vo.MovieVO;

@Service
public class GetMovieListServiceImp implements GetMovieListService {

	@Autowired
	private MovieDAO movieDAO;
	
	@Override
	public List<MovieVO> getMovieList(MovieVO vo) {
		return movieDAO.getMovieList(vo);
	}

}

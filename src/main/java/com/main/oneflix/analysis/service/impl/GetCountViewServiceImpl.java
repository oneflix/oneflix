package com.main.oneflix.analysis.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.oneflix.analysis.service.GetCountViewService;
import com.main.oneflix.movie.dao.MovieDAO;
import com.main.oneflix.movie.vo.MovieVO;

@Service
public class GetCountViewServiceImpl implements GetCountViewService {
	
	@Autowired
	private MovieDAO movieDAO;
	
	@Override
	public List<MovieVO> getCountViewMovieList(MovieVO vo) {
		vo.setOnlyViewCount("only");
		vo.setMovieType("popular");
		List<MovieVO> countViewMovieList = movieDAO.getMovieList(vo);
		
		
		return countViewMovieList;
	}

	

}

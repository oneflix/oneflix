package com.main.oneflix.movie.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.oneflix.movie.dao.MovieDAO;
import com.main.oneflix.movie.service.IncreaseViewCountService;
import com.main.oneflix.movie.vo.MovieVO;

@Service
public class IncreaseViewCountServiceImpl implements IncreaseViewCountService {

	@Autowired
	private MovieDAO movieDAO;
	
	@Override
	public void increaseViewCount(MovieVO vo) {
		movieDAO.increaseViewCount(vo);
	}

}

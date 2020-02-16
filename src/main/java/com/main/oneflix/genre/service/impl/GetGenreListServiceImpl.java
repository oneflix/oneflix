package com.main.oneflix.genre.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.oneflix.genre.dao.GenreDAO;
import com.main.oneflix.genre.service.GetGenreListService;
import com.main.oneflix.genre.vo.GenreVO;

@Service
public class GetGenreListServiceImpl implements GetGenreListService {

	@Autowired
	private GenreDAO genreDAO;
	
	@Override
	public List<GenreVO> getGenreList(GenreVO vo) {
		return genreDAO.getGenreList(vo);
	}

}

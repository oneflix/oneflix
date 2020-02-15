package com.main.oneflix.genre.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.oneflix.genre.dao.GenreDAO;
import com.main.oneflix.genre.service.InsertGenreService;
import com.main.oneflix.genre.vo.GenreVO;

@Service
public class InsertGenreServiceImpl implements InsertGenreService {

	@Autowired
	private GenreDAO genreDAO;
	
	@Override
	public void insertGenre(GenreVO vo) {
		genreDAO.insertGenre(vo);
		
	}

}


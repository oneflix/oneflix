package com.main.oneflix.genre.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.oneflix.genre.dao.GenreDAO;
import com.main.oneflix.genre.service.DeleteGenreService;
import com.main.oneflix.genre.vo.GenreVO;

@Service
public class DeleteGenreServiceImpl implements DeleteGenreService {

	@Autowired
	private GenreDAO genreDAO; 
	
	@Override
	public void deleteGenreService(GenreVO vo) {
		genreDAO.deleteGenre(vo);

	}

}


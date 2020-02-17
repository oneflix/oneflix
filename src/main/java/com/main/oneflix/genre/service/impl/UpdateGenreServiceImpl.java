package com.main.oneflix.genre.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.oneflix.genre.dao.GenreDAO;
import com.main.oneflix.genre.service.UpdateGenreService;
import com.main.oneflix.genre.vo.GenreVO;

@Service
public class UpdateGenreServiceImpl implements UpdateGenreService {

	@Autowired
	private GenreDAO genreDAO;
	
	@Override
	public void updateGenre(GenreVO vo) {
		genreDAO.updateGenre(vo);

	}

}

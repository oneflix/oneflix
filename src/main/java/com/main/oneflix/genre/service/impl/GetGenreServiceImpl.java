package com.main.oneflix.genre.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.oneflix.genre.dao.GenreDAO;
import com.main.oneflix.genre.service.GetGenreService;
import com.main.oneflix.genre.vo.GenreVO;

@Service
public class GetGenreServiceImpl implements GetGenreService {

	@Autowired
	private GenreDAO genreDAO;
	
	@Override
	public GenreVO getGenre(GenreVO vo) {
		return genreDAO.getGenre(vo);

	}

}

package com.main.oneflix.genre.service;

import com.main.oneflix.genre.vo.GenreVO;

public interface GetGenreService {
	
	GenreVO getGenre(GenreVO vo);
	String getGenreName(GenreVO vo);
}

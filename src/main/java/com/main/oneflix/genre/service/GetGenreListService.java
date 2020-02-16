package com.main.oneflix.genre.service;

import java.util.List;

import com.main.oneflix.genre.vo.GenreVO;

public interface GetGenreListService {
	
	List<GenreVO> getGenreList(GenreVO vo);

}


package com.main.oneflix.genre.dao;

import java.util.List;

import com.main.oneflix.genre.vo.GenreVO;

public interface GenreDAO {
	
	void insertGenre(GenreVO vo);
	void deleteGenre(GenreVO vo);
	void updateGenre(GenreVO vo);
	GenreVO getGenre(GenreVO vo);
	List<GenreVO> getGenreList(GenreVO vo);

}

package com.main.oneflix.genre.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.main.oneflix.genre.dao.GenreDAO;
import com.main.oneflix.genre.vo.GenreVO;

@Repository
public class OracleGenreDAO implements GenreDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public void insertGenre(GenreVO vo) {
		sqlSessionTemplate.insert("GenreDAO.insertGenre", vo);

	}

	@Override
	public void deleteGenre(GenreVO vo) {
		sqlSessionTemplate.delete("GenreDAO.deleteGenre", vo);

	}

	@Override
	public void updateGenre(GenreVO vo) {
		sqlSessionTemplate.update("GenreDAO.updateGenre", vo);
	}

	@Override
	public GenreVO getGenre(GenreVO vo) {
		return sqlSessionTemplate.selectOne("GenreDAO.getGenre", vo);
	}

	@Override
	public List<GenreVO> getGenreList(GenreVO vo) {
		return sqlSessionTemplate.selectList("GenreDAO.getGenreList", vo);
	}

	@Override
	public String getGenreName(GenreVO vo) {
		return sqlSessionTemplate.selectOne("GenreDAO.getGenreName",vo);
		
	}

	

}
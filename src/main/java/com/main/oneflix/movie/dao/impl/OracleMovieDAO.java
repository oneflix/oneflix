package com.main.oneflix.movie.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.main.oneflix.movie.dao.MovieDAO;
import com.main.oneflix.movie.vo.MovieVO;

@Repository
public class OracleMovieDAO implements MovieDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public void insertMovie(MovieVO vo) {
		sqlSessionTemplate.insert("MovieDAO.insertMovie", vo);
	}

	@Override
	public void updateMovie(MovieVO vo) {
		sqlSessionTemplate.update("MovieDAO.updateMovie", vo);
	}

	@Override
	public void deleteMovie(MovieVO vo) {
		sqlSessionTemplate.delete("MovieDAO.deleteMovie", vo);
	}

	@Override
	public MovieVO getMovie(MovieVO vo) {
		return sqlSessionTemplate.selectOne("MovieDAO.getMovie", vo);
	}

	@Override
	public List<MovieVO> getMovieList(MovieVO vo) {
		return sqlSessionTemplate.selectList("MovieDAO.getMovieList", vo);
	}

	@Override
	public int getCountMovie(MovieVO vo) {
		return sqlSessionTemplate.selectOne("MovieDAO.getCountMovie", vo);
	}

	@Override
	public void increaseViewCount(MovieVO vo) {
		sqlSessionTemplate.update("MovieDAO.increaseViewCount", vo);
	}

}

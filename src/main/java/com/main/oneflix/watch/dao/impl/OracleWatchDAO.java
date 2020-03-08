package com.main.oneflix.watch.dao.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.main.oneflix.watch.dao.WatchDAO;
import com.main.oneflix.watch.vo.WatchVO;

@Repository
public class OracleWatchDAO implements WatchDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public void insertWatch(WatchVO vo) {
		sqlSessionTemplate.insert("WatchDAO.insertWatch", vo);
	}
	
	@Override
	public int getCountWatchGenre(WatchVO vo) {
		return sqlSessionTemplate.selectOne("WatchDAO.getCountWatchGenre", vo);
	}

	
}

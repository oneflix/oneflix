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
	public void updateWatch(WatchVO vo) {
		sqlSessionTemplate.update("WatchDAO.updateWatch", vo);
	}
	
	@Override
	public int getCountWatchGenre(WatchVO vo) {
		return sqlSessionTemplate.selectOne("WatchDAO.getCountWatchGenre", vo);
	}

	@Override
	public int getCountWatch(WatchVO vo) {
		return sqlSessionTemplate.selectOne("WatchDAO.getCountWatch",vo);
	}

	@Override
	public Integer getWatchViewPoint(WatchVO vo) {
		return sqlSessionTemplate.selectOne("WatchDAO.getWatchViewPoint", vo);
	}
	
}

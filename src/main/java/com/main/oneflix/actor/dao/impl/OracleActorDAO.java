package com.main.oneflix.actor.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.main.oneflix.actor.dao.ActorDAO;
import com.main.oneflix.actor.vo.ActorVO;

public class OracleActorDAO implements ActorDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public void insertActor(ActorVO vo) {
		sqlSessionTemplate.insert("ActorDAO.insertActor",vo);

	}

	@Override
	public ActorVO getActor(ActorVO vo) {
		return sqlSessionTemplate.selectOne("ActorDAO.getActor",vo);
	}


	@Override
	public void updateActor(ActorVO vo) {
		sqlSessionTemplate.update("ActorDAO.updateActor",vo);

	}

	@Override
	public void deleteActor(ActorVO vo) {
		sqlSessionTemplate.delete("ActorDAO.deleteActor",vo);

	}

	@Override
	public List<ActorVO> getActorList(ActorVO vo) {
		return sqlSessionTemplate.selectOne("ActorDAO.getActorList",vo);
	}
}

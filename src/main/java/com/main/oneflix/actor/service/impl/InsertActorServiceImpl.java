package com.main.oneflix.actor.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.oneflix.actor.dao.ActorDAO;
import com.main.oneflix.actor.service.InsertActorService;
import com.main.oneflix.actor.vo.ActorVO;
@Service
public class InsertActorServiceImpl implements InsertActorService {
	@Autowired
	private ActorDAO actorDAO;
	@Override
	public void InsertActorService(ActorVO vo) {
		actorDAO.insertActor(vo);

	}

}

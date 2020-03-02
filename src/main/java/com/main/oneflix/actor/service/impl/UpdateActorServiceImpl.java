package com.main.oneflix.actor.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.oneflix.actor.dao.ActorDAO;
import com.main.oneflix.actor.service.UpdateActorService;
import com.main.oneflix.actor.vo.ActorVO;

@Service
public class UpdateActorServiceImpl implements UpdateActorService {
	
	@Autowired
	private ActorDAO actorDAO;

	@Override
	public void updateActor(ActorVO vo) {
		actorDAO.updateActor(vo);
	}

}

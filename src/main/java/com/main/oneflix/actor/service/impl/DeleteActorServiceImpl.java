package com.main.oneflix.actor.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.oneflix.actor.dao.ActorDAO;
import com.main.oneflix.actor.service.DeleteActorService;
import com.main.oneflix.actor.service.GetActorService;
import com.main.oneflix.actor.vo.ActorVO;

@Service
public class DeleteActorServiceImpl implements DeleteActorService {

	@Autowired
	private ActorDAO actorDAO;

	@Override
	public void deleteActorService(ActorVO vo) {
		actorDAO.deleteActor(vo);
	}

}

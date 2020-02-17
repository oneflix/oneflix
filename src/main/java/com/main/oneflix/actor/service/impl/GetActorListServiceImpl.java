package com.main.oneflix.actor.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.oneflix.actor.dao.ActorDAO;
import com.main.oneflix.actor.service.GetActorListService;
import com.main.oneflix.actor.vo.ActorVO;
@Service
public class GetActorListServiceImpl implements GetActorListService {
	@Autowired
	private ActorDAO actorDAO;
	

	@Override
	public List<ActorVO> getActorListService(ActorVO vo) {
		return actorDAO.getActorList(vo);
	}

}

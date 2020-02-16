package com.main.oneflix.actor.dao;

import java.util.List;

import com.main.oneflix.actor.vo.ActorVO;

public interface ActorDAO {
	public void insertActor(ActorVO vo);
	public ActorVO getActor(ActorVO vo);
	public List<ActorVO> getActorList(ActorVO vo);
	public void updateActor(ActorVO vo);
	public void deleteActor(ActorVO vo);
}

package com.main.oneflix.actor.vo;

public class ActorVO {

	private int rnum;
	private Integer actorId;
	private String actorName;
	private int actorAge;
	private String searchActor;

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	public Integer getActorId() {
		return actorId;
	}

	public String getSearchActor() {
		return searchActor;
	}

	public void setSearchActor(String searchActor) {
		this.searchActor = searchActor;
	}

	public void setActorId(Integer actorId) {
		this.actorId = actorId;
	}

	public String getActorName() {
		return actorName;
	}

	public void setActorName(String actorName) {
		this.actorName = actorName;
	}

	public int getActorAge() {
		return actorAge;
	}

	public void setActorAge(int actorAge) {
		this.actorAge = actorAge;
	}

}

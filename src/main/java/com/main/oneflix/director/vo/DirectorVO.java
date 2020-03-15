package com.main.oneflix.director.vo;

public class DirectorVO {

	private int rnum;
	private Integer directorId;
	private String directorName;
	private int directorAge;
	private String searchDirector;

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	public Integer getDirectorId() {
		return directorId;
	}

	public void setDirectorId(Integer directorId) {
		this.directorId = directorId;
	}

	public String getDirectorName() {
		return directorName;
	}

	public void setDirectorName(String directorName) {
		this.directorName = directorName;
	}

	public int getDirectorAge() {
		return directorAge;
	}

	public void setDirectorAge(int directorAge) {
		this.directorAge = directorAge;
	}

	public String getSearchDirector() {
		return searchDirector;
	}

	public void setSearchDirector(String searchDirector) {
		this.searchDirector = searchDirector;
	}

	@Override
	public String toString() {
		return "DirectorVO [rnum=" + rnum + ", directorId=" + directorId + ", directorName=" + directorName
				+ ", directorAge=" + directorAge + ", searchDirector=" + searchDirector + "]";
	}

	
}

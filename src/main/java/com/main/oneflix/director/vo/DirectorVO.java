package com.main.oneflix.director.vo;

import org.springframework.stereotype.Component;

@Component
public class DirectorVO {

	private Integer directorId;
	private String directorName;
	private int directorAge;
	private String searchDirectorName;

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

	public String getSearchDirectorName() {
		return searchDirectorName;
	}

	public void setSearchDirectorName(String searchDirectorName) {
		this.searchDirectorName = searchDirectorName;
	}
	
	
}

package com.main.oneflix.watch.vo;

import java.util.Date;

public class WatchVO {

	private Integer watchId;
	private String watchType;
	private String email;
	private Integer movieId;
	private Date watchDate;
	private Integer viewPoint;

	// 조건을 담기 위한 필드
	private Integer genreId;
	
	private int countWatch;
	
	public int getCountWatch() {
		return countWatch;
	}

	public void setCountWatch(int countWatch) {
		this.countWatch = countWatch;
	}

	public Integer getWatchId() {
		return watchId;
	}

	public void setWatchId(Integer watchId) {
		this.watchId = watchId;
	}

	public String getWatchType() {
		return watchType;
	}

	public void setWatchType(String watchType) {
		this.watchType = watchType;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Integer getMovieId() {
		return movieId;
	}

	public void setMovieId(Integer movieId) {
		this.movieId = movieId;
	}

	public Date getWatchDate() {
		return watchDate;
	}

	public void setWatchDate(Date watchDate) {
		this.watchDate = watchDate;
	}
	
	public Integer getViewPoint() {
		return viewPoint;
	}

	public void setViewPoint(Integer viewPoint) {
		this.viewPoint = viewPoint;
	}

	public Integer getGenreId() {
		return genreId;
	}

	public void setGenreId(Integer genreId) {
		this.genreId = genreId;
	}

	@Override
	public String toString() {
		return "WatchVO [watchId=" + watchId + ", watchType=" + watchType + ", email=" + email + ", movieId=" + movieId
				+ ", watchDate=" + watchDate + ", viewPoint=" + viewPoint + ", genreId=" + genreId + ", countWatch="
				+ countWatch + "]";
	}
	
	

}

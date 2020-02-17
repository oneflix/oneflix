package com.main.oneflix.movie.vo;

import java.util.Date;

public class MovieVO {

	private Integer movieId;
	private String movieTitle;
	private int movieScore;
	private String rating;
	private int duration;
	private int directorId;
	private int actorId1;
	private int actorId2;
	private int actorId3;
	private int actorId4;
	private int actorId5;
	private int genreId1;
	private int genreId2;
	private String country;
	private String release;
	private String summary;
	private String posterPath;
	private String fullVideoPath;
	private String teaserVideoPath;
	private int viewCount;
	private Date movieRegDate;
	private String mainCheck;

	public Integer getMovieId() {
		return movieId;
	}

	public void setMovieId(Integer movieId) {
		this.movieId = movieId;
	}

	public String getMovieTitle() {
		return movieTitle;
	}

	public void setMovieTitle(String movieTitle) {
		this.movieTitle = movieTitle;
	}

	public int getMovieScore() {
		return movieScore;
	}

	public void setMovieScore(int movieScore) {
		this.movieScore = movieScore;
	}

	public String getRating() {
		return rating;
	}

	public void setRating(String rating) {
		this.rating = rating;
	}

	public int getDuration() {
		return duration;
	}

	public void setDuration(int duration) {
		this.duration = duration;
	}

	public int getDirectorId() {
		return directorId;
	}

	public void setDirectorId(int directorId) {
		this.directorId = directorId;
	}

	public int getActorId1() {
		return actorId1;
	}

	public void setActorId1(int actorId1) {
		this.actorId1 = actorId1;
	}

	public int getActorId2() {
		return actorId2;
	}

	public void setActorId2(int actorId2) {
		this.actorId2 = actorId2;
	}

	public int getActorId3() {
		return actorId3;
	}

	public void setActorId3(int actorId3) {
		this.actorId3 = actorId3;
	}

	public int getActorId4() {
		return actorId4;
	}

	public void setActorId4(int actorId4) {
		this.actorId4 = actorId4;
	}

	public int getActorId5() {
		return actorId5;
	}

	public void setActorId5(int actorId5) {
		this.actorId5 = actorId5;
	}

	public int getGenreId1() {
		return genreId1;
	}

	public void setGenreId1(int genreId1) {
		this.genreId1 = genreId1;
	}

	public int getGenreId2() {
		return genreId2;
	}

	public void setGenreId2(int genreId2) {
		this.genreId2 = genreId2;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getRelease() {
		return release;
	}

	public void setRelease(String release) {
		this.release = release;
	}

	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}

	public String getPosterPath() {
		return posterPath;
	}

	public void setPosterPath(String posterPath) {
		this.posterPath = posterPath;
	}

	public String getFullVideoPath() {
		return fullVideoPath;
	}

	public void setFullVideoPath(String fullVideoPath) {
		this.fullVideoPath = fullVideoPath;
	}

	public String getTeaserVideoPath() {
		return teaserVideoPath;
	}

	public void setTeaserVideoPath(String teaserVideoPath) {
		this.teaserVideoPath = teaserVideoPath;
	}

	public int getViewCount() {
		return viewCount;
	}

	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}

	public Date getMovieRegDate() {
		return movieRegDate;
	}

	public void setMovieRegDate(Date movieRegDate) {
		this.movieRegDate = movieRegDate;
	}

	public String getMainCheck() {
		return mainCheck;
	}

	public void setMainCheck(String mainCheck) {
		this.mainCheck = mainCheck;
	}

}

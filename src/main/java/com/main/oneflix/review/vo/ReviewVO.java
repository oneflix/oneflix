package com.main.oneflix.review.vo;

import java.util.Date;

public class ReviewVO {

	private Integer reviewId;
	private Integer movieId;
	private String movieTitle;
	private String email;
	private String nick;
	private String reviewContent;
	private double reviewScore;
	private int likeCount;
	private Date reviewRegDate;

	public Integer getReviewId() {
		return reviewId;
	}

	public void setReviewId(Integer reviewId) {
		this.reviewId = reviewId;
	}

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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}


	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	public String getReviewContent() {
		return reviewContent;
	}

	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}

	public double getReviewScore() {
		return reviewScore;
	}

	public void setReviewScore(double reviewScore) {
		this.reviewScore = reviewScore;
	}

	public int getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}

	public Date getReviewRegDate() {
		return reviewRegDate;
	}

	public void setReviewRegDate(Date reviewRegDate) {
		this.reviewRegDate = reviewRegDate;
	}

}

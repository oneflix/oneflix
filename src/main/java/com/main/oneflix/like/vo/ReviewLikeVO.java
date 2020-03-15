package com.main.oneflix.like.vo;

public class ReviewLikeVO {

	private int reviewLikeId;
	private Integer reviewId;
	private int movieId;
	private String ReviewLikeEmail;

	public int getReviewLikeId() {
		return reviewLikeId;
	}

	public void setReviewLikeId(int reviewLikeId) {
		this.reviewLikeId = reviewLikeId;
	}

	public Integer getReviewId() {
		return reviewId;
	}

	public void setReviewId(Integer reviewId) {
		this.reviewId = reviewId;
	}

	public int getMovieId() {
		return movieId;
	}

	public void setMovieId(int movieId) {
		this.movieId = movieId;
	}

	public String getReviewLikeEmail() {
		return ReviewLikeEmail;
	}

	public void setReviewLikeEmail(String reviewLikeEmail) {
		ReviewLikeEmail = reviewLikeEmail;
	}

	@Override
	public String toString() {
		return "ReviewLikeVO [reviewLikeId=" + reviewLikeId + ", reviewId=" + reviewId + ", movieId=" + movieId
				+ ", ReviewLikeEmail=" + ReviewLikeEmail + "]";
	}
	
	

}

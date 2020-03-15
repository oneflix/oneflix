package com.main.oneflix.wish.vo;

public class WishVO {

	private Integer wishId;
	private Integer movieId;
	private String movieTitle;
	private String email;

	public Integer getWishId() {
		return wishId;
	}

	public void setWishId(Integer wishId) {
		this.wishId = wishId;
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

	@Override
	public String toString() {
		return "WishVO [wishId=" + wishId + ", movieId=" + movieId + ", movieTitle=" + movieTitle + ", email=" + email
				+ "]";
	}
	
	

}

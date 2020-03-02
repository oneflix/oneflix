package com.main.oneflix.movie.vo;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class MovieVO {

	private int rnum;
	private Integer movieId;
	private String movieTitle;
	private double movieScore;
	private String rating;
	private int duration;
	private int directorId;
	private String directorName;
	private int actorId1;
	private int actorId2;
	private int actorId3;
	private int actorId4;
	private int actorId5;
	private String actorName1;
	private String actorName2;
	private String actorName3;
	private String actorName4;
	private String actorName5;
	private int genreId1;
	private int genreId2;
	private String genre1;
	private String genre2;
	private String country;
	private String release;
	private String summary;
	private MultipartFile poster;
	private String posterPath;
	private MultipartFile fullVideo;
	private String fullVideoPath;
	private MultipartFile teaserVideo;
	private String teaserVideoPath;
	private int viewCount;
	private Date movieRegDate;
	private String movieStatus;
	private String mainCheck;
	private String movieSubtitle;
	private List<Integer> actorList;
	private List<Integer> genreList;
	private int searchGenre;
	private int recommendGenre;
	private String searchCondition;
	private String searchMovie;
	private String movieType;
	private String searchOrder;
	private int start;
	private int end;

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
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

	public double getMovieScore() {
		return movieScore;
	}

	public void setMovieScore(double movieScore) {
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

	public String getDirectorName() {
		return directorName;
	}

	public void setDirectorName(String directorName) {
		this.directorName = directorName;
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

	public String getActorName1() {
		return actorName1;
	}

	public void setActorName1(String actorName1) {
		this.actorName1 = actorName1;
	}

	public String getActorName2() {
		return actorName2;
	}

	public void setActorName2(String actorName2) {
		this.actorName2 = actorName2;
	}

	public String getActorName3() {
		return actorName3;
	}

	public void setActorName3(String actorName3) {
		this.actorName3 = actorName3;
	}

	public String getActorName4() {
		return actorName4;
	}

	public void setActorName4(String actorName4) {
		this.actorName4 = actorName4;
	}

	public String getActorName5() {
		return actorName5;
	}

	public void setActorName5(String actorName5) {
		this.actorName5 = actorName5;
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

	public String getGenre1() {
		return genre1;
	}

	public void setGenre1(String genre1) {
		this.genre1 = genre1;
	}

	public String getGenre2() {
		return genre2;
	}

	public void setGenre2(String genre2) {
		this.genre2 = genre2;
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

	public MultipartFile getPoster() {
		return poster;
	}

	public void setPoster(MultipartFile poster) {
		this.poster = poster;
	}

	public String getPosterPath() {
		return posterPath;
	}

	public void setPosterPath(String posterPath) {
		this.posterPath = posterPath;
	}

	public MultipartFile getFullVideo() {
		return fullVideo;
	}

	public void setFullVideo(MultipartFile fullVideo) {
		this.fullVideo = fullVideo;
	}

	public String getFullVideoPath() {
		return fullVideoPath;
	}

	public void setFullVideoPath(String fullVideoPath) {
		this.fullVideoPath = fullVideoPath;
	}

	public MultipartFile getTeaserVideo() {
		return teaserVideo;
	}

	public void setTeaserVideo(MultipartFile teaserVideo) {
		this.teaserVideo = teaserVideo;
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

	public String getMovieStatus() {
		return movieStatus;
	}

	public void setMovieStatus(String movieStatus) {
		this.movieStatus = movieStatus;
	}

	public String getMainCheck() {
		return mainCheck;
	}

	public void setMainCheck(String mainCheck) {
		this.mainCheck = mainCheck;
	}

	public String getMovieSubtitle() {
		return movieSubtitle;
	}

	public void setMovieSubtitle(String movieSubtitle) {
		this.movieSubtitle = movieSubtitle;
	}

	public List<Integer> getActorList() {
		return actorList;
	}

	public void setActorList(List<Integer> actorList) {
		this.actorList = actorList;
	}

	public List<Integer> getGenreList() {
		return genreList;
	}

	public void setGenreList(List<Integer> genreList) {
		this.genreList = genreList;
	}

	public int getSearchGenre() {
		return searchGenre;
	}

	public void setSearchGenre(int searchGenre) {
		this.searchGenre = searchGenre;
	}

	public int getRecommendGenre() {
		return recommendGenre;
	}

	public void setRecommendGenre(int recommendGenre) {
		this.recommendGenre = recommendGenre;
	}

	public String getSearchCondition() {
		return searchCondition;
	}

	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}

	public String getSearchMovie() {
		return searchMovie;
	}

	public void setSearchMovie(String searchMovie) {
		this.searchMovie = searchMovie;
	}

	public String getMovieType() {
		return movieType;
	}

	public void setMovieType(String movieType) {
		this.movieType = movieType;
	}

	public String getSearchOrder() {
		return searchOrder;
	}

	public void setSearchOrder(String searchOrder) {
		this.searchOrder = searchOrder;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

}

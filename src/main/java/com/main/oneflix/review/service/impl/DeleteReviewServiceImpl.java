package com.main.oneflix.review.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.oneflix.movie.dao.MovieDAO;
import com.main.oneflix.movie.vo.MovieVO;
import com.main.oneflix.review.dao.ReviewDAO;
import com.main.oneflix.review.service.DeleteReviewService;
import com.main.oneflix.review.vo.ReviewVO;

@Service
public class DeleteReviewServiceImpl implements DeleteReviewService {

	@Autowired
	private ReviewDAO reviewDAO;
	@Autowired
	private MovieDAO movieDAO;
	
	@Override
	public void deleteReview(ReviewVO vo) {
		reviewDAO.deleteReview(vo);
		MovieVO movie = new MovieVO();
		movie.setMovieId(vo.getMovieId());
		movieDAO.updateMovieScore(movie);
	}

}

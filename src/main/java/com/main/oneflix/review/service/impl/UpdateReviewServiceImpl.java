package com.main.oneflix.review.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.main.oneflix.movie.dao.MovieDAO;
import com.main.oneflix.movie.vo.MovieVO;
import com.main.oneflix.review.dao.ReviewDAO;
import com.main.oneflix.review.service.UpdateReviewService;
import com.main.oneflix.review.vo.ReviewVO;

@Service
public class UpdateReviewServiceImpl implements UpdateReviewService {

	@Autowired
	private ReviewDAO reviewDAO;
	@Autowired
	private MovieDAO movieDAO;
	
	@Override
	@Transactional
	public void updateReview(ReviewVO vo) {
		reviewDAO.updateReview(vo);
		MovieVO movie = new MovieVO();
		movie.setMovieId(vo.getMovieId());
		movieDAO.updateMovieScore(movie);

	}

}

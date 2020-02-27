package com.main.oneflix.movie.client.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.main.oneflix.movie.vo.MovieVO;
import com.main.oneflix.review.service.GetReviewListService;
import com.main.oneflix.review.service.GetReviewService;
import com.main.oneflix.review.vo.ReviewVO;

@Controller
public class MovieController {
	
	@Autowired
	private GetReviewListService getReviewListService;
	@Autowired
	private GetReviewService getReviewService;
	
	@RequestMapping("/getMovieDetailProc.do")
	public ModelAndView getMovieDetailProc(MovieVO vo, ModelAndView mav) {
		ReviewVO myReview = new ReviewVO();
		myReview.setEmail("purple@mail.com");
		myReview.setMovieId(vo.getMovieId());
		myReview = getReviewService.getReview(myReview);
		ReviewVO review = new ReviewVO();
		review.setMovieId(vo.getMovieId());
		List<ReviewVO> reviewList = getReviewListService.getReviewList(review);
		mav.addObject("reviewList", reviewList);
		mav.addObject("myReview", myReview);
		mav.addObject("movieId", vo.getMovieId());
		mav.setViewName("movieDetail");
		return mav;
	}
	

}

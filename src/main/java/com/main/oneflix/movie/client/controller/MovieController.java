package com.main.oneflix.movie.client.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.main.oneflix.genre.service.GetGenreListService;
import com.main.oneflix.genre.vo.GenreVO;
import com.main.oneflix.like.service.GetReviewLikeListService;
import com.main.oneflix.like.vo.ReviewLikeVO;
import com.main.oneflix.member.vo.MemberVO;
import com.main.oneflix.movie.service.GetMovieListService;
import com.main.oneflix.movie.service.GetMovieService;
import com.main.oneflix.movie.service.GetRecommendMovieListService;
import com.main.oneflix.movie.vo.MovieVO;
import com.main.oneflix.review.service.GetReviewListService;
import com.main.oneflix.review.service.GetReviewService;
import com.main.oneflix.review.vo.ReviewVO;
import com.main.oneflix.ticket.service.GetTicketListService;
import com.main.oneflix.ticket.vo.TicketVO;
import com.main.oneflix.wish.vo.WishVO;

@Controller
public class MovieController {
	
	@Autowired
	private GetMovieListService getMovieListService;
	@Autowired
	private GetRecommendMovieListService getRecommedMovieListService;
	@Autowired
	private GetGenreListService getGenreListService;
	@Autowired
	private GetMovieService getMovieService;
	@Autowired
	private GetReviewListService getReviewListService;
	@Autowired
	private GetReviewService getReviewService;
	@Autowired
	private GetTicketListService getTicketListService;
	//리뷰좋아요
	@Autowired
	private GetReviewLikeListService getReviewLikeService;
	
	@RequestMapping("/getMovieDetailProc.do")
	public ModelAndView getMovieDetailProc(MovieVO vo, HttpSession session, ModelAndView mav) {
		vo = getMovieService.getMovie(vo);
		MemberVO member = (MemberVO) session.getAttribute("member");
		ReviewVO myReview = new ReviewVO();
		myReview.setEmail(member.getEmail());
		myReview.setMovieId(vo.getMovieId());
		myReview = getReviewService.getReview(myReview);
		ReviewVO review = new ReviewVO();
		review.setMovieId(vo.getMovieId());
		List<ReviewVO> reviewList = getReviewListService.getReviewList(review);
		ReviewLikeVO reviewLikeVO = new ReviewLikeVO();
		reviewLikeVO.setMovieId(vo.getMovieId());
		reviewLikeVO.setReviewLikeEmail(member.getEmail());
		List<ReviewLikeVO> reviewLikeList = getReviewLikeService.getReviewLikeList(reviewLikeVO);
		vo.setEmail(member.getEmail());
		vo.setMovieType("wish");
		List<MovieVO> wishList = getMovieListService.getMovieList(vo);

		for(ReviewLikeVO reviewLike : reviewLikeList) {
			System.out.println("=========================================");
			System.out.println("reviewLike.getMovieId() : " + reviewLike.getMovieId());
			System.out.println("reviewLike.getReviewId() : " + reviewLike.getReviewId());
			System.out.println("reviewLike.getReviewLikeEmail() : " + reviewLike.getReviewLikeEmail());
			System.out.println("reviewLike.getReviewLikeId() : " + reviewLike.getReviewLikeId());
			System.out.println();
		}
		
		mav.addObject("reviewList", reviewList);
		mav.addObject("reviewLikeList", reviewLikeList);
		mav.addObject("wishList", wishList);
		mav.addObject("myReview", myReview);
		mav.addObject("movie", vo);
		mav.setViewName("movieDetail");
		return mav;
	}
	
	@RequestMapping("/getMovieListProc.do")
	public ModelAndView getMovieListProc(MovieVO vo, ModelAndView mav, HttpSession session) {
		if (vo.getSearchOrder() == null) { vo.setSearchOrder("new"); }
		vo.setStart(1);
		vo.setEnd(20);
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		vo.setEmail(member.getEmail());
		List<GenreVO> genreList = getGenreListService.getGenreList(new GenreVO());
		List<TicketVO> ticketList = getTicketListService.getTicketList(new TicketVO());
		List<MovieVO> movieList;
		if (vo.getSearchOrder().equals("recommend")) {
			movieList = getRecommedMovieListService.getRecommendMovieList(vo, genreList);
		} else {
			movieList = getMovieListService.getMovieList(vo);
		}
		
		mav.addObject("searchGenre", vo.getSearchGenre());
		mav.addObject("searchOrder", vo.getSearchOrder());
		mav.addObject("movieType", vo.getMovieType());
		mav.addObject("movieList", movieList);
		mav.addObject("genreList", genreList);
		mav.addObject("ticketList", ticketList);
		mav.addObject("member", member);
		mav.setViewName("movieList");
		return mav;
	}
	
	@RequestMapping("/getMovieListProcAjax.do")
	@ResponseBody
	public List<MovieVO> getMovieListProcAjax(MovieVO vo) {
		List<MovieVO> movieList = getMovieListService.getMovieList(vo);
		return movieList;
	}

}

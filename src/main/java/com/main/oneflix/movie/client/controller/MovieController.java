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
import com.main.oneflix.member.vo.MemberVO;
import com.main.oneflix.movie.service.GetMovieListService;
import com.main.oneflix.movie.vo.MovieVO;
import com.main.oneflix.review.service.GetReviewListService;
import com.main.oneflix.review.service.GetReviewService;
import com.main.oneflix.review.vo.ReviewVO;
import com.main.oneflix.ticket.service.GetTicketListService;
import com.main.oneflix.ticket.vo.TicketVO;

@Controller
public class MovieController {
	
	@Autowired
	private GetMovieListService getMovieListService;
	@Autowired
	private GetGenreListService getGenreListService;
	@Autowired
	private GetReviewListService getReviewListService;
	@Autowired
	private GetReviewService getReviewService;
	@Autowired
	private GetTicketListService getTicketListService;
	
	@RequestMapping("/getMovieDetailProc.do")
	public ModelAndView getMovieDetailProc(MovieVO vo, HttpSession session, ModelAndView mav) {
		MemberVO mem = new MemberVO();
		mem.setEmail("purple@mail.com");
		session.setAttribute("member", mem);
		// ^ session 받을때  지워도 되는 코드
		MemberVO member = (MemberVO) session.getAttribute("member");
		ReviewVO myReview = new ReviewVO();
		myReview.setEmail(member.getEmail());
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
	
	@RequestMapping("/getMovieListProc.do")
	public ModelAndView getMovieListProc(MovieVO vo, ModelAndView mav) {
		vo.setStart(1);
		vo.setEnd(20);
		List<MovieVO> movieList = getMovieListService.getMovieList(vo);
		List<GenreVO> genreList = getGenreListService.getGenreList(new GenreVO());
		List<TicketVO> ticketList = getTicketListService.getTicketList(new TicketVO());
		mav.addObject("movieList", movieList);
		mav.addObject("genreList", genreList);
		mav.addObject("ticketList", ticketList);
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

package com.main.oneflix.review.client.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.main.oneflix.member.vo.MemberVO;
import com.main.oneflix.movie.service.UpdateMovieScoreService;
import com.main.oneflix.movie.vo.MovieVO;
import com.main.oneflix.review.service.DeleteReviewService;
import com.main.oneflix.review.service.GetReviewListService;
import com.main.oneflix.review.service.InsertReviewService;
import com.main.oneflix.review.service.UpdateReviewService;
import com.main.oneflix.review.vo.ReviewVO;

@Controller
public class ReviewController {

	@Autowired
	private InsertReviewService insertReviewService;
	@Autowired
	private UpdateReviewService updateReviewService;
	@Autowired
	private DeleteReviewService deleteReviewService;
	@Autowired
	private GetReviewListService getReviewListService;

	@RequestMapping("/insertReviewProcAjax.do")
	@ResponseBody
	public void insertReviewProcAjax(ReviewVO vo) {
		insertReviewService.insertReview(vo);
	}

	@RequestMapping("/deleteReviewProc.do")
	public ModelAndView deleteReviewProc(ReviewVO vo, ModelAndView mav) {
		deleteReviewService.deleteReview(vo);
		mav.addObject("movieId", vo.getMovieId());
		mav.setViewName("redirect:/getMovieDetailProc.do");
		return mav;
	}

	@RequestMapping("/updateReviewProcAjax.do")
	@ResponseBody
	public void updateReviewProcAjax(ReviewVO vo) {
		updateReviewService.updateReview(vo);
	}


	@RequestMapping("/updateReviewProc.do")
	public ModelAndView updateReviewProc(ReviewVO vo, ModelAndView mav) {
		updateReviewService.updateReview(vo);
		mav.addObject("movieId", vo.getMovieId());
		mav.setViewName("redirect:/getMovieDetailProc.do");
		return mav;
	}

	@RequestMapping("/getReviewListProc.do")
	public ModelAndView getReviewListProc(ReviewVO vo, HttpSession session, ModelAndView mav) {
		vo.setStart(1);
		vo.setEnd(10);
		MemberVO member = (MemberVO) session.getAttribute("member");
		vo.setEmail(member.getEmail());
		List<ReviewVO> reviewList = getReviewListService.getReviewList(vo);
		mav.addObject("reviewList", reviewList);
		mav.setViewName("reviewList");

		return mav;
	}

	@RequestMapping("/getReviewListProcAjax.do")
	@ResponseBody
	public List<ReviewVO> getReviewListPRocAjax(ReviewVO vo, HttpSession session) {
		MemberVO member = (MemberVO) session.getAttribute("member");
		vo.setEmail(member.getEmail());
		List<ReviewVO> reviewList = getReviewListService.getReviewList(vo);
		return reviewList;
	}

}

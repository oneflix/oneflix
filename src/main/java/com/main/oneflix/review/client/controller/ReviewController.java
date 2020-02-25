package com.main.oneflix.review.client.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.main.oneflix.member.vo.MemberVO;
import com.main.oneflix.review.service.DeleteReviewService;
import com.main.oneflix.review.service.GetReviewListService;
import com.main.oneflix.review.service.GetReviewService;
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
	@Autowired
	private GetReviewService getReviewService;
	
	@RequestMapping("/insertReviewProc.do")
	public ModelAndView insertReviewProc(ReviewVO vo, ModelAndView mav) {
		insertReviewService.insertReview(vo);
		return mav;
	}
	
	@RequestMapping("/updateReviewProc.do")
	public ModelAndView getReviewProc(ReviewVO vo, ModelAndView mav) {
		updateReviewService.updateReview(vo);
		return mav;
	}
	
	@RequestMapping("/deleteReviewProc.do")
	public ModelAndView deleteReviewProc(ReviewVO vo, ModelAndView mav) {
		deleteReviewService.deleteReview(vo);
		return mav;
	}
	
	@RequestMapping("/getReviewListProc.do")
	public ModelAndView getReviewListProc(ReviewVO vo, HttpSession session, ModelAndView mav) {
		MemberVO member = (MemberVO)session.getAttribute("member");
		vo.setEmail(member.getEmail());
		List<ReviewVO> reviewList = getReviewListService.getReviewList(vo);
		for(ReviewVO review : reviewList) {
			System.out.println("movieTitle = "+review.getMovieTitle());
			System.out.println("reviewContent = "+review.getReviewContent());
			System.out.println("reviewScore = "+review.getReviewScore());
		}
		mav.addObject("reviewList",reviewList);
		mav.setViewName("reviewList");
		
		return mav;
	}


}

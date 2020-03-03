package com.main.oneflix.like.client.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.main.oneflix.like.service.DeleteAndUpdateReviewLikeService;
import com.main.oneflix.like.service.InsertAndUpdateReviewLikeService;
import com.main.oneflix.like.vo.ReviewLikeVO;
import com.main.oneflix.member.vo.MemberVO;
import com.main.oneflix.review.vo.ReviewVO;

@Controller
public class ReviewLikeController {
	
	@Autowired
	private InsertAndUpdateReviewLikeService insertAndUpdateReviewLikeService;
	@Autowired
	private DeleteAndUpdateReviewLikeService deleteAndUpdateReviewLikeService;

	
	@RequestMapping("/insertReviewLikeProc.do")
	@ResponseBody
	public void insertReviewLikeProc(ReviewVO reviewVO, ReviewLikeVO reviewLikeVO, HttpSession session) {
		insertAndUpdateReviewLikeService.insertAndUpdateReviewLike(reviewVO, reviewLikeVO);
	}
	
	@RequestMapping("/deleteReviewLikeProc.do")
	@ResponseBody
	public void deleteReviewLikeProc(ReviewVO reviewVO, ReviewLikeVO reviewLikeVO, HttpSession session) {
		MemberVO member = new MemberVO();
		member = (MemberVO) session.getAttribute("member");
		reviewLikeVO.setReviewLikeEmail(member.getEmail());
		deleteAndUpdateReviewLikeService.deleteAndUpdateReviewLike(reviewVO, reviewLikeVO);
	}
	
//	@RequestMapping("/reviewLikePlusProcAjax.do")
//	@ResponseBody
//	public ModelAndView reviewLikePlusAjax(ReviewLikeVO vo, ModelAndView mav) {
//		insertReviewLikeService.insertReviewLike(vo);
//	}
}

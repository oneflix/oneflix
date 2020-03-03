package com.main.oneflix.like.client.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.main.oneflix.like.service.DeleteReviewLikeService;
import com.main.oneflix.like.service.InsertReviewLikeService;
import com.main.oneflix.like.vo.ReviewLikeVO;
import com.main.oneflix.member.vo.MemberVO;

@Controller
public class ReviewLikeController {
	
	@Autowired
	private InsertReviewLikeService insertReviewLikeService;
	@Autowired
	private DeleteReviewLikeService deleteReviewLikeService;

	
	@RequestMapping("/insertReviewLikeProc.do")
	@ResponseBody
	public void insertReviewLikeProc(ReviewLikeVO vo, HttpSession session) {
		insertReviewLikeService.insertReviewLike(vo);
	}
	
	@RequestMapping("/deleteReviewLikeProc.do")
	@ResponseBody
	public void deleteReviewLikeProc(ReviewLikeVO vo, HttpSession session) {
		MemberVO member = new MemberVO();
		member = (MemberVO) session.getAttribute("member");
		vo.setReviewLikeEmail(member.getEmail());
		deleteReviewLikeService.deleteReviewLike(vo);
	}
	
//	@RequestMapping("/reviewLikePlusProcAjax.do")
//	@ResponseBody
//	public ModelAndView reviewLikePlusAjax(ReviewLikeVO vo, ModelAndView mav) {
//		insertReviewLikeService.insertReviewLike(vo);
//	}
}

package com.main.oneflix.like.client.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.main.oneflix.like.service.DeleteAndUpdateReviewLikeService;
import com.main.oneflix.like.service.GetReviewLikeListService;
import com.main.oneflix.like.service.InsertAndUpdateReviewLikeService;
import com.main.oneflix.like.vo.ReviewLikeVO;
import com.main.oneflix.review.service.GetReviewListService;
import com.main.oneflix.review.vo.ReviewVO;

@Controller
public class ReviewLikeController {

	@Autowired
	private InsertAndUpdateReviewLikeService insertAndUpdateReviewLikeService;
	@Autowired
	private DeleteAndUpdateReviewLikeService deleteAndUpdateReviewLikeService;
	@Autowired
	private GetReviewListService getReviewListService;

	@RequestMapping("/insertAndUpdateReviewLikeProc.do")
	@ResponseBody
	public List<ReviewVO> insertAndUpdateReviewLikeProc(ReviewVO reviewVO, ReviewLikeVO reviewLikeVO,	HttpSession session) {
		System.out.println("insertReviewLikeProc.ReviewVO : " + reviewVO);
		System.out.println("insertReviewLikeProc.reviewVO.getLikeCount() : " + reviewVO.getLikeCount());
		System.out.println("insertReviewLikeProc.reviewVO.getReviewId() : " + reviewVO.getReviewId());
		System.out.println("insertReviewLikeProc.reviewVO.getMovieId() : " + reviewVO.getMovieId());
		System.out.println("insertReviewLikeProc.reviewVO.getLikeCount() : " + reviewVO.getLikeCount());
		System.out.println("insertReviewLikeProc.ReviewLikeVO : " + reviewLikeVO);
		System.out.println(
				"insertReviewLikeProc.reviewLikeVO.getReviewLikeEmail() : " + reviewLikeVO.getReviewLikeEmail());

		int likeCount = reviewVO.getLikeCount();
		List<ReviewVO> reviewList = getReviewListService.getReviewList(reviewVO);
			likeCount++;
			System.out.println("리뷰카운트증가함? : " + likeCount);
			reviewVO.setLikeCount(likeCount);

		insertAndUpdateReviewLikeService.insertAndUpdateReviewLike(reviewVO, reviewLikeVO);
		return reviewList;

	}

	@RequestMapping("/deleteAndUpdateReviewLikeProc.do")
	@ResponseBody
	public ReviewVO deleteAndUpdateReviewLikeProc(ReviewVO reviewVO, ReviewLikeVO reviewLikeVO, HttpSession session) {
		int likeCount = reviewVO.getLikeCount();
		System.out.println("deleteReviewLikeProc.reviewVO.getLikeCount() : " + reviewVO.getLikeCount());
		
		likeCount--;
		System.out.println("리뷰카운트감소함? : " + likeCount);
		reviewVO.setLikeCount(likeCount);
		
		deleteAndUpdateReviewLikeService.deleteAndUpdateReviewLike(reviewVO, reviewLikeVO);
		return reviewVO;
	}

}

package com.main.oneflix.like.client.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.main.oneflix.like.service.DeleteAndUpdateReviewLikeService;
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
		int likeCount = reviewVO.getLikeCount();
		List<ReviewVO> reviewList = getReviewListService.getReviewList(reviewVO);
			likeCount++;
			reviewVO.setLikeCount(likeCount);

		insertAndUpdateReviewLikeService.insertAndUpdateReviewLike(reviewVO, reviewLikeVO);
		return reviewList;

	}

	@RequestMapping("/deleteAndUpdateReviewLikeProc.do")
	@ResponseBody
	public ReviewVO deleteAndUpdateReviewLikeProc(ReviewVO reviewVO, ReviewLikeVO reviewLikeVO, HttpSession session) {
		int likeCount = reviewVO.getLikeCount();
		
		likeCount--;
		reviewVO.setLikeCount(likeCount);
		
		deleteAndUpdateReviewLikeService.deleteAndUpdateReviewLike(reviewVO, reviewLikeVO);
		return reviewVO;
	}

}

package com.main.oneflix.like.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.main.oneflix.like.dao.ReviewLikeDAO;
import com.main.oneflix.like.service.DeleteAndUpdateReviewLikeService;
import com.main.oneflix.like.vo.ReviewLikeVO;
import com.main.oneflix.review.dao.ReviewDAO;
import com.main.oneflix.review.vo.ReviewVO;

@Service
public class DeleteAndUpdateReviewLikeServieceImpl implements DeleteAndUpdateReviewLikeService {

	@Autowired
	private ReviewDAO reviewDAO;
	@Autowired
	private ReviewLikeDAO reviewLikeDAO;

	@Override
	@Transactional
	public ReviewVO deleteAndUpdateReviewLike(ReviewVO reviewVO, ReviewLikeVO reviewLikeVO) {
		reviewDAO.updateLikeCount(reviewVO);
		reviewDAO.getLikeCount(reviewVO);
		reviewLikeDAO.deleteReviewLike(reviewLikeVO);
		
		return reviewVO;

	}

}

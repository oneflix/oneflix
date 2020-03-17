package com.main.oneflix.like.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.main.oneflix.like.dao.ReviewLikeDAO;
import com.main.oneflix.like.service.InsertAndUpdateReviewLikeService;
import com.main.oneflix.like.vo.ReviewLikeVO;
import com.main.oneflix.review.dao.ReviewDAO;
import com.main.oneflix.review.vo.ReviewVO;

@Service
public class InsertAndUpdateReviewLikeServiceImpl implements InsertAndUpdateReviewLikeService {

	@Autowired
	private ReviewDAO reviewDAO;
	@Autowired
	private ReviewLikeDAO reviewLikeDAO;

	@Override
	@Transactional
	public ReviewVO insertAndUpdateReviewLike(ReviewVO reviewVO, ReviewLikeVO reviewLikeVO) {
		reviewDAO.updateLikeCount(reviewVO);
		reviewDAO.getLikeCount(reviewVO);
		reviewLikeDAO.insertReviewLike(reviewLikeVO);
		return reviewVO;
	}

}

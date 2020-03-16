package com.main.oneflix.like.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.main.oneflix.like.dao.ReviewLikeDAO;
import com.main.oneflix.like.service.InsertAndUpdateReviewLikeService;
import com.main.oneflix.like.vo.ReviewLikeVO;
import com.main.oneflix.review.dao.ReviewDAO;
import com.main.oneflix.review.vo.ReviewVO;

@Transactional
@Service
public class InsertAndUpdateReviewLikeServiceImpl implements InsertAndUpdateReviewLikeService {

	@Autowired
	private ReviewDAO reviewDAO;
	@Autowired
	private ReviewLikeDAO reviewLikeDAO;
	

	@Override
	public ReviewVO insertAndUpdateReviewLike(ReviewVO reviewVO, ReviewLikeVO reviewLikeVO) {
		reviewDAO.updateLikeCount(reviewVO);
		try{
			throw new Exception();
		}catch(Exception e) {}
		reviewDAO.getLikeCount(reviewVO);
		reviewLikeDAO.insertReviewLike(reviewLikeVO);
		
		return reviewVO;
	}


}

package com.main.oneflix.like.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.oneflix.like.dao.ReviewLikeDAO;
import com.main.oneflix.like.service.InsertReviewLikeService;
import com.main.oneflix.like.vo.ReviewLikeVO;

@Service
public class InsertReviewLikeServiceImpl implements InsertReviewLikeService {

	@Autowired
	private ReviewLikeDAO reviewLikeDAO;
	
	@Override
	public void insertReviewLike(ReviewLikeVO vo) {
		reviewLikeDAO.insertReviewLike(vo);

	}


}

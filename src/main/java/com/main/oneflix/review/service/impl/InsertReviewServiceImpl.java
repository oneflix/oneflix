package com.main.oneflix.review.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.oneflix.review.dao.ReviewDAO;
import com.main.oneflix.review.service.InsertReviewService;
import com.main.oneflix.review.vo.ReviewVO;

@Service
public class InsertReviewServiceImpl implements InsertReviewService {

	@Autowired
	private ReviewDAO reviewDAO;
	
	@Override
	public void insertReview(ReviewVO vo) {
		reviewDAO.insertReview(vo);
	}

}

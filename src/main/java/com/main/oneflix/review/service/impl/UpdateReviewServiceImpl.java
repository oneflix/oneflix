package com.main.oneflix.review.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.oneflix.review.dao.ReviewDAO;
import com.main.oneflix.review.service.UpdateReviewService;
import com.main.oneflix.review.vo.ReviewVO;

@Service
public class UpdateReviewServiceImpl implements UpdateReviewService {

	@Autowired
	private ReviewDAO reviewDAO;
	
	@Override
	public void updateReview(ReviewVO vo) {
		reviewDAO.updateReview(vo);

	}

}

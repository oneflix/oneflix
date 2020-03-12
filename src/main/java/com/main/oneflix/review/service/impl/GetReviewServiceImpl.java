package com.main.oneflix.review.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.oneflix.review.dao.ReviewDAO;
import com.main.oneflix.review.service.GetReviewService;
import com.main.oneflix.review.vo.ReviewVO;

@Service
public class GetReviewServiceImpl implements GetReviewService {

	@Autowired
	private ReviewDAO reviewDAO;
	
	@Override
	public ReviewVO getReview(ReviewVO vo) {
		return reviewDAO.getReview(vo);

	}

}

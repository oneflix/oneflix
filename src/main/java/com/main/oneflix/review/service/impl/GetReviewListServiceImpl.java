package com.main.oneflix.review.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.oneflix.review.dao.ReviewDAO;
import com.main.oneflix.review.service.GetReviewListService;
import com.main.oneflix.review.vo.ReviewVO;

@Service
public class GetReviewListServiceImpl implements GetReviewListService {

	@Autowired
	private ReviewDAO reviewDAO;
	
	@Override
	public List<ReviewVO> getReviewList(ReviewVO vo) {
		List<ReviewVO> reviewList = reviewDAO.getReviewList(vo);
		return reviewList;
	}

}

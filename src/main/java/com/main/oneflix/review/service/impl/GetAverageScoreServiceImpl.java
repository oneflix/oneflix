package com.main.oneflix.review.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.oneflix.review.dao.ReviewDAO;
import com.main.oneflix.review.dao.ReviewDAO;
import com.main.oneflix.review.service.GetAverageScoreService;
import com.main.oneflix.review.vo.ReviewVO;

@Service
public class GetAverageScoreServiceImpl implements GetAverageScoreService {

	@Autowired
	private ReviewDAO reviewDAO;
	
	@Override
	public double getAverageScore(ReviewVO vo) {
		return reviewDAO.getAverageScore(vo);
	}

}

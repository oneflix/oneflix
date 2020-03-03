package com.main.oneflix.review.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.oneflix.review.dao.ReviewDAO;
import com.main.oneflix.review.service.GetLikeCountService;
import com.main.oneflix.review.vo.ReviewVO;

@Service
public class GetLikeCountServiceImpl implements GetLikeCountService {

	@Autowired
	private ReviewDAO reviewDAO;
	
	@Override
	public ReviewVO getLikeCount(ReviewVO vo) {
		return reviewDAO.getLikeCount(vo);
		
	}

}

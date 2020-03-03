package com.main.oneflix.like.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.oneflix.like.service.UpdateLikeCountService;
import com.main.oneflix.review.dao.ReviewDAO;
import com.main.oneflix.review.vo.ReviewVO;

@Service
public class UpdateLikeCountServiceImpl implements UpdateLikeCountService {

	@Autowired
	private ReviewDAO reviewDAO;
	
	@Override
	public void updateLikeCount(ReviewVO vo) {
		reviewDAO.updateLikeCount(vo);
	}

}

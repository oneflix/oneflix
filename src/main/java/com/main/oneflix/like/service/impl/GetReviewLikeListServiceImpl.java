package com.main.oneflix.like.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.oneflix.like.dao.ReviewLikeDAO;
import com.main.oneflix.like.service.GetReviewLikeListService;
import com.main.oneflix.like.vo.ReviewLikeVO;

@Service
public class GetReviewLikeListServiceImpl implements GetReviewLikeListService {

	@Autowired
	private ReviewLikeDAO reviewLikeDAO;

	@Override
	public List<ReviewLikeVO> getReviewLikeList(ReviewLikeVO vo) {
		return reviewLikeDAO.getReviewLikeList(vo);
	}
	
	
}

package com.main.oneflix.like.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.oneflix.like.dao.ReviewLikeDAO;
import com.main.oneflix.like.service.DeleteReviewLikeService;
import com.main.oneflix.like.vo.ReviewLikeVO;

@Service
public class DeleteReviewLikeServieceImpl implements DeleteReviewLikeService {

	@Autowired
	private ReviewLikeDAO reviewLikeDAO;
	@Override
	public void deleteReviewLike(ReviewLikeVO vo) {
		reviewLikeDAO.deleteReviewLike(vo);

	}

}

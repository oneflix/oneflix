package com.main.oneflix.like.dao;

import java.util.List;

import com.main.oneflix.like.vo.ReviewLikeVO;

public interface ReviewLikeDAO {
	
	void insertReviewLike(ReviewLikeVO vo);
	void deleteReviewLike(ReviewLikeVO vo);
	List<ReviewLikeVO> getReviewLikeList(ReviewLikeVO vo);

}

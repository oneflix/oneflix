package com.main.oneflix.like.service;

import com.main.oneflix.like.vo.ReviewLikeVO;
import com.main.oneflix.review.vo.ReviewVO;

public interface InsertAndUpdateReviewLikeService {

	void insertAndUpdateReviewLike(ReviewVO reviewVO,ReviewLikeVO reviewLikeVO);
	
	
}

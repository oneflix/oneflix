package com.main.oneflix.like.service;

import com.main.oneflix.like.vo.ReviewLikeVO;
import com.main.oneflix.review.vo.ReviewVO;

public interface DeleteAndUpdateReviewLikeService {
	
	void deleteAndUpdateReviewLike(ReviewVO reviewVO,ReviewLikeVO reviewLikeVO);
}

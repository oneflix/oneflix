package com.main.oneflix.like.service;

import java.util.List;

import com.main.oneflix.like.vo.ReviewLikeVO;

public interface GetReviewLikeListService {
	
	List<ReviewLikeVO> getReviewLikeList(ReviewLikeVO vo);

}

package com.main.oneflix.review.service;

import java.util.List;

import com.main.oneflix.review.vo.ReviewVO;

public interface GetReviewListService {
	
	List<ReviewVO> getReviewList(ReviewVO vo);

}

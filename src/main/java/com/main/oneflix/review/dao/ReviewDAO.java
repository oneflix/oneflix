package com.main.oneflix.review.dao;

import java.util.List;

import com.main.oneflix.review.vo.ReviewVO;

public interface ReviewDAO {
	
	void insertReview(ReviewVO vo);
	void updateReview(ReviewVO vo);
	void updateLikeCount(ReviewVO vo);
	void deleteReview(ReviewVO vo);
	ReviewVO getReview(ReviewVO vo);
	ReviewVO getLikeCount(ReviewVO vo);
	List<ReviewVO> getReviewList(ReviewVO vo);

}

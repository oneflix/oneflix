package com.main.oneflix.review.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.main.oneflix.review.dao.ReviewDAO;
import com.main.oneflix.review.vo.ReviewVO;

@Repository
public class OracleReviewDAO implements ReviewDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public void insertReview(ReviewVO vo) {
		sqlSessionTemplate.insert("ReviewDAO.insertReview", vo);

	}

	@Override
	public void updateReview(ReviewVO vo) {
		sqlSessionTemplate.update("ReviewDAO.updateReview", vo);

	}

	@Override
	public void updateLikeCount(ReviewVO vo) {
		sqlSessionTemplate.update("ReviewDAO.updateLikeCount", vo);

	}

	@Override
	public void deleteReview(ReviewVO vo) {
		sqlSessionTemplate.delete("ReviewDAO.deleteReview", vo);
	}

	@Override
	public ReviewVO getReview(ReviewVO vo) {
		return sqlSessionTemplate.selectOne("ReviewDAO.getReview", vo);
	}

	@Override
	public ReviewVO getLikeCount(ReviewVO vo) {
		return sqlSessionTemplate.selectOne("ReviewDAO.getLikeCount", vo);
	}

	@Override
	public List<ReviewVO> getReviewList(ReviewVO vo) {
		return sqlSessionTemplate.selectList("ReviewDAO.getReviewList", vo);
	}

	@Override
	public double getAverageScore(ReviewVO vo) {
		return sqlSessionTemplate.selectOne("ReviewDAO.getAverageScore",vo);
	}

}

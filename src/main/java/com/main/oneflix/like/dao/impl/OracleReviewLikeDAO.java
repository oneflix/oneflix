package com.main.oneflix.like.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.main.oneflix.like.dao.ReviewLikeDAO;
import com.main.oneflix.like.vo.ReviewLikeVO;

@Repository
public class OracleReviewLikeDAO implements ReviewLikeDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public void insertReviewLike(ReviewLikeVO vo) {
		sqlSessionTemplate.insert("ReviewLikeDAO.insertReviewLike", vo);

	}

	@Override
	public void deleteReviewLike(ReviewLikeVO vo) {
		sqlSessionTemplate.delete("ReviewLikeDAO.deleteReviewLike", vo);

	}

	@Override
	public List<ReviewLikeVO> getReviewLikeList(ReviewLikeVO vo) {
		return sqlSessionTemplate.selectList("ReviewLikeDAO.getReviewLikeList", vo);
	}

}

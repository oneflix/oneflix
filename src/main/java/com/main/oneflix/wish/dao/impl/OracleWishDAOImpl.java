package com.main.oneflix.wish.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.main.oneflix.wish.dao.WishDAO;
import com.main.oneflix.wish.vo.WishVO;

@Repository
public class OracleWishDAOImpl implements WishDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessiontemplate;

	@Override
	public void insertWish(WishVO vo) {
		sqlSessiontemplate.insert("WishDAO.insertWish", vo);
		
	}

	@Override
	public void deleteWish(WishVO vo) {
		sqlSessiontemplate.delete("WishDAO.deleteWish", vo);
		
	}

	@Override
	public List<WishVO> getWishList(WishVO vo) {
		return sqlSessiontemplate.selectList("WishDAO.getWishList", vo);
	}

}

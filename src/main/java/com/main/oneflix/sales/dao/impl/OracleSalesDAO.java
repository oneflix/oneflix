package com.main.oneflix.sales.dao.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.main.oneflix.sales.dao.SalesDAO;
import com.main.oneflix.sales.vo.SalesVO;

@Repository
public class OracleSalesDAO implements SalesDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public int countSales(SalesVO vo) {
		return sqlSessionTemplate.selectOne("SalesDAO.countSales", vo);
	}
}

package com.main.oneflix.sales.dao.impl;

import java.util.List;

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
	public SalesVO getSales(SalesVO vo) {
		return sqlSessionTemplate.selectOne("SalesDAO.getSales", vo);
	}

	@Override
	public void insertSales(SalesVO vo) {
		sqlSessionTemplate.insert("SalesDAO.insertSales", vo);
	}

	@Override
	public void updateSales(SalesVO vo) {
		sqlSessionTemplate.update("SalesDAO.updateSales", vo);
	}

	@Override
	public void deleteSales(SalesVO vo) {
		sqlSessionTemplate.delete("SalesDAO.deleteSales", vo);
	}

	@Override
	public List<SalesVO> getSalesList(SalesVO vo) {
		return sqlSessionTemplate.selectList("SalesDAO.getSalesList", vo);
	}

	@Override
	public int getTotalSales(SalesVO vo) {
		return sqlSessionTemplate.selectOne("SalesDAO.getTotalSales", vo);
	}
	
}

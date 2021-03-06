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

	@Override
	public int getCountSales(SalesVO vo) {
		return sqlSessionTemplate.selectOne("SalesDAO.getCountSales", vo);
	}

	@Override
	public void sellTicket(SalesVO vo) {
		sqlSessionTemplate.update("SalesDAO.sellTicket", vo);
	}
	
	@Override
	public List<String> expiryCheck() {
		return sqlSessionTemplate.selectList("SalesDAO.expiryCheck");
	}

	@Override
	public void updateExpiry() {
		sqlSessionTemplate.update("SalesDAO.updateExpiry");
	}

	@Override
	public int refundCheck(SalesVO vo) {
		return sqlSessionTemplate.selectOne("SalesDAO.refundCheck", vo);
	}

	@Override
	public List<SalesVO> getSubscriptionList() {
		return sqlSessionTemplate.selectList("SalesDAO.getSubscriptionList");
	}

	@Override
	public void insertSubscrition(SalesVO vo) {
		sqlSessionTemplate.insert("SalesDAO.insertSubscription", vo);
	}


}

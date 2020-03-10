package com.main.oneflix.sales.dao;

import java.util.List;

import com.main.oneflix.sales.vo.SalesVO;

public interface SalesDAO {

	List<SalesVO> getSalesList(SalesVO vo);
	SalesVO getSales(SalesVO vo);
	void insertSales(SalesVO vo);
	void updateSales(SalesVO vo);
	void deleteSales(SalesVO vo);
	int getTotalSales(SalesVO vo);
	int getCountSales(SalesVO vo);
	List<String> expiryCheck();
	void updateExpiry();
}

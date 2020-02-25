package com.main.oneflix.sales.dao;

import com.main.oneflix.sales.vo.SalesVO;

public interface SalesDAO {

	SalesVO getSales(SalesVO vo);
	void insertSales(SalesVO vo);
	void updateSales(SalesVO vo);
	void deleteSales(SalesVO vo);
}

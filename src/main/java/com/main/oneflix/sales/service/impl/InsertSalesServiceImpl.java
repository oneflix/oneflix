package com.main.oneflix.sales.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.oneflix.sales.dao.SalesDAO;
import com.main.oneflix.sales.service.InsertSalesService;
import com.main.oneflix.sales.vo.SalesVO;

@Service
public class InsertSalesServiceImpl implements InsertSalesService {

	@Autowired
	private SalesDAO salesDAO;

	@Override
	public void insertSales(SalesVO vo) {
		salesDAO.insertSales(vo);
	}


}

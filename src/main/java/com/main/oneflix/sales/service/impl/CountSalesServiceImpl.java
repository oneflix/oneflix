package com.main.oneflix.sales.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.oneflix.sales.dao.SalesDAO;
import com.main.oneflix.sales.service.CountSalesService;
import com.main.oneflix.sales.vo.SalesVO;

@Service
public class CountSalesServiceImpl implements CountSalesService {

	@Autowired
	private SalesDAO salesDAO;
	
	@Override
	public int countSales(SalesVO vo) {
		return salesDAO.countSales(vo);
	}

}

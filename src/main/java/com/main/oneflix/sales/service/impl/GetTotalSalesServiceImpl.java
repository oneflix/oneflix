package com.main.oneflix.sales.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.oneflix.sales.dao.SalesDAO;
import com.main.oneflix.sales.service.GetTotalSalesService;
import com.main.oneflix.sales.vo.SalesVO;

@Service
public class GetTotalSalesServiceImpl implements GetTotalSalesService {

	@Autowired
	private SalesDAO salesDAO;
	
	@Override
	public int getTotalSales(SalesVO vo) {
		return salesDAO.getTotalSales(vo);
	}

}

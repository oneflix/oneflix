package com.main.oneflix.sales.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.oneflix.sales.dao.SalesDAO;
import com.main.oneflix.sales.service.GetCountSalesService;
import com.main.oneflix.sales.vo.SalesVO;

@Service
public class GetCountSalesServiceImpl implements GetCountSalesService {

	@Autowired
	private SalesDAO salesDAO;
	
	@Override
	public int getCountSales(SalesVO vo) {
		return salesDAO.getCountSales(vo);
	}

}

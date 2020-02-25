package com.main.oneflix.sales.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.oneflix.sales.dao.SalesDAO;
import com.main.oneflix.sales.service.GetSalesService;
import com.main.oneflix.sales.vo.SalesVO;

@Service
public class GetSalesServiceImpl implements GetSalesService {

	@Autowired
	private SalesDAO salesDAO;
	
	@Override
	public SalesVO getSales(SalesVO vo) {
		return salesDAO.getSales(vo);
	}

}

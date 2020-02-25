package com.main.oneflix.sales.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.oneflix.sales.dao.SalesDAO;
import com.main.oneflix.sales.service.DeleteSalesService;
import com.main.oneflix.sales.vo.SalesVO;

@Service
public class DeleteSalesServiceImple implements DeleteSalesService {

	@Autowired
	private SalesDAO salesDAO;

	@Override
	public void deleteSales(SalesVO vo) {
		salesDAO.deleteSales(vo);
	}

}

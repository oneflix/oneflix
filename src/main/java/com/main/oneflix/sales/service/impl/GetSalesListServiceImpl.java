package com.main.oneflix.sales.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.oneflix.sales.dao.SalesDAO;
import com.main.oneflix.sales.service.GetSalesListService;
import com.main.oneflix.sales.vo.SalesVO;

@Service
public class GetSalesListServiceImpl implements GetSalesListService {

	@Autowired
	private SalesDAO salesDAO;
	
	@Override
	public List<SalesVO> getSalesList(SalesVO vo) {
		return salesDAO.getSalesList(vo);
	}

}

package com.main.oneflix.sales.service;

import java.util.List;

import com.main.oneflix.sales.vo.SalesVO;

public interface GetSalesListService {

	List<SalesVO> getSalesList(SalesVO vo);
}

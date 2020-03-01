package com.main.oneflix.sales.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.main.oneflix.sales.service.GetSalesListService;
import com.main.oneflix.sales.service.GetTotalSalesService;
import com.main.oneflix.sales.vo.SalesVO;
import com.main.onflix.util.datatable.vo.WrapperVO;

@Controller
public class SalesController {

	@Autowired
	private GetSalesListService getSalesListService;
	@Autowired
	private GetTotalSalesService getTotalSalesService;
	
	@RequestMapping("/salesList.mdo")
	public ModelAndView getSalesList(SalesVO vo, ModelAndView mav) {
		mav.setViewName("salesList");
		return mav;
	}
	
	@RequestMapping("/getSalesListProcAjax.mdo")
	@ResponseBody
	public WrapperVO getSalesListProcAjax(SalesVO vo) {
		WrapperVO wrap = new WrapperVO();
		List<SalesVO> salesList = getSalesListService.getSalesList(vo);
		int totalSales = getTotalSalesService.getTotalSales(vo);
		wrap.setData(salesList);
		wrap.setTotalSales(totalSales);
		wrap.setRecordsTotal(salesList.size());
		wrap.setRecordsFiltered(salesList.size());
		return wrap;
	}
	
}

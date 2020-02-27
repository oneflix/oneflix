package com.main.oneflix.sales.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	@RequestMapping("/getSalesList.mdo")
	public ModelAndView getSalesList(SalesVO vo, ModelAndView mav) {
//		List<SalesVO> salesList = getSalesListService.getSalesList(vo);
//		int totalSales = getTotalSalesService.getTotalSales(vo);
//		mav.addObject("salesList", salesList);
//		mav.addObject("totalSales", totalSales);
		mav.setViewName("salesList");
		return mav;
	}
	
	@RequestMapping("/getSalesListProcAjax.mdo")
	@ResponseBody
	public WrapperVO getSalesListProcAjax(SalesVO vo) {
		System.out.println("들어옴");
		WrapperVO wrap = new WrapperVO();
		List<SalesVO> salesList = getSalesListService.getSalesList(vo);
		int totalCount = salesList.size();
		System.out.println(totalCount);
		wrap.setData(salesList);
		wrap.setRecordsTotal(totalCount);
		wrap.setRecordsFiltered(totalCount);
		System.out.println("나감");
		return wrap;
	}
	
}

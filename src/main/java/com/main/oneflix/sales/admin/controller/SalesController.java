package com.main.oneflix.sales.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.main.oneflix.sales.service.DeleteSalesService;
import com.main.oneflix.sales.service.GetSalesListService;
import com.main.oneflix.sales.service.GetSalesService;
import com.main.oneflix.sales.service.InsertSalesService;
import com.main.oneflix.sales.service.UpdateSalesService;
import com.main.oneflix.sales.vo.SalesVO;

@Controller
public class SalesController {

	@Autowired
	private GetSalesService getSalesService;
	@Autowired
	private InsertSalesService insertSalesService;
	@Autowired
	private UpdateSalesService updateSalesService;
	@Autowired
	private DeleteSalesService deleteSalesService;
	@Autowired
	private GetSalesListService getSalesListService;
	
	@RequestMapping("/getSalesListProc.mdo")
	public ModelAndView getSalesListProc(SalesVO vo, ModelAndView mav) {
		List<SalesVO> salesList = getSalesListService.getSalesList(vo);
		mav.addObject("salesList", salesList);
		mav.setViewName("salesList");
		return mav;
	}
	
}

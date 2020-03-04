package com.main.oneflix.ticket.client.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.main.oneflix.member.vo.MemberVO;
import com.main.oneflix.sales.service.GetSalesListService;
import com.main.oneflix.sales.vo.SalesVO;

@Controller
public class TicketController {
	//유저의 이용권 구매내역 관리 : sales-mapping 사용
	
	@Autowired
	private GetSalesListService getSalesListService;
	
	@RequestMapping("/getPaymentListProc.do")
	public ModelAndView getPaymentListProc(SalesVO vo, HttpSession session, ModelAndView mav) {
		MemberVO member = (MemberVO) session.getAttribute("member");
		vo.setEmail(member.getEmail());
		List<SalesVO> paymentList = getSalesListService.getSalesList(vo);
		mav.addObject("paymentList", paymentList);
		mav.setViewName("paymentList");
		return mav;
	}
	
	
	

}

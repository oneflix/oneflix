package com.main.oneflix.mypage.payment.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.main.oneflix.member.vo.MemberVO;
import com.main.oneflix.sales.service.GetCountSalesService;
import com.main.oneflix.sales.service.GetSalesListService;
import com.main.oneflix.sales.vo.SalesVO;
import com.main.oneflix.ticket.service.GetTicketListService;
import com.main.oneflix.ticket.vo.TicketVO;
import com.main.oneflix.util.paging.service.PagingService;
import com.main.oneflix.util.paging.vo.PagingVO;

@Controller
public class MypagePaymentController {

	@Autowired
	private GetSalesListService getSalesListService;
	@Autowired
	private GetTicketListService getTicketListService;
	@Autowired
	private GetCountSalesService getCountSalesService;
	@Autowired
	private PagingService pagingService;
	
	//유저 이용권 페이지
	@RequestMapping("/getPaymentListProc.do")
	public ModelAndView getPaymentListProc(PagingVO vo, HttpSession session, ModelAndView mav) {
		MemberVO member = (MemberVO) session.getAttribute("member");
		SalesVO sales = new SalesVO();
		sales.setEmail(member.getEmail());
		List<TicketVO> ticketList = getTicketListService.getTicketList(new TicketVO());
		List<SalesVO> paymentList = getSalesListService.getSalesList(sales);
		
		int total = getCountSalesService.getCountSales(sales);
		if (vo.getNowPage() == 0) {
			vo.setNowPage(1);
		}
		vo.setTotal(total);
		vo = pagingService.buildPaging(vo);

		sales.setStart(vo.getStart());
		sales.setEnd(vo.getEnd());
		
		mav.addObject("paging", vo);
		mav.addObject("paymentList", paymentList);
		mav.addObject("ticketList", ticketList);
		mav.setViewName("paymentList");
		return mav;
	}
}

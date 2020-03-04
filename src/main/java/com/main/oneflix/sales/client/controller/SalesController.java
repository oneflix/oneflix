package com.main.oneflix.sales.client.controller;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.main.oneflix.member.vo.MemberVO;
import com.main.oneflix.sales.service.DeleteSalesService;
import com.main.oneflix.sales.service.GetCountSalesService;
import com.main.oneflix.sales.service.GetSalesListService;
import com.main.oneflix.sales.service.GetSalesService;
import com.main.oneflix.sales.service.InsertSalesService;
import com.main.oneflix.sales.service.UpdateSalesService;
import com.main.oneflix.sales.vo.SalesVO;
import com.main.oneflix.ticket.service.GetTicketListService;
import com.main.oneflix.ticket.service.GetTicketService;
import com.main.oneflix.ticket.vo.TicketVO;
import com.main.oneflix.util.kakao.payment.service.ApprovePaymentService;
import com.main.oneflix.util.kakao.payment.service.ReadyPaymentService;
import com.main.oneflix.util.paging.service.PagingService;
import com.main.oneflix.util.paging.vo.PagingVO;

@Controller
public class SalesController {
	
	@Autowired
	private ReadyPaymentService readyPaymentService;
	@Autowired
	private ApprovePaymentService approvePaymentService;
	@Autowired
	private GetSalesService getSalesService;
	@Autowired
	private InsertSalesService insertSalesService;
	@Autowired
	private UpdateSalesService updateSalesService;
	@Autowired
	private DeleteSalesService deleteSalesService;
	@Autowired
	private GetTicketService getTicketService;
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
		System.out.println("salesTotal : " + total);
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

	@RequestMapping("/paymentRequestProc.do")
	@ResponseBody
	public SalesVO paymentRequestProc(SalesVO vo, ModelAndView mav, HttpSession session) {
		
		TicketVO ticket = new TicketVO();
		ticket.setTicketId(vo.getTicketId());
		ticket = getTicketService.getTicket(ticket);

		// 정기권 이라면
		if (ticket.getTicketPeriod() == -1) {
			vo.setCid("subscription");
		} else { // 기간제이면
			vo.setCid("single");
		}
		
		vo.setSalesId(makeSalesId());

		// 유저 닉네임 셋팅
		MemberVO member = (MemberVO) session.getAttribute("member");
		vo.setEmail(member.getEmail());
		
		// 아이템 이름
		vo.setItem_name(ticket.getTicketName());
		// 가격
		vo.setTotal_amount(String.valueOf(ticket.getTicketPrice()));
		vo.setQuantity("1");
		vo.setTax_free_amount("0");
		
		vo.setApproval_url("paymentApproveProc.do?email=" + vo.getEmail());
		vo.setCancel_url("paymentCancelProc.do?email=" + vo.getEmail());
		vo.setFail_url("paymentFailProc.do?email=" + vo.getEmail());
		vo.setSalesStatus("ready");
		
		// 지정 안 하면 카카오머니도 선택 가능
//		vo.setPayment_method_type("CARD");
		
		SalesVO response = (readyPaymentService.readyPayment(vo));
		System.out.println(vo.getEmail());
		insertSalesService.insertSales(vo);
		return response;
	}
	
	@RequestMapping("/paymentApproveProc.do")
	public ModelAndView paymentApproveProc(SalesVO vo, ModelAndView mav) {
		String pg_token = vo.getPg_token();
		
		// sales_status가 ready인 행을 검색하기 위해 셋팅
		vo.setSalesStatus("ready");
		vo = getSalesService.getSales(vo);
		
		// 찾아온 vo에 pg_token 셋팅
		vo.setPg_token(pg_token);
		vo = approvePaymentService.approvePayment(vo);
		
		// sales_status success로 업데이트 및 나머지 값 업데이트
		vo.setSalesStatus("success");
		updateSalesService.updateSales(vo);
		
		mav.setViewName("redirect:/paymentSuccessProc.do?email=" + vo.getEmail());
		return mav;
	}
	
	@RequestMapping("/paymentSuccessProc.do")
	public ModelAndView paymentSuccessProc(SalesVO vo, ModelAndView mav) {
		String email = vo.getEmail();
		vo.setSalesStatus("success");
		vo = getSalesService.getSales(vo);
		if (vo == null) {
			mav.setViewName("redirect:/paymentFailProc.do?email=" + email);
		} else {
			mav.addObject("sales", vo);
			mav.setViewName("paymentResult");
		}
		return mav;
	}
	
	@RequestMapping("/paymentCancelProc.do")
	public ModelAndView paymentCancelProc(SalesVO vo, ModelAndView mav) {
		vo.setSalesStatus("ready");
		deleteSalesService.deleteSales(vo);
		mav.setViewName("redirect:/homeProc.do");
		return mav;
	}
	
	@RequestMapping("/paymentFailProc.do")
	public ModelAndView paymentFailProc(SalesVO vo, ModelAndView mav) {
		vo.setSalesStatus("ready");
		deleteSalesService.deleteSales(vo);
		mav.setViewName("paymentResult");
		return mav;
	}
	
	private String makeSalesId() {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
		long currentTime = System.currentTimeMillis();
		String time = String.valueOf(currentTime);
		time = time.substring(time.length() - 8, time.length());
		StringBuilder salesId = new StringBuilder(dateFormat.format(currentTime));
		salesId.append(time);
		return salesId.toString();
	}
}

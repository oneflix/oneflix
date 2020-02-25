package com.main.oneflix.sales.client.controller;

import java.text.SimpleDateFormat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.main.oneflix.member.service.GetMemberService;
import com.main.oneflix.sales.service.DeleteSalesService;
import com.main.oneflix.sales.service.GetSalesService;
import com.main.oneflix.sales.service.InsertSalesService;
import com.main.oneflix.sales.service.UpdateSalesService;
import com.main.oneflix.sales.vo.SalesVO;
import com.main.oneflix.ticket.service.GetTicketService;
import com.main.oneflix.util.kakao.payment.service.ApprovePaymentService;
import com.main.oneflix.util.kakao.payment.service.ReadyPaymentService;

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
	private GetMemberService getMemberService;
	
	

	@RequestMapping("/paymentRequestProc.do")
	@ResponseBody
	public SalesVO paymentRequestProc(SalesVO vo, ModelAndView mav) {
		vo.setCid("single");
		vo.setSalesId(makeSalesId());
		System.out.println(vo.getEmail());
		vo.setItem_name("젓가락");
		vo.setTotal_amount("2100");
		vo.setQuantity("1");
		vo.setTax_free_amount("0");
		vo.setApproval_url("paymentApproveProc.do?email=" + vo.getEmail());
		vo.setCancel_url("paymentCancelProc.do?email=" + vo.getEmail());
		vo.setFail_url("paymentFailProc.do?email=" + vo.getEmail());
		vo.setSalesStatus("ready");
		
		SalesVO response = (readyPaymentService.readyPayment(vo));
		System.out.println(response);
		insertSalesService.insertSales(vo);
//		TicketVO ticket = new TicketVO();
//		ticket.setTicketId(vo.getTicketId());
//		ticket = getTicketService.getTicket(ticket);
//
//		// 정기권 이라면
//		if (ticket.getTicketPeriod() != -1) {
//			props.setProperty("cid", "subscription");
//		} else { // 기간제이면
//			props.setProperty("cid", "single");
//		}
//		// sales_id + 1 갖고오기
//		int orderId = countSalesService.countSales(vo) + 1;
//		props.setProperty("partener_order_id", String.valueOf(orderId));
//
//		// 유저 닉네임 셋팅
//		MemberVO member = new MemberVO();
//		member.setEmail(vo.getMemberEmail());
//		member = getMemberService.getMember(member);
//		props.setProperty("parter_user_id", member.getNick());
//
//		props.setProperty("item_name", ticket.getTicketName());
//		props.setProperty("total_amount", String.valueOf(ticket.getTicketPrice()));
//		props.setProperty("quantity", "1");
//		props.setProperty("tax_free_amount", "0");
//
//		// 지정 안 하면 카카오머니도 선택 가능
//		props.setProperty("payment_method_type", "CARD");
//
//		props.setProperty("approval_url", "/home.do");
//		props.setProperty("cancel_url", "/home.do");
//		props.setProperty("fail_url", "/home.do");
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
		System.out.println(vo);
		
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
		System.out.println("실패");
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

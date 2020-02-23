package com.main.oneflix.sales.client.controller;

import java.util.Properties;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.main.oneflix.kakao.payment.service.ReadyPaymentService;
import com.main.oneflix.member.service.GetMemberService;
import com.main.oneflix.member.vo.MemberVO;
import com.main.oneflix.sales.service.CountSalesService;
import com.main.oneflix.sales.vo.SalesVO;
import com.main.oneflix.ticket.service.GetTicketService;
import com.main.oneflix.ticket.vo.TicketVO;

@Controller
public class SalesController {
	
	@Autowired
	private GetTicketService getTicketService;

	@Autowired
	private CountSalesService countSalesService;

	@Autowired
	private GetMemberService getMemberService;
	
	@Autowired
	private ReadyPaymentService readyPaymentService;

	@RequestMapping("/paymentRequest.do")
	@ResponseBody
	public Properties paymentRequest(SalesVO vo, ModelAndView mav) {
		Properties props = new Properties();
		props.setProperty("cid", "subscription");
		props.setProperty("partner_order_id", "1001");
		props.setProperty("partner_user_id", "userTest");
		props.setProperty("item_name", "젓가락");
		props.setProperty("total_amount", "2100");
		props.setProperty("quantity", "1");
		props.setProperty("tax_free_amount", "0");
		props.setProperty("payment_method_type", "CARD");
		props.setProperty("approval_url", "/success.do?action=approve");
		props.setProperty("cancel_url", "/cancel.do");
		props.setProperty("fail_url", "/fail.do");
		
		System.out.println(readyPaymentService.readyPayment(props));
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

		return props;
	}
}

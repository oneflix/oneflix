package com.main.oneflix.home.client.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.main.oneflix.member.vo.MemberVO;
import com.main.oneflix.ticket.service.GetTicketListService;
import com.main.oneflix.ticket.vo.TicketVO;

@Controller
public class HomeController {

	@Autowired
	private GetTicketListService getTicketListService;
	
	@RequestMapping("/homeProc.do")
	public ModelAndView mainProc(MemberVO vo, ModelAndView mav) {
		// 값 셋팅하기
		List<TicketVO> ticketList = getTicketListService.getTicketList(new TicketVO());
		mav.addObject("ticketList", ticketList);
		mav.setViewName("home");
		return mav;
	}
}

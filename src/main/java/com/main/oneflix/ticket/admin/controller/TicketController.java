package com.main.oneflix.ticket.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.main.oneflix.ticket.service.DeleteTicketService;
import com.main.oneflix.ticket.service.GetTicketListService;
import com.main.oneflix.ticket.service.GetTicketService;
import com.main.oneflix.ticket.service.InsertTicketService;
import com.main.oneflix.ticket.service.UpdateTicketService;
import com.main.oneflix.ticket.vo.TicketVO;

@Controller
public class TicketController {
	@Autowired
	InsertTicketService insertTicketService;
	@Autowired
	GetTicketService getTicketService;
	@Autowired
	GetTicketListService getTicketListService;
	@Autowired
	UpdateTicketService updateTicketService;
	@Autowired
	DeleteTicketService deleteTicketService;

	@RequestMapping("/insertTicket.mdo")
	public ModelAndView insertTicket(ModelAndView mav) {
		mav.setViewName("ticketList");
		return mav;
	}
	@RequestMapping("/insertTicketProc.mdo")
	public ModelAndView insertTicketProc(TicketVO vo, ModelAndView mav) {
		insertTicketService.insertTicket(vo);
		mav.setViewName("redirect:/ticketList.mdo");
		return mav;
	}
	@RequestMapping("/getTicketList.mdo")
	public ModelAndView getTicketList(TicketVO vo, ModelAndView mav) {
		List<TicketVO> getTicketList = getTicketListService.getTicketList(vo);
		mav.addObject("getTicketList", getTicketList);
		mav.setViewName("getTicketList");
		return mav;
	}
	@RequestMapping("/updateTicket.mdo")
	public ModelAndView updateTicket(TicketVO vo, ModelAndView mav) {
		vo = getTicketService.getTicketService(vo);
		mav.addObject("updateTicket", vo);
		mav.setViewName("updateTicket");
		return mav;
	}
	@RequestMapping("/updateTicketProc.mdo")
	public ModelAndView updateTicketProc(TicketVO vo, ModelAndView mav) {
		updateTicketService.updateTicketService(vo);
		mav.setViewName("redirect:/ticketList.mdo");
		return mav;
	}
	@RequestMapping("/deleteTicket.mdo")
	public ModelAndView deleteTicket(TicketVO vo, ModelAndView mav) {
		deleteTicketService.deleteTicketService(vo);
		mav.setViewName("deleteTicket");
		return mav;
	}
}

package com.main.oneflix.ticket.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.main.oneflix.ticket.service.DeleteTicketService;
import com.main.oneflix.ticket.service.GetTicketListService;
import com.main.oneflix.ticket.service.GetTicketService;
import com.main.oneflix.ticket.service.InsertTicketService;
import com.main.oneflix.ticket.service.UpdateTicketService;
import com.main.oneflix.ticket.vo.TicketVO;
import com.main.oneflix.util.datatable.vo.WrapperVO;

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

	@RequestMapping("/ticketList.mdo")
	public ModelAndView ticketList(ModelAndView mav) {
		mav.setViewName("ticketList");
		return mav;
	}

	@RequestMapping("/getTicketListProcAjax.mdo")
	@ResponseBody
	public WrapperVO getTicketListProcAjax(TicketVO vo) {
		WrapperVO wrap = new WrapperVO();
		List<TicketVO> ticketList = getTicketListService.getTicketList(vo);
		wrap.setData(ticketList);
		wrap.setRecordsTotal(ticketList.size());
		wrap.setRecordsFiltered(ticketList.size());
		return wrap;
	}

	@RequestMapping("/insertTicket.mdo")
	public ModelAndView insertTicket(ModelAndView mav) {
		mav.setViewName("insertTicket");
		return mav;
	}

	@RequestMapping("/insertTicketProc.mdo")
	public ModelAndView insertTicketProc(TicketVO vo, ModelAndView mav) {
		insertTicketService.insertTicket(vo);
		mav.setViewName("redirect:/ticketList.mdo");
		return mav;
	}

	@RequestMapping("/getTicketProc.mdo")
	public ModelAndView getTicketProc(TicketVO vo, ModelAndView mav) {
		vo = getTicketService.getTicket(vo);
		mav.addObject("ticket", vo);
		mav.setViewName("updateTicket");
		return mav;
	}

	@RequestMapping("/updateTicketProc.mdo")
	public ModelAndView updateTicketProc(TicketVO vo, ModelAndView mav) {
		updateTicketService.updateTicket(vo);
		mav.setViewName("redirect:/ticketList.mdo");
		return mav;
	}

	@RequestMapping("/deleteTicketProc.mdo")
	public ModelAndView deleteTicketProc(TicketVO vo, ModelAndView mav) {
		deleteTicketService.deleteTicket(vo);
		mav.setViewName("redirect:/ticketList.mdo");
		return mav;
	}
}

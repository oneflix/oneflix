package com.main.oneflix.ticket.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.oneflix.ticket.dao.TicketDAO;
import com.main.oneflix.ticket.service.UpdateTicketService;
import com.main.oneflix.ticket.vo.TicketVO;

@Service
public class UpdateTicketServiceImpl implements UpdateTicketService {
	@Autowired
	private TicketDAO ticketDAO;
	@Override
	public void updateTicket(TicketVO vo) {
		ticketDAO.updateTicket(vo);
	}

}

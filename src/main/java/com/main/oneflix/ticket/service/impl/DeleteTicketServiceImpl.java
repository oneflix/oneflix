package com.main.oneflix.ticket.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.oneflix.ticket.dao.TicketDAO;
import com.main.oneflix.ticket.service.DeleteTicketService;
import com.main.oneflix.ticket.vo.TicketVO;

@Service
public class DeleteTicketServiceImpl implements DeleteTicketService {
	@Autowired
	private TicketDAO ticketDAO;
	@Override
	public void deleteTicket(TicketVO vo) {
		ticketDAO.deleteTicket(vo);

	}

}

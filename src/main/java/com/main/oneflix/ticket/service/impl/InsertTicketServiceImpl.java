package com.main.oneflix.ticket.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.oneflix.ticket.dao.TicketDAO;
import com.main.oneflix.ticket.service.InsertTicketService;
import com.main.oneflix.ticket.vo.TicketVO;

@Service
public class InsertTicketServiceImpl implements InsertTicketService {
	@Autowired
	private TicketDAO ticketDAO;
	@Override
	public void insertTicket(TicketVO vo) {
		ticketDAO.insertTicket(vo);

	}

}

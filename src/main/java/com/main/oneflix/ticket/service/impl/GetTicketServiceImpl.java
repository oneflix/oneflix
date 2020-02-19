package com.main.oneflix.ticket.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.oneflix.ticket.dao.TicketDAO;
import com.main.oneflix.ticket.service.GetTicketService;
import com.main.oneflix.ticket.vo.TicketVO;

@Service
public class GetTicketServiceImpl implements GetTicketService {
	@Autowired
	private TicketDAO ticketDAO;
	@Override
	public TicketVO getTicket(TicketVO vo) {
		return ticketDAO.getTicket(vo);
	}

}

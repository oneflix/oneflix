package com.main.oneflix.ticket.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.oneflix.ticket.dao.TicketDAO;
import com.main.oneflix.ticket.service.GetTicketListService;
import com.main.oneflix.ticket.vo.TicketVO;

@Service
public class GetTicketListServiceImpl implements GetTicketListService {
	@Autowired
	private TicketDAO ticketDAO;
	@Override
	public List<TicketVO> getTicketList(TicketVO vo) {
		return ticketDAO.getTicketList(vo);
	}

}

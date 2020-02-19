package com.main.oneflix.ticket.service;

import java.util.List;

import com.main.oneflix.ticket.vo.TicketVO;

public interface GetTicketListService {
	List<TicketVO> getTicketList(TicketVO vo);
}

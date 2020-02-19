package com.main.oneflix.ticket.dao;

import java.util.List;

import com.main.oneflix.ticket.vo.TicketVO;

public interface TicketDAO {
		public void insertTicket(TicketVO vo);
		public TicketVO getTicket(TicketVO vo);
		public List<TicketVO> getTicketList(TicketVO vo);
		public void updateTicket(TicketVO vo);
		public void deleteTicket(TicketVO vo);
}

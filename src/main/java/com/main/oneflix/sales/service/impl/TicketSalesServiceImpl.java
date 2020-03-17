package com.main.oneflix.sales.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.main.oneflix.member.dao.MemberDAO;
import com.main.oneflix.member.vo.MemberVO;
import com.main.oneflix.sales.dao.SalesDAO;
import com.main.oneflix.sales.service.TicketSalesService;
import com.main.oneflix.sales.vo.SalesVO;

@Service
public class TicketSalesServiceImpl implements TicketSalesService {

	@Autowired
	private SalesDAO salesDAO;
	@Autowired
	private MemberDAO memberDAO;
	
	@Override
	@Transactional
	public void sellTicket(SalesVO vo) {
		salesDAO.sellTicket(vo);
		MemberVO member = new MemberVO();
		member.setEmail(vo.getEmail());
		member.setUpdateType("sales");
		member.setTicketId(vo.getTicketId());
		memberDAO.updateMember(member);
	}

}

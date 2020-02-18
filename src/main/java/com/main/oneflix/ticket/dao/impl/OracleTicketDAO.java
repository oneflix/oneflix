package com.main.oneflix.ticket.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.main.oneflix.ticket.dao.TicketDAO;
import com.main.oneflix.ticket.vo.TicketVO;

@Repository
public class OracleTicketDAO implements TicketDAO {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	@Override
	public void insertTicket(TicketVO vo) {
		sqlSessionTemplate.insert("MembershipDAO.insertTicket", vo);
	}
	@Override
	public TicketVO getTicket(TicketVO vo) {
		return sqlSessionTemplate.selectOne("MembershipDAO.getTicket", vo);
	}
	@Override
	public void updateTicket(TicketVO vo) {
		sqlSessionTemplate.update("MembershipDAO.updateTicket", vo);
	}
	@Override
	public void deleteTicket(TicketVO vo) {
		sqlSessionTemplate.delete("MembershipDAO.deleteTicket", vo);
	}
	@Override
	public List<TicketVO> getTicketList(TicketVO vo) {
		return sqlSessionTemplate.selectList("MembershipDAO.getTicketList", vo);
	}

}

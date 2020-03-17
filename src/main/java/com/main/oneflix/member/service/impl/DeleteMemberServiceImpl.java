package com.main.oneflix.member.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.main.oneflix.member.dao.MemberDAO;
import com.main.oneflix.member.service.DeleteMemberService;
import com.main.oneflix.member.vo.MemberVO;
import com.main.oneflix.sales.dao.SalesDAO;
import com.main.oneflix.sales.vo.SalesVO;

@Service
public class DeleteMemberServiceImpl implements DeleteMemberService {
	@Autowired
	private MemberDAO memberDAO;
	@Autowired
	private SalesDAO salesDAO;

	@Override
	@Transactional
	public void deleteMember(MemberVO vo) {
		if (vo.getTicketId() != 0) {
			SalesVO sales = new SalesVO();
			sales.setEmail(vo.getEmail());
			sales.setSalesStatus("success");
			SalesVO result = salesDAO.getSales(sales);
			if (result == null) {
				sales.setSalesStatus("inactive");
				result = salesDAO.getSales(sales);
			}
			result.setSalesStatus("expired");
			salesDAO.updateSales(result);
		}
		memberDAO.deleteMember(vo);
	}

}

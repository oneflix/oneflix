package com.main.oneflix.member.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.oneflix.member.dao.MemberDAO;
import com.main.oneflix.member.service.GetCountMemberService;
import com.main.oneflix.member.vo.MemberVO;

@Service
public class GetCountMemberServiceImpl implements GetCountMemberService {

	@Autowired
	private MemberDAO memberDAO;
	
	@Override
	public int getCountMember(MemberVO vo) {
		return memberDAO.getCountMember(vo);
	}

}

package com.main.oneflix.member.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.oneflix.member.dao.MemberDAO;
import com.main.oneflix.member.service.UpdateMemberService;
import com.main.oneflix.member.vo.MemberVO;

@Service
public class UpdateMemberServiceImpl implements UpdateMemberService {
	@Autowired
	private MemberDAO memberDAO;

	@Override
	public void updateMember(MemberVO vo) {
		memberDAO.updateMember(vo);
	}

}

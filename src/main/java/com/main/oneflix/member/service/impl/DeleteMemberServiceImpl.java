package com.main.oneflix.member.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.oneflix.member.dao.MemberDAO;
import com.main.oneflix.member.service.DeleteMemberService;
import com.main.oneflix.member.vo.MemberVO;

@Service
public class DeleteMemberServiceImpl implements DeleteMemberService {
	@Autowired
	private MemberDAO memberDAO;

	@Override
	public void deleteMember(MemberVO vo) {
		memberDAO.deleteMember(vo);
	}

}

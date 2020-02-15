package com.main.oneflix.member.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.oneflix.member.dao.MemberDAO;
import com.main.oneflix.member.service.InsertMemberService;
import com.main.oneflix.member.vo.MemberVO;

@Service
public class InsertMemberServiceImpl implements InsertMemberService {
	@Autowired
	private MemberDAO memberDAO;
	@Override
	public void insertMemberService(MemberVO vo) {
		memberDAO.insertMember(vo);

	}

}

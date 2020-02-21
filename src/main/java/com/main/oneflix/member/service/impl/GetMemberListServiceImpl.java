package com.main.oneflix.member.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.oneflix.member.dao.MemberDAO;
import com.main.oneflix.member.service.GetMemberListService;
import com.main.oneflix.member.vo.MemberVO;

@Service
public class GetMemberListServiceImpl implements GetMemberListService {

	@Autowired
	private MemberDAO memberDAO;
	
	@Override
	public List<MemberVO> getMemberList(MemberVO vo) {
		return memberDAO.getMemberList(vo);
	}

}

package com.main.oneflix.member.service;

import java.util.List;

import com.main.oneflix.member.vo.MemberVO;

public interface GetMemberListService {
	
	List<MemberVO> getMemberList(MemberVO vo);

}

package com.main.oneflix.member.dao;


import java.util.List;

import com.main.oneflix.member.vo.MemberVO;

public interface MemberDAO {
	
	void insertMember(MemberVO vo);
	MemberVO getMember(MemberVO vo);
	MemberVO getMemberAdmin(MemberVO vo);
	List<MemberVO> getMemberList(MemberVO vo);
	void updateMember(MemberVO vo);
	void deleteMember(MemberVO vo);
	int getCountMember(MemberVO vo);
	
	//카카오아이디집어넣기 
	void insertKakao(MemberVO vo);


}

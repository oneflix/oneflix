package com.main.oneflix.member.dao;

import com.main.oneflix.member.vo.MemberVO;

public interface MemberDAO {
	public void insertMember(MemberVO vo);
	public MemberVO getMember(MemberVO vo);
	public void updateMember(MemberVO vo);
	public void deleteMember(MemberVO vo);


}

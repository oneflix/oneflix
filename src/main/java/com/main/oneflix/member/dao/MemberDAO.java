package com.main.oneflix.member.dao;


import java.util.List;

import com.main.oneflix.member.vo.MemberVO;

public interface MemberDAO {
	public void insertMember(MemberVO vo);
	public MemberVO getMember(MemberVO vo);
	public MemberVO getMemberAdmin(MemberVO vo);
	public List<MemberVO> getMemberList(MemberVO vo);
	public void updateMember(MemberVO vo);
	public void deleteMember(MemberVO vo);


}

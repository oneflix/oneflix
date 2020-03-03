package com.main.oneflix.member.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.main.oneflix.member.dao.MemberDAO;
import com.main.oneflix.member.vo.MemberVO;

@Repository
public class OracleMemberDAO implements MemberDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public void insertMember(MemberVO vo) {
		sqlSessionTemplate.insert("MemberDAO.insertMember", vo);
	}

	@Override
	public MemberVO getMember(MemberVO vo) {
		return sqlSessionTemplate.selectOne("MemberDAO.getMember", vo);
	}

	@Override
	public List<MemberVO> getMemberList(MemberVO vo) {
		return sqlSessionTemplate.selectList("MemberDAO.getMemberList", vo);
	}

	@Override
	public void updateMember(MemberVO vo) {
		sqlSessionTemplate.update("MemberDAO.updateMember", vo);

	}

	@Override
	public void deleteMember(MemberVO vo) {
		sqlSessionTemplate.delete("MemberDAO.deleteMember", vo);

	}

	@Override
	public MemberVO getMemberAdmin(MemberVO vo) {
		return sqlSessionTemplate.selectOne("MemberDAO.getMemberAdmin", vo);
	}

	@Override
	   public void insertKakao(MemberVO vo) {
	      //kakao email name insert
	      sqlSessionTemplate.insert("MemberDAO.insertKakao", vo);
	   }

	@Override
	public int getCountMember(MemberVO vo) {
		return sqlSessionTemplate.selectOne("MemberDAO.getCountMember", vo);
	}

}

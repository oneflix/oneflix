package com.main.oneflix.sales.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.oneflix.member.dao.MemberDAO;
import com.main.oneflix.member.vo.MemberVO;
import com.main.oneflix.movie.vo.MovieVO;
import com.main.oneflix.sales.service.ExpiryCheckService;

@Service
public class ExpiryCheckServiceImpl implements ExpiryCheckService {

	@Autowired
	private MemberDAO memberDAO;
		
	@Override
	public void expiryCheck() {
		MovieVO movie = new MovieVO();
		movie.setMovieType("sales");
		
		MemberVO member = new MemberVO();
		member.setSearchBan("N");
		List<MemberVO> memberList = memberDAO.getMemberList(member);
		List<String> emailList = new ArrayList<>();
		for(int i = 0; i < memberList.size();i++) {
			emailList.add(memberList.get(i).getEmail());
		}
		Map<String,List<String>> map = new HashMap<>();
		map.put("emailList", emailList);
		
		

	}

}

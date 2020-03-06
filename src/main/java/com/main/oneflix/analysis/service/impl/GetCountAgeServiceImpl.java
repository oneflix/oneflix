package com.main.oneflix.analysis.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.oneflix.analysis.service.GetCountAgeService;
import com.main.oneflix.member.dao.MemberDAO;
import com.main.oneflix.member.vo.MemberVO;

@Service
public class GetCountAgeServiceImpl implements GetCountAgeService{
	
	@Autowired
	private MemberDAO memberDAO;

	@Override
	public Map<String, Integer> getCountAge(MemberVO vo) {
		List<MemberVO> memberList = memberDAO.getMemberList(vo);
		
		int teen = 0;
		int twenty = 0;
		int thirty = 0;
		int fourty = 0;
		int fifty = 0;
		int sixty = 0;
		
		for(MemberVO member : memberList) {
			String age = Integer.toString(member.getMemberAge());
			age.substring(0, 1);
			
			switch (age) {
			case "1": teen ++; break;
			case "2": twenty ++; break;
			case "3": thirty ++; break;
			case "4": fourty ++; break;
			case "5": fifty ++; break;
			case "6": 
			default : sixty ++; break;
			}
		}
		
		Map<String, Integer> ageMap = new HashMap<String, Integer>();
		ageMap.put("teen", teen);
		ageMap.put("twenty", twenty);
		ageMap.put("thirty", thirty);
		ageMap.put("fourty", fourty);
		ageMap.put("fifty", fifty);
		ageMap.put("sixty", sixty);
		
		return ageMap;
	}

}

package com.main.oneflix.analysis.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.oneflix.analysis.service.AnalysisAgeService;
import com.main.oneflix.member.dao.MemberDAO;
import com.main.oneflix.member.vo.MemberVO;

@Service
public class AnalysisAgeServiceImpl implements AnalysisAgeService{
	
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
		ageMap.put("10대", teen);
		ageMap.put("20대", twenty);
		ageMap.put("30대", thirty);
		ageMap.put("40대", fourty);
		ageMap.put("50대", fifty);
		ageMap.put("60대 이상", sixty);
		
		return ageMap;
	}

}

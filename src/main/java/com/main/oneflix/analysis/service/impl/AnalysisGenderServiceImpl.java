package com.main.oneflix.analysis.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.oneflix.analysis.service.AnalysisGenderService;
import com.main.oneflix.member.dao.MemberDAO;
import com.main.oneflix.member.vo.MemberVO;

@Service
public class AnalysisGenderServiceImpl implements AnalysisGenderService {
	
	@Autowired
	private MemberDAO memberDAO;

	@Override
	public Map<String, Integer> getCountGender(MemberVO vo) {
		List<MemberVO> memberList = memberDAO.getMemberList(vo);
		
		int female = 0;
		int male = 0;
		
		for(MemberVO member : memberList) {
			if(member.getGender().equals("F")){
				female++;
			}else {
				male++;
			}
		}
		
		Map<String, Integer> genderMap = new HashMap<String, Integer>();
		genderMap.put("F", female);
		genderMap.put("M", male);
		
		
		return genderMap;
	}

}

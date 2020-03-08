package com.main.oneflix.analysis.service;

import java.util.Map;

import com.main.oneflix.member.vo.MemberVO;

public interface AnalysisGenderService {

	Map<String, Integer> getCountGender(MemberVO vo);
}

package com.main.oneflix.alarm.service;

import java.util.Map;

import com.main.oneflix.member.vo.MemberVO;

public interface GetTotalAlarmCountService {

	Map<String, Integer> getTotalAlarmCount(MemberVO vo);
}

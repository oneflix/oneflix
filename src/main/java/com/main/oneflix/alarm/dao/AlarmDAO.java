package com.main.oneflix.alarm.dao;


import java.util.List;
import java.util.Map;

import com.main.oneflix.alarm.vo.AlarmVO;
import com.main.oneflix.member.vo.MemberVO;

public interface AlarmDAO {
	void insertMovieAlarm(Map<String, List<AlarmVO>> map);
	List<Map<String, Object>> getTotalAlarmCount(MemberVO vo);
	void updateAlarm(AlarmVO vo);
	void deleteAlarm(AlarmVO vo);
	
}
package com.main.oneflix.alarm.dao;


import java.util.List;
import java.util.Map;

import com.main.oneflix.alarm.vo.AlarmVO;

public interface AlarmDAO {
	void insertMovieAlarm(Map<String, List<AlarmVO>> map);
	void insertReplyAlarm(String email);
	List<Map<String, Object>> getTotalAlarmCount(String email);
	void deleteAlarm(AlarmVO vo);
}
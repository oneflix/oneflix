package com.main.oneflix.alarm.service;

import java.util.List;

import com.main.oneflix.alarm.vo.AlarmVO;

public interface GetAlarmListService {
	
	
	public List<AlarmVO> getAlarmList(AlarmVO vo);
	

}
package com.main.oneflix.alarm.service;

import javax.servlet.http.HttpServletResponse;

import com.main.oneflix.alarm.vo.AlarmVO;

public interface InsertAlarmService {
	public void selectAlarmList(HttpServletResponse response) throws Exception;
	public void insertAlarm(AlarmVO vo);
}

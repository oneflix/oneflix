package com.main.oneflix.alarm.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.oneflix.alarm.dao.AlarmDAO;
import com.main.oneflix.alarm.service.InsertAlarmService;
import com.main.oneflix.alarm.vo.AlarmVO;
@Service("insertAlarmService")
public class InsertAlarmServiceImpl implements InsertAlarmService {

	@Autowired
	private AlarmDAO alarmDAO;

	@Override
	public void insertAlarm(AlarmVO vo) {
		alarmDAO.insertAlarm(vo);
	}


}

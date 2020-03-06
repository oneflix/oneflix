package com.main.oneflix.alarm.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.oneflix.alarm.dao.AlarmDAO;
import com.main.oneflix.alarm.service.DeleteAlarmService;
import com.main.oneflix.alarm.vo.AlarmVO;
@Service
public class DeleteAlarmServiceImpl implements DeleteAlarmService{

	@Autowired
	private AlarmDAO alarmDAO;
	
	@Override
	public void deleteAlarm(AlarmVO vo) {
		alarmDAO.deleteAlarm(vo);
		
	}

}
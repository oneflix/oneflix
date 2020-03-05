package com.main.oneflix.alarm.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.oneflix.alarm.dao.AlarmDAO;
import com.main.oneflix.alarm.service.UpdateAlarmService;
import com.main.oneflix.alarm.vo.AlarmVO;

@Service
public class UpdateAlarmServiceImpl implements UpdateAlarmService {

	@Autowired
	private AlarmDAO alarmDAO;
	
	@Override
	public void updateAlarm(AlarmVO vo) {
		alarmDAO.updateAlarm(vo);
	}

}

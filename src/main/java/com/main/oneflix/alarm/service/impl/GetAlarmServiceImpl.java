package com.main.oneflix.alarm.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.oneflix.alarm.dao.AlarmDAO;
import com.main.oneflix.alarm.service.GetAlarmService;
import com.main.oneflix.alarm.vo.AlarmVO;
@Service
public class GetAlarmServiceImpl implements GetAlarmService {

	@Autowired
	private AlarmDAO alarmDAO;
	@Override
	public AlarmVO getAlarm(AlarmVO vo) {
		return alarmDAO.getAlarm(vo);
	}

}
package com.main.oneflix.alarm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.oneflix.alarm.dao.AlarmDAO;
import com.main.oneflix.alarm.service.GetAlarmListService;
import com.main.oneflix.alarm.vo.AlarmVO;

@Service
public class GetAlarmListServiceImpl implements GetAlarmListService{

	@Autowired
	private AlarmDAO alarmDAO;
	
	@Override
	public List<AlarmVO> getAlarmList(AlarmVO vo) {
		return alarmDAO.getAlarmList(vo);
	}
	
}
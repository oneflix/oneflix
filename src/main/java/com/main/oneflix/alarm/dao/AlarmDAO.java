package com.main.oneflix.alarm.dao;


import java.util.List;

import com.main.oneflix.alarm.vo.AlarmVO;

public interface AlarmDAO {
	public void insertAlarm(AlarmVO vo);
	public AlarmVO getAlarm(AlarmVO vo);
	public List<AlarmVO> getAlarmList(AlarmVO vo);
	public void updateAlarm(AlarmVO vo);
	public void deleteAlarm(AlarmVO vo);
	

}

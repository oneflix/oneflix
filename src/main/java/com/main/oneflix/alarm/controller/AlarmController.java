package com.main.oneflix.alarm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.main.oneflix.alarm.service.DeleteAlarmService;
import com.main.oneflix.alarm.vo.AlarmVO;

@Controller	
public class AlarmController {

	@Autowired
	private DeleteAlarmService deleteAlarmService;
	
	@RequestMapping("/deleteAlarmProcAjax.do")
	@ResponseBody
	public void deleteAlarmProcAjax(AlarmVO vo) {
		deleteAlarmService.deleteAlarm(vo);
	}

}
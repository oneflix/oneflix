package com.main.oneflix.alarm.admin.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import com.main.oneflix.alarm.service.InsertAlarmService;
@Controller	
public class AlarmController {

	@Resource(name = "alarmService")
	private InsertAlarmService insertAlarmService;

	
	
	
	
	

}
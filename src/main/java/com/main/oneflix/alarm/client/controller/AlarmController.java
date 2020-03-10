package com.main.oneflix.alarm.client.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.main.oneflix.alarm.service.DeleteAlarmService;
import com.main.oneflix.alarm.service.GetTotalAlarmCountService;
import com.main.oneflix.alarm.vo.AlarmVO;

@Controller	
public class AlarmController {

	@Autowired
	private DeleteAlarmService deleteAlarmService;
	@Autowired
	private GetTotalAlarmCountService getTotalAlarmCountService;
	
	@RequestMapping("/deleteAlarmProcAjax.do")
	@ResponseBody
	public void deleteAlarmProcAjax(AlarmVO vo, HttpSession session) {
		deleteAlarmService.deleteAlarm(vo);
		Map<String, Integer> totalAlarmCount = getTotalAlarmCountService.getTotalAlarmCount(vo.getEmail());
		if (vo.getAlarmType().equals("movie")) {
			session.setAttribute("movieAlarmCount", totalAlarmCount.get("movie"));
		} else {
			session.setAttribute("replyAlarmCount", totalAlarmCount.get("reply"));
		}
	}

}
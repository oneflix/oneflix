package com.main.oneflix.alarm.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.oneflix.alarm.dao.AlarmDAO;
import com.main.oneflix.alarm.service.GetTotalAlarmCountService;
import com.main.oneflix.member.vo.MemberVO;

@Service
public class GetTotalAlarmCountServiceImpl implements GetTotalAlarmCountService {

	@Autowired
	private AlarmDAO alarmDAO;
	
	@Override
	public Map<String, Integer> getTotalAlarmCount(MemberVO vo) {
		List<Map<String, Object>> totalAlarmCountList = alarmDAO.getTotalAlarmCount(vo);
		Map<String, Integer> totalAlarmCount = new HashMap<>();
		System.out.println(totalAlarmCountList);
		for (Map<String, Object> alarm : totalAlarmCountList) {
			totalAlarmCount.put((String)alarm.get("alarmType"), (int)alarm.get("alarmCount"));
		}
		if (totalAlarmCount.get("movie") == null) {
			totalAlarmCount.put("movie", 0);
		}
		if (totalAlarmCount.get("reply") == null) {
			totalAlarmCount.put("reply", 0);
		}
		System.out.println(totalAlarmCount);
		return totalAlarmCount;
	}

}

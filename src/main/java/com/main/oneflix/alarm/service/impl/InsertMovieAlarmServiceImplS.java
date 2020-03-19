package com.main.oneflix.alarm.service.impl;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.oneflix.alarm.dao.AlarmDAO;
import com.main.oneflix.alarm.service.InsertMovieAlarmService;
import com.main.oneflix.alarm.vo.AlarmVO;
import com.main.oneflix.member.dao.MemberDAO;
import com.main.oneflix.member.vo.MemberVO;
import com.main.oneflix.movie.dao.MovieDAO;
import com.main.oneflix.movie.vo.MovieVO;

@Service
public class InsertMovieAlarmServiceImplS implements InsertMovieAlarmService {
	
	@Autowired
	private MovieDAO movieDAO;
	@Autowired
	private MemberDAO memberDAO;
	@Autowired
	private AlarmDAO alarmDAO;

	@Override
	public void insertMovieAlarm() {
		MovieVO movie = new MovieVO();
		movie.setMovieType("alarm");
		int totalCountMovie = movieDAO.getCountMovie(movie);
		
		if (totalCountMovie != 0) {
			
			MemberVO member = new MemberVO();
			member.setSearchBan("N");
			List<MemberVO> memberList = memberDAO.getMemberList(member);
			List<AlarmVO> alarmList = new ArrayList<>();
			
			for (int i = 0; i < memberList.size(); i++) {
				AlarmVO alarm = new AlarmVO();
				alarm.setEmail(memberList.get(i).getEmail());
				alarm.setAlarmCount(totalCountMovie);
				alarmList.add(alarm);
			}
			Map<String, List<AlarmVO>> map = new HashMap<>();
			map.put("newAlarmList", alarmList);
			
			alarmDAO.insertMovieAlarm(map);
		}
	}

}
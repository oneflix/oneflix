package com.main.oneflix.alarm.service.impl;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.oneflix.alarm.service.InsertAlarmService;
import com.main.oneflix.member.dao.MemberDAO;
import com.main.oneflix.member.vo.MemberVO;
import com.main.oneflix.movie.dao.MovieDAO;
import com.main.oneflix.movie.vo.MovieVO;
@Service("alarmService")
public class InsertAlarmServiceImpl implements InsertAlarmService {
	@Autowired
	private MovieDAO movieDAO;
	@Autowired
	private MemberDAO memberDAO;

	@Override
	public void insertAlarm() {
		MovieVO movie = new MovieVO();
		movie.setMovieType("alarm");
		int totalCountMovie = movieDAO.getCountMovie(movie);
		
		MemberVO member = new MemberVO();
		member.setSearchBan("N");
		List<MemberVO> memberList = memberDAO.getMemberList(member);
		List<String> emailList = new ArrayList<>();
		for (int i = 0; i < memberList.size(); i++) {
			emailList.add(memberList.get(i).getEmail());
		}
		Map<String, List<String>> map = new HashMap<>();
		map.put("emailList", emailList);
		

		
	}

}
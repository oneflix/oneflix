package com.main.oneflix.alarm.service.impl;


import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.oneflix.alarm.service.InsertAlarmService;
import com.main.oneflix.movie.dao.MovieDAO;
import com.main.oneflix.movie.vo.MovieVO;
@Service("alarmService")
public class InsertAlarmServiceImpl implements InsertAlarmService {
	@Autowired
	private MovieDAO movieDAO;
	Date date = new Date();

	@Override
	public void insertAlarm() {
		MovieVO movie = new MovieVO();
		movie.setMovieType("alarm");
		List<MovieVO> movieList = movieDAO.getMovieList(movie);
		System.out.println(movieList);
		for (int i = 0; i < movieList.size(); i++) {
			System.out.println(movieList.get(i).getMovieTitle());
		}
		
	}


}
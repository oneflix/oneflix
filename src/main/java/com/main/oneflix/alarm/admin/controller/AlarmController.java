package com.main.oneflix.alarm.admin.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.main.oneflix.alarm.service.DeleteAlarmService;
import com.main.oneflix.alarm.service.GetAlarmListService;
import com.main.oneflix.alarm.service.GetAlarmService;
import com.main.oneflix.alarm.service.InsertAlarmService;
import com.main.oneflix.alarm.service.UpdateAlarmService;
import com.main.oneflix.movie.service.GetMovieListService;
import com.main.oneflix.movie.vo.MovieVO;

public class AlarmController {
	@Resource(name = "insertAlarmService")
	private InsertAlarmService insertAlarmService;
	
	@Resource(name = "updateAlarmService")
	private UpdateAlarmService updateAlarmService;
	
	@Resource(name = "deleteAlarmService")
	private DeleteAlarmService deleteAlarmService;
	
	@Resource(name = "getAlarmListService")
	private GetAlarmListService getAlarmListService;
	
	@Resource(name = "getAlarmService")
	private GetAlarmService getAlarmService;
	
	@Autowired
	private GetMovieListService getMovieListService;
	
	
	@RequestMapping("/insertAlarm.do")
	public ModelAndView insertAlarm(MovieVO vo,ModelAndView mav) {
		mav.setViewName("insertAlarm");
		List<MovieVO> movieList = getMovieListService.getMovieList(new MovieVO());
		mav.addObject("movieList",vo);
		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date());
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		System.out.println("현재 날짜 : " + df.format(cal.getTime()));
		cal.add(Calendar.DATE, +1);
		System.out.println("전 날짜 : " + df.format(cal.getTime()));
		return mav;
	}
	
	

}

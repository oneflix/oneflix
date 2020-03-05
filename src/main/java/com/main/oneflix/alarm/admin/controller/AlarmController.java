package com.main.oneflix.alarm.admin.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.main.oneflix.alarm.service.DeleteAlarmService;
import com.main.oneflix.alarm.service.GetAlarmListService;
import com.main.oneflix.alarm.service.GetAlarmService;
import com.main.oneflix.alarm.service.InsertAlarmService;
import com.main.oneflix.alarm.service.UpdateAlarmService;
import com.main.oneflix.movie.service.GetMovieListService;
import com.main.oneflix.movie.vo.MovieVO;
@Controller	
public class AlarmController {
	@Autowired
	@Resource(name = "insertAlarmService")
	private InsertAlarmService insertAlarmService;
	@Autowired
	@Resource(name = "updateAlarmService")
	private UpdateAlarmService updateAlarmService;
	@Autowired
	@Resource(name = "deleteAlarmService")
	private DeleteAlarmService deleteAlarmService;
	@Autowired
	@Resource(name = "getAlarmListService")
	private GetAlarmListService getAlarmListService;
	@Autowired
	@Resource(name = "getAlarmService")
	private GetAlarmService getAlarmService;
	
	@Autowired
	private GetMovieListService getMovieListService;
	
	
	@RequestMapping("/insertAlarm.do")
	public ModelAndView insertAlarm(MovieVO vo,ModelAndView mav) {
		vo.setMovieType("alarm");
		List<MovieVO> movieList = getMovieListService.getMovieList(vo);
		mav.addObject("movieList", movieList);
		mav.setViewName("insertAlarm");
		return mav;
	}
	
	

}

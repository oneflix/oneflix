package com.main.oneflix.watch.client.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.main.oneflix.watch.service.InsertWatchService;
import com.main.oneflix.watch.vo.WatchVO;

@Controller
public class WatchController {
	
	@Autowired
	private InsertWatchService insertWatchService;

	@RequestMapping("/moviePlay.do")
	public ModelAndView moviePlay(ModelAndView mav) {
		mav.setViewName("moviePlay");
		return mav;
	}
	
	@RequestMapping("/insertWatch.do")
	public ModelAndView insertWatch(ModelAndView mav, WatchVO vo) {
		vo.setWatchType("watching");
		insertWatchService.insertWatch(vo);
		return mav;
	}
}

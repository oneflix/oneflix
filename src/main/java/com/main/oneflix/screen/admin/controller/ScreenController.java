package com.main.oneflix.screen.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.main.oneflix.screen.service.DeleteScreenService;
import com.main.oneflix.screen.service.GetScreenListService;
import com.main.oneflix.screen.service.InsertScreenService;
import com.main.oneflix.screen.service.UpdateScreenService;
import com.main.oneflix.screen.vo.ScreenVO;

@Controller
public class ScreenController {
	
	@Autowired
	InsertScreenService insertScreenService;
	@Autowired
	UpdateScreenService updateScreenService;
	@Autowired
	DeleteScreenService deleteScreenService;
	@Autowired
	GetScreenListService getScreenListService;
	
	@RequestMapping("screen.mdo")
	public ModelAndView screen(ScreenVO vo, ModelAndView mav) {
		mav.setViewName("screen");
		return mav;
	}
	
	@RequestMapping("/getScreenListProc.mdo")
	public ModelAndView getScreenListProc(ScreenVO vo, ModelAndView mav) {
		List<ScreenVO> screenList = getScreenListService.getScreenList(vo);
		mav.addObject("screenList", screenList);
		mav.setViewName("screen");
		return mav;
	}
}

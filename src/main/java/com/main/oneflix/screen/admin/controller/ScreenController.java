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
	
	
	@RequestMapping("/insertScreenProc.mdo")
	public ModelAndView insertScreenProc(ScreenVO vo, ModelAndView mav) {
		insertScreenService.insertScreen(vo);
		mav.setViewName("redirect:/getScreenListProc.mdo");
		return mav;
	}
	
	/*
	 * @RequestMapping("/updateScreenProc.mdo") public ModelAndView
	 * updateScreenProc(ScreenVO vo, ModelAndView mav) {
	 * updateScreenService.updateScreen(vo);
	 * mav.setViewName("redirect:/getScreenListProc.mdo"); return mav; }
	 * 
	 * @RequestMapping("/deleteScreenProc.mdo") public ModelAndView
	 * deleteScreenProc(ScreenVO vo, ModelAndView mav) {
	 * deleteScreenService.deleteScreen(vo);
	 * mav.setViewName("redirect:/getScreenListProc.mdo"); return mav; }
	 */
	@RequestMapping("/getScreenListProc.mdo")
	public ModelAndView getScreenListProc(ScreenVO vo, ModelAndView mav) {
		vo.setScreenPageType("o");
		List<ScreenVO> oneflixScreenList = getScreenListService.getScreenList(vo);
		
		vo.setScreenPageType("d");
		List<ScreenVO> deletedefenseScreenList = getScreenListService.getScreenList(vo);
		
		mav.addObject("oneflixScreenList", oneflixScreenList);
		mav.addObject("deletedefenseScreenList", deletedefenseScreenList);
		mav.setViewName("screen");
		return mav;
	}
}

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
	private InsertScreenService insertScreenService;
	@Autowired
	private UpdateScreenService updateScreenService;
	@Autowired
	private DeleteScreenService deleteScreenService;
	@Autowired
	private GetScreenListService getScreenListService;

	
	@RequestMapping("/insertScreenProc.mdo")
	public ModelAndView insertScreenProc(ScreenVO vo, ModelAndView mav) {
		System.out.println(vo.getScreenId());
		System.out.println(vo.getScreenPageType());
		System.out.println(vo.getScreenOrder());
		System.out.println(vo.getScreenImgPath());
		System.out.println(vo.getScreenImgFile());
		System.out.println(vo.getScreenTitle());
		System.out.println(vo.getScreenSubtitle());
//		insertScreenService.insertScreen(vo);
		mav.setViewName("redirect:/getScreenListProc.mdo");
		return mav;
	}
	
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

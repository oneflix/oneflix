package com.main.oneflix.help.client.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.main.oneflix.help.service.GetHelpListService;
import com.main.oneflix.help.vo.HelpVO;

@Controller
public class NoticeController {
	
	@Autowired
	private GetHelpListService getHelpListService;
	
	
	@RequestMapping("/help.do")
	public ModelAndView help(ModelAndView mav) {
		mav.setViewName("help");
		return mav;
	}
	
	@RequestMapping("/getHelpListProc.do")
	public ModelAndView getHelpListProc(ModelAndView mav, HelpVO vo) {
		vo.setHelpType("all");
		List<HelpVO> helpList = getHelpListService.getHelpList(vo);
		mav.addObject("helpList", helpList);
		mav.setViewName("help");
		return mav;
	}
}

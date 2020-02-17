package com.main.oneflix.help.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.main.oneflix.help.service.DeleteHelpService;
import com.main.oneflix.help.service.GetHelpListService;
import com.main.oneflix.help.service.GetHelpService;
import com.main.oneflix.help.service.InsertHelpService;
import com.main.oneflix.help.service.UpdateHelpService;
import com.main.oneflix.help.vo.HelpVO;
@Controller
public class HelpController {
	@Autowired
	private InsertHelpService insertHelpService;
	
	@Autowired
	private UpdateHelpService updateHelpService;
	
	@Autowired
	private DeleteHelpService deleteHelpService;
	
	@Autowired
	private GetHelpService getHelpService;
	
	@Autowired
	private GetHelpListService getHelpListService;
	
	@RequestMapping("/helpListProc.mdo")
	public ModelAndView getHelpList(HelpVO vo,ModelAndView mav) {
		List<HelpVO> helpList = getHelpListService.getHelpListService(vo);
		mav.addObject("helpList",helpList);
		mav.setViewName("helpList");
		return mav;
	}
	
	@RequestMapping("/insertHelp.mdo")
	public ModelAndView insertHelp(ModelAndView mav) {
		mav.setViewName("insertHelp");
		return mav;
	}
	
	@RequestMapping("/insertHelpProc.mdo")
	public ModelAndView insertHelpProc(HelpVO vo,ModelAndView mav) {
		insertHelpService.insertHelpService(vo);
		mav.setViewName("redirect:/helpListProc.mdo");
		return mav;
	}
	
	@RequestMapping("/getHelpProc.mdo")
	public ModelAndView updateHelp(HelpVO vo,ModelAndView mav) {
		vo = getHelpService.getHelpService(vo);
		mav.addObject("help",vo);
		mav.setViewName("updateHelp");
		return mav;
	}
	
	@RequestMapping("/updateHelpProc.mdo")
	public ModelAndView updateHelpProc(HelpVO vo,ModelAndView mav) {
		updateHelpService.updateHelpService(vo);
		mav.setViewName("redirect:/helpListProc.mdo");
		return mav;
	}
	
	@RequestMapping("/deleteHelpProc.mdo")
	public ModelAndView deleteHelpProc(HelpVO vo,ModelAndView mav) {
		deleteHelpService.deleteHelpService(vo);
		mav.setViewName("redirect:/helpListProc.mdo");
		return mav;
	}
	

}

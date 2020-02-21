package com.main.oneflix.help.faq.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.main.oneflix.help.service.DeleteHelpService;
import com.main.oneflix.help.service.GetHelpListService;
import com.main.oneflix.help.service.GetHelpService;
import com.main.oneflix.help.service.InsertHelpService;
import com.main.oneflix.help.service.UpdateHelpService;
import com.main.oneflix.help.vo.HelpVO;

@Controller
public class FAQController {

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

	@RequestMapping("/getFAQListProc.mdo")
	public ModelAndView getFAQListProc(HelpVO vo, ModelAndView mav) {
		if (vo.getHelpType() == null) {
			vo.setHelpType("faq");
		};
		List<HelpVO> FAQList = getHelpListService.getHelpList(vo);
		mav.addObject("FAQ", vo);
		mav.addObject("FAQList", FAQList);
		mav.setViewName("FAQList");
		return mav;
	}
	
	@RequestMapping(value = "/getFAQListProcAjax.mdo", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public List<HelpVO> getFAQListProcAjax(HelpVO vo) {
		List<HelpVO> helpList = getHelpListService.getHelpList(vo);
		return helpList;
	}

	@RequestMapping("/insertFAQ.mdo")
	public ModelAndView insertFAQ(ModelAndView mav) {
		mav.setViewName("insertFAQ");
		return mav;
	}

	@RequestMapping("/insertFAQProc.mdo")
	public ModelAndView insertFAQProc(HelpVO vo, ModelAndView mav) {
		insertHelpService.insertHelp(vo);
		mav.setViewName("redirect:/getFAQListProc.mdo");
		return mav;
	}

	@RequestMapping("/getFAQProc.mdo")
	public ModelAndView getFAQProc(HelpVO vo, ModelAndView mav) {
		vo = getHelpService.getHelp(vo);
		mav.addObject("help", vo);
		mav.setViewName("updateFAQ");
		return mav;
	}

	@RequestMapping("/updateFAQProc.mdo")
	public ModelAndView updateFAQProc(HelpVO vo, ModelAndView mav) {
		updateHelpService.updateHelp(vo);
		mav.setViewName("redirect:/getFAQListProc.mdo");
		return mav;
	}

	@RequestMapping("/deleteFAQProc.mdo")
	public ModelAndView deleteFAQProc(HelpVO vo, ModelAndView mav) {
		deleteHelpService.deleteHelp(vo);
		mav.setViewName("redirect:/getFAQListProc.mdo");
		return mav;
	}

}

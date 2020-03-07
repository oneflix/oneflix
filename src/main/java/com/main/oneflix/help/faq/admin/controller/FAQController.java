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
import com.main.oneflix.util.datatable.vo.WrapperVO;

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

	@RequestMapping("/FAQList.mdo")
	public ModelAndView FAQList(ModelAndView mav) {
		mav.setViewName("FAQList");
		return mav;
	}
	
	@RequestMapping("/getFAQListProcAjax.mdo")
	@ResponseBody
	public WrapperVO getFAQListProcAjax(HelpVO vo, ModelAndView mav) {
		WrapperVO wrap = new WrapperVO();
		List<HelpVO> FAQList = getHelpListService.getHelpList(vo);
		wrap.setData(FAQList);
		wrap.setRecordsTotal(FAQList.size());
		wrap.setRecordsFiltered(FAQList.size());
		return wrap;
	}

	@RequestMapping("/insertFAQ.mdo")
	public ModelAndView insertFAQ(ModelAndView mav) {
		mav.setViewName("insertFAQ");
		return mav;
	}

	@RequestMapping("/insertFAQProc.mdo")
	public ModelAndView insertFAQProc(HelpVO vo, ModelAndView mav) {
		insertHelpService.insertHelp(vo);
		mav.setViewName("redirect:/FAQList.mdo");
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
		mav.setViewName("redirect:/FAQList.mdo");
		return mav;
	}

	@RequestMapping("/deleteFAQProc.mdo")
	public ModelAndView deleteFAQProc(HelpVO vo, ModelAndView mav) {
		deleteHelpService.deleteHelp(vo);
		mav.setViewName("redirect:/FAQList.mdo");
		return mav;
	}

}

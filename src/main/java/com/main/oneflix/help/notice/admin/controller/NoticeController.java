package com.main.oneflix.help.notice.admin.controller;

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
public class NoticeController {
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
	
	@RequestMapping("/noticeList.mdo")
	public ModelAndView noticeList(ModelAndView mav) {
		mav.setViewName("noticeList");
		return mav;
	}
	
	@RequestMapping("/getNoticeListProcAjax.mdo")
	@ResponseBody
	public WrapperVO getNoticeListProcAjax(HelpVO vo, ModelAndView mav) {
		WrapperVO wrap = new WrapperVO();
		List<HelpVO> noticeList = getHelpListService.getHelpList(vo);
		wrap.setData(noticeList);
		wrap.setRecordsTotal(noticeList.size());
		wrap.setRecordsFiltered(noticeList.size());
		return wrap;
	}
	
	@RequestMapping("/insertNotice.mdo")
	public ModelAndView insertNotice(ModelAndView mav) {
		mav.setViewName("insertNotice");
		return mav;
	}
	
	@RequestMapping("/insertNoticeProc.mdo")
	public ModelAndView insertNoticeProc(HelpVO vo, ModelAndView mav) {
		insertHelpService.insertHelp(vo);
		mav.setViewName("redirect:/noticeList.mdo");
		return mav;
	}
	
	@RequestMapping("/getNoticeProc.mdo")
	public ModelAndView getNoticeProc(HelpVO vo, ModelAndView mav) {
		vo = getHelpService.getHelp(vo);
		mav.addObject("notice", vo);
		mav.setViewName("updateNotice");
		return mav;
	}
	
	@RequestMapping("/updateNoticeProc.mdo")
	public ModelAndView updateNoticeProc(HelpVO vo, ModelAndView mav) {
		updateHelpService.updateHelp(vo);
		mav.setViewName("redirect:/noticeList.mdo");
		return mav;
	}
	
	@RequestMapping("/deleteNoticeProc.mdo")
	public ModelAndView deleteNoticeProc(HelpVO vo, ModelAndView mav) {
		deleteHelpService.deleteHelp(vo);
		mav.setViewName("redirect:/noticeList.mdo");
		return mav;
	}
	

}

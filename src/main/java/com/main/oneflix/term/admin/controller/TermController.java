package com.main.oneflix.term.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.main.oneflix.term.service.DeleteTermService;
import com.main.oneflix.term.service.GetTermListService;
import com.main.oneflix.term.service.GetTermService;
import com.main.oneflix.term.service.InsertTermService;
import com.main.oneflix.term.service.UpdateTermService;
import com.main.oneflix.term.vo.TermVO;
import com.main.oneflix.util.datatable.vo.WrapperVO;

@Controller
public class TermController {
	@Autowired
	private InsertTermService insertTermService;
	@Autowired
	private UpdateTermService updateTermService;
	@Autowired
	private DeleteTermService deleteTermService;
	@Autowired
	private GetTermService getTermService;
	@Autowired
	private GetTermListService getTermListService;
	
	@RequestMapping("/termList.mdo")
	public ModelAndView termList(ModelAndView mav) {
		mav.setViewName("termList");
		return mav;
	}

	@RequestMapping("/getTermListProcAjax.mdo")
	@ResponseBody
	public WrapperVO getTermListProcAjax(TermVO vo) {
		WrapperVO wrap = new WrapperVO();
		List<TermVO> termList = getTermListService.getTermList(vo);
		wrap.setData(termList);
		wrap.setRecordsTotal(termList.size());
		wrap.setRecordsFiltered(termList.size());
		return wrap;
	}

	@RequestMapping("/insertTerm.mdo")
	public ModelAndView insertTerm(ModelAndView mav) {
		mav.setViewName("insertTerm");
		return mav;
	}

	@RequestMapping("/insertTermProc.mdo")
	public ModelAndView insertTermProc(TermVO vo, ModelAndView mav) {
		insertTermService.insertTerm(vo);
		mav.setViewName("redirect:/termList.mdo");
		return mav;
	}

	@RequestMapping("/getTermProc.mdo")
	public ModelAndView getTermProc(TermVO vo, ModelAndView mav) {
		vo = getTermService.getTerm(vo);
		mav.addObject("term", vo);
		mav.setViewName("updateTerm");
		return mav;
	}

	@RequestMapping("/updateTermProc.mdo")
	public ModelAndView updateTermProc(TermVO vo, ModelAndView mav) {
		updateTermService.updateTerm(vo);
		mav.setViewName("redirect:/termList.mdo");
		return mav;
	}

	@RequestMapping("/deleteTermProc.mdo")
	public ModelAndView deleteTermProc(TermVO vo, ModelAndView mav) {
		deleteTermService.deleteTerm(vo);
		mav.setViewName("redirect:/termList.mdo");
		return mav;
	}
	
}

package com.main.oneflix.watch.client.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.main.oneflix.member.vo.MemberVO;
import com.main.oneflix.watch.service.GetWatchViewPointService;
import com.main.oneflix.watch.service.InsertWatchService;
import com.main.oneflix.watch.service.UpdateWatchService;
import com.main.oneflix.watch.vo.WatchVO;

@Controller
public class WatchController {
	
	@Autowired
	private InsertWatchService insertWatchService;
	@Autowired
	private UpdateWatchService updateWatchService;
	@Autowired
	private GetWatchViewPointService getWatchViewPointService;

	@RequestMapping("/moviePlay.do")
	public ModelAndView moviePlay(ModelAndView mav, WatchVO vo, HttpSession session) {
		MemberVO member = (MemberVO) session.getAttribute("member");
		
		vo.setEmail(member.getEmail());
		vo.setMovieId(9);
		Integer viewPoint = getWatchViewPointService.getWatchViewPoint(vo);
		if(viewPoint == null) {
			viewPoint = 0;
		}
		vo.setViewPoint(viewPoint);
		
		mav.addObject("watch", vo);
		mav.setViewName("moviePlay");
		return mav;
	}
	
	@RequestMapping("/insertWatchAjax.do")
	@ResponseBody
	public void insertWatch(WatchVO vo) {
		System.out.println("insert 실행");
		insertWatchService.insertWatch(vo);
	}
	
	@RequestMapping("/updateWatchAjax.do")
	@ResponseBody
	public void updateWatch(WatchVO vo) {
		System.out.println("update 실행");
		updateWatchService.updateWatch(vo);
	}
}

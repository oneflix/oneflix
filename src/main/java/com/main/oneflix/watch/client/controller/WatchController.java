package com.main.oneflix.watch.client.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.main.oneflix.member.vo.MemberVO;
import com.main.oneflix.movie.service.IncreaseViewCountService;
import com.main.oneflix.movie.vo.MovieVO;
import com.main.oneflix.watch.service.GetWatchService;
import com.main.oneflix.watch.service.InsertWatchService;
import com.main.oneflix.watch.service.UpdateWatchService;
import com.main.oneflix.watch.vo.WatchVO;

@Controller
public class WatchController {
	@Autowired
	private IncreaseViewCountService increaseViewCountService;
	@Autowired
	private InsertWatchService insertWatchService;
	@Autowired
	private UpdateWatchService updateWatchService;
	@Autowired
	private GetWatchService getWatchService;

	@RequestMapping("/moviePlay.do")

	public ModelAndView moviePlay(WatchVO vo, HttpServletRequest request, ModelAndView mav) {
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO) session.getAttribute("member");
		MovieVO movie = (MovieVO) request.getAttribute("movie");

		vo.setEmail(member.getEmail());
		vo.setMovieId(movie.getMovieId());
		
		vo = getWatchService.getWatch(vo);
		if(vo == null || vo.getWatchType().equals("watched")) {
			if (vo == null) {
				vo = new WatchVO();
			}
			vo.setViewPoint(0);
		}
		
		increaseViewCountService.increaseViewCount(movie);
		mav.addObject("watch", vo);
		mav.addObject("movie", movie);
		mav.setViewName("moviePlay");
		return mav;
	}
	

	@RequestMapping("/insertWatchAjax.do")
	@ResponseBody
	public int insertWatch(WatchVO vo) {
		return insertWatchService.insertWatch(vo);
	}
	
	@RequestMapping("/updateWatchAjax.do")
	@ResponseBody
	public void updateWatch(WatchVO vo) {
		updateWatchService.updateWatch(vo);
	}
}

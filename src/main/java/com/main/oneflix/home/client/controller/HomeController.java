package com.main.oneflix.home.client.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.main.oneflix.alarm.service.GetTotalAlarmCountService;
import com.main.oneflix.genre.service.GetGenreListService;
import com.main.oneflix.genre.vo.GenreVO;
import com.main.oneflix.member.service.GetMemberService;
import com.main.oneflix.member.vo.MemberVO;
import com.main.oneflix.movie.service.GetMovieListService;
import com.main.oneflix.movie.service.GetRecommendMovieListService;
import com.main.oneflix.movie.vo.MovieVO;
import com.main.oneflix.ticket.service.GetTicketListService;
import com.main.oneflix.ticket.vo.TicketVO;

@Controller
public class HomeController {
	
	@Autowired
	private GetMovieListService getMovieListService;
	@Autowired
	private GetRecommendMovieListService getRecommendMovieListService;
	@Autowired
	private GetGenreListService getGenreListService;
	@Autowired
	private GetTicketListService getTicketListService;
	@Autowired
	private GetTotalAlarmCountService getTotalAlarmCountService;
	@Autowired
	private GetMemberService getMemberService;
	
	@RequestMapping("/homeProc.do")
	public ModelAndView homeProc(MovieVO vo, ModelAndView mav, HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberVO member;
		if (request.getParameter("type") != null && request.getParameter("type").equals("re")) {
			member = getMemberService.getMember((MemberVO)session.getAttribute("member"));
			session.setAttribute("member", member);
		} else {
			member = (MemberVO) session.getAttribute("member");
		}
		
		if (session.getAttribute("totalAlarmCount") == null) {
			Map<String, Integer> totalAlarmCount = getTotalAlarmCountService.getTotalAlarmCount(member.getEmail());
			session.setAttribute("movieAlarmCount", totalAlarmCount.get("movie"));
			session.setAttribute("replyAlarmCount", totalAlarmCount.get("reply"));
		}
		vo.setMovieStatus("Y");
		vo.setEmail(member.getEmail());
		// 값 셋팅하기
		vo.setMovieType("main");		
		List<MovieVO> mainMovieList = getMovieListService.getMovieList(vo);
		vo.setMovieType("watching");
		List<MovieVO> watchingMovieList = getMovieListService.getMovieList(vo);
		vo.setMovieType("new");		
		List<MovieVO> newMovieList = getMovieListService.getMovieList(vo);
		vo.setMovieType("popular");
		List<MovieVO> popularMovieList = getMovieListService.getMovieList(vo);
		// 인기가 있으면서 좋아하는 장르도 같이 들어감
		// 따라서 위에 setMovieType 순서 중요
		vo.setSearchOrder("recommend");
		List<GenreVO> genreList = getGenreListService.getGenreList(new GenreVO());
		List<MovieVO> recommendMovieList = getRecommendMovieListService.getRecommendMovieList(vo, genreList);
		
		mav.addObject("mainMovieList", mainMovieList);
		mav.addObject("watchingMovieList", watchingMovieList);
		mav.addObject("newMovieList", newMovieList);
		mav.addObject("popularMovieList", popularMovieList);
		mav.addObject("recommendMovieList", recommendMovieList);
		
		List<TicketVO> ticketList = getTicketListService.getTicketList(new TicketVO());
		mav.addObject("ticketList", ticketList);
		mav.setViewName("home");
		return mav;
	}
}
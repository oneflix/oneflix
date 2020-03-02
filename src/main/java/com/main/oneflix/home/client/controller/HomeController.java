package com.main.oneflix.home.client.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.main.oneflix.genre.service.GetGenreListService;
import com.main.oneflix.genre.vo.GenreVO;
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
	
	@RequestMapping("/homeProc.do")
	public ModelAndView homeProc(MovieVO vo, ModelAndView mav, HttpSession session) {
		MemberVO member = (MemberVO) session.getAttribute("member");
		// 값 셋팅하기
		vo.setMovieType("main");		
		List<MovieVO> mainMovieList = getMovieListService.getMovieList(vo);
		vo.setMovieType("new");		
		List<MovieVO> newMovieList = getMovieListService.getMovieList(vo);
		vo.setMovieType("popular");
		List<MovieVO> popularMovieList = getMovieListService.getMovieList(vo);
		// 인기가 있으면서 좋아하는 장르도 같이 들어감
		// 따라서 위에 setMovieType 순서 중요
		vo.setSearchOrder("recommend");
		List<GenreVO> genreList = getGenreListService.getGenreList(new GenreVO());
		List<MovieVO> recommendMovieList = getRecommendMovieListService.getRecommendMovieList(vo, member.getEmail(), genreList);
		
		mav.addObject("mainMovieList", mainMovieList);
		mav.addObject("newMovieList", newMovieList);
		mav.addObject("popularMovieList", popularMovieList);
		mav.addObject("recommendMovieList", recommendMovieList);
		
		List<TicketVO> ticketList = getTicketListService.getTicketList(new TicketVO());
		mav.addObject("ticketList", ticketList);
		mav.setViewName("home");
		return mav;
	}
}

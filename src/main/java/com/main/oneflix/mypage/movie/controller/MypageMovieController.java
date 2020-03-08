package com.main.oneflix.mypage.movie.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.main.oneflix.member.vo.MemberVO;
import com.main.oneflix.movie.service.GetMovieListService;
import com.main.oneflix.movie.vo.MovieVO;

@Controller
public class MypageMovieController {

	@Autowired
	private GetMovieListService getMovieListService;
	
	@RequestMapping("getMyMovieListProc.do")
	public ModelAndView getMypageMovieProc(MovieVO vo, HttpSession session, ModelAndView mav) {
		MemberVO member = (MemberVO)session.getAttribute("member");
		
		vo.setEmail(member.getEmail());
		vo.setMovieType("watching");
		List<MovieVO> watchingMovieList = getMovieListService.getMovieList(vo);
		
		vo.setMovieType("watched");
		List<MovieVO> watchedMovieList = getMovieListService.getMovieList(vo);
		
		vo.setMovieType("rated");
		List<MovieVO> ratedMovieList = getMovieListService.getMovieList(vo);

		mav.addObject("watchingMovieList", watchingMovieList);
		mav.addObject("watchedMovieList", watchedMovieList);
		mav.addObject("ratedMovieList", ratedMovieList);
		mav.setViewName("mymovieList");
		return mav;
	}
	
}

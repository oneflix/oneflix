package com.main.oneflix.mypage.movie.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.main.oneflix.movie.vo.MovieVO;

@Controller
public class MypageMovieController {

	@RequestMapping("getMyMovieListProc.do")
	public ModelAndView getMypageMovieProc(MovieVO vo, ModelAndView mav) {
		mav.setViewName("mymovieList");
		return mav;
	}
	
}

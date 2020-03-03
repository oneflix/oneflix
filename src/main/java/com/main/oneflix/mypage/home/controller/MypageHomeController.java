package com.main.oneflix.mypage.home.controller;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.main.oneflix.genre.service.GetGenreListService;
import com.main.oneflix.genre.vo.GenreVO;
import com.main.oneflix.member.vo.MemberVO;
import com.main.oneflix.review.service.GetReviewListService;
import com.main.oneflix.watch.service.GetCountWatchGenreService;
import com.main.oneflix.watch.service.GetCountWatchService;
import com.main.oneflix.watch.vo.WatchVO;

@Controller
public class MypageHomeController {
	
		@Autowired
		GetCountWatchGenreService getCountWatchGenreService;
		@Autowired
		GetCountWatchService getCountWatchService;
		@Autowired
		GetReviewListService getReviewListService;
		@Autowired
		GetGenreListService getGenreListService;
		
//리뷰리스트가져오기
//평균별점점구하기
		@RequestMapping("/mypageHome.do")
		public ModelAndView mypageHome(WatchVO vo,HttpSession session,ModelAndView mav) {
		MemberVO member =new MemberVO();
		member = (MemberVO) session.getAttribute("member");
		String email = member.getEmail();
		vo.setEmail(email);
		
		//총 시청영화수 뽑기
		vo.setCountWatch(getCountWatchService.getCountWatch(vo));
		//많이본 장르리스트 순서대로 뽑기
		GenreVO genre = new GenreVO();
		List<GenreVO> genreList = getGenreListService.getGenreList(genre);
		Map<Integer, Integer> orderWatchGenreList = 
		getCountWatchGenreService.getCountWatchGenre(vo, genreList);
		Iterator<Map.Entry<Integer, Integer>> entries = orderWatchGenreList.entrySet().iterator();
		while (entries.hasNext()) {
		    Map.Entry<Integer, Integer> entry = entries.next();
		    System.out.println("Key = " + entry.getKey() + ", Value = " + entry.getValue());
		}// 어떤식으로 넘길건지, 순위후에 각 수치구해서 퍼센트로
//리뷰리스트
//평균별점구하기 추가
		mav.addObject("watch", vo);
		mav.setViewName("mypageHome");
		return mav;
	}
}

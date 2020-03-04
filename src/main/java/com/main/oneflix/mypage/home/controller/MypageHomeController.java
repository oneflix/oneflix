package com.main.oneflix.mypage.home.controller;

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
import com.main.oneflix.review.service.GetReviewService;
import com.main.oneflix.review.vo.ReviewVO;
import com.main.oneflix.watch.service.GetCountWatchGenreService;
import com.main.oneflix.watch.service.GetCountWatchService;
import com.main.oneflix.watch.vo.WatchVO;

@Controller
public class MypageHomeController {
	
		@Autowired
		private GetCountWatchGenreService getCountWatchGenreService;
		@Autowired
		private GetCountWatchService getCountWatchService;
		@Autowired
		private GetReviewService getReviewService;
		@Autowired
		private GetReviewListService getReviewListService;
		@Autowired
		private GetGenreListService getGenreListService;

		@RequestMapping("/mypageHome.do")
		public ModelAndView mypageHome(WatchVO vo,HttpSession session,ModelAndView mav) {
		MemberVO member = new MemberVO();
		member = (MemberVO) session.getAttribute("member");
		String email = member.getEmail();
		//총 시청영화수 뽑기
		vo.setEmail(email);
		vo.setCountWatch(getCountWatchService.getCountWatch(vo));
		//많이본 장르리스트 순서대로 뽑기
		GenreVO genre = new GenreVO();
		List<GenreVO> genreList = getGenreListService.getGenreList(genre);
		Map<Integer, Integer> orderWatchGenreList = 
		getCountWatchGenreService.getCountWatchGenre(vo, genreList);
//key: genreId value: watchCount
//		Iterator<Map.Entry<Integer, Integer>> entries = orderWatchGenreList.entrySet().iterator();
//		while (entries.hasNext()) {
//		    Map.Entry<Integer, Integer> entry = entries.next();
//		    System.out.println("genreId = " + entry.getKey() + ", watchCount = " + entry.getValue());
//		}
		//평균별점구하기
		ReviewVO review = new ReviewVO();
		review.setEmail(email);
		double averageScore = getReviewService.getAverageScore(review);
		List<ReviewVO> reviewList = getReviewListService.getReviewList(review);
		mav.addObject("orderWatchGenreList", orderWatchGenreList);
		mav.addObject("averageScore", averageScore);
		mav.addObject("reviewList", reviewList);
		mav.addObject("watch", vo);
		mav.setViewName("mypageHome");
		return mav;
	}
}

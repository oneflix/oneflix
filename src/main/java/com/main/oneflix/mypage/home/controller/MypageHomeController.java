package com.main.oneflix.mypage.home.controller;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.main.oneflix.genre.service.GetGenreListService;
import com.main.oneflix.genre.service.GetGenreService;
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
		private GetGenreService getGenreService;
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

		//평균별점구하기
		ReviewVO review = new ReviewVO();
		review.setEmail(email);
		double averageScore = getReviewService.getAverageScore(review);
		List<ReviewVO> reviewList = getReviewListService.getReviewList(review);
		mav.addObject("averageScore", averageScore);
		mav.addObject("reviewList", reviewList);
		mav.addObject("watch", vo);
		mav.setViewName("mypageHome");
		return mav;
	}
		@RequestMapping("/mypageHomeProcAjax.do")
		@ResponseBody
		public JSONObject mypageHomeProcAjax(WatchVO vo,HttpSession session) {
			 MemberVO member = new MemberVO();
			 member = (MemberVO) session.getAttribute("member");
			 String email = member.getEmail();
			 vo.setEmail(email);

			 //많이본 장르리스트 뽑기
			 GenreVO genre = new GenreVO();
			 List<GenreVO> genreList = getGenreListService.getGenreList(genre);
			 Map<Integer, Integer> orderWatchGenreList = 
			 getCountWatchGenreService.getCountWatchGenre(vo, genreList);
			 
			 //최종으로 넘길 데이터
			 JSONObject data = new JSONObject();
			 
			 //col 추가 
			 JSONObject col1 = new JSONObject();
			 JSONObject col2 = new JSONObject();
			 //위의 컬럼을 담을 배열
			 JSONArray arrayCols = new JSONArray();
			 JSONArray arrayRows = new JSONArray();
			 col1.put("type", "string");
			 col2.put("type","number");
			 arrayCols.add(col1);
			 arrayCols.add(col2);
			 
			 //map을 json으로
			 //map에서 key와 Value 뽑아서 Row 추가하기
		     //key: genreId value: watchCount
			 Iterator<Map.Entry<Integer, Integer>> entries = orderWatchGenreList.entrySet().iterator();
			 while (entries.hasNext()) {
			    Map.Entry<Integer, Integer> entry = entries.next();
			    System.out.println("Key = " + entry.getKey() + ", Value = " + entry.getValue());
			    
			    genre.setGenreId(entry.getKey());
			    String genreName = getGenreService.getGenreName(genre);
			    
			 	JSONObject legend = new JSONObject();
			    legend.put("v", genreName);
			    legend.put("f", null);

			    JSONObject value = new JSONObject();
			    value.put("v", entry.getValue());
			    value.put("f", null);
			    
			    JSONArray cValueArry = new JSONArray();
			    cValueArry.add(legend);
			    cValueArry.add(value);
			    
			    JSONObject cValueObj = new JSONObject();
			    cValueObj.put("c", cValueArry);
			    
			    arrayRows.add(cValueObj);
			    }
			 data.put("cols", arrayCols);
			 data.put("rows", arrayRows);

			 System.out.println("jsonData"+data);
			 return data;
		}
}

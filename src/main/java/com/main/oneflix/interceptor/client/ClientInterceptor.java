package com.main.oneflix.interceptor.client;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.main.oneflix.member.vo.MemberVO;
import com.main.oneflix.movie.dao.MovieDAO;
import com.main.oneflix.movie.vo.MovieVO;

public class ClientInterceptor implements HandlerInterceptor {

	@Autowired
	private MovieDAO movieDAO;
	// 반환이 false라면 controller로 요청 X
	// 매개변수 Object는 핸들러 정보 (RequestMapping, DefaultServletHandler)
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		
		if (session.getAttribute("member") == null) {
			response.sendRedirect("/oneflix.do");
			return false;
		}
		
		if (request.getRequestURI().equals("/moviePlay.do")) {
			MemberVO member = (MemberVO) session.getAttribute("member");
			String movieId = request.getParameter("movieId");
			MovieVO movie = new MovieVO();
			movie.setMovieId(Integer.parseInt(movieId));
			movie = movieDAO.getMovie(movie);
			if (movie.getRating().equals("19")) {
				PrintWriter writer = response.getWriter();
				if (member.getTicketId() == 0 || member.getMemberAge() < 19) {
					if (member.getTicketId() == 0) {
						writer.print("<script>alert('이용권 구매 후 시청해 주세요!');</script>");
					} else {
						writer.print("<script>alert('성인 영화는 시청하실 수 없습니다!');</script>");
					}
					writer.flush();
					writer.close();
					return false;
				}
			}
			request.setAttribute("movie", movie);
		}
		
		return true;
		
	}

	// controller의 handler가 끝나면 처리
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
	}

	// view까지 처리가 끝난 후에 처리
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
	}

	
}

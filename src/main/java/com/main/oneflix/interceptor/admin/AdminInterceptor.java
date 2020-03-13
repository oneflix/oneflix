package com.main.oneflix.interceptor.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class AdminInterceptor implements HandlerInterceptor {

	// 반환이 false라면 controller로 요청 X
	// 매개변수 Object는 핸들러 정보 (RequestMapping, DefaultServletHandler)
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		
		if (session.getAttribute("loginManager") == null) {
			response.sendRedirect("/login.mdo");
			return false;
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

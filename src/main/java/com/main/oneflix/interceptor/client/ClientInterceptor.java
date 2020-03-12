package com.main.oneflix.interceptor.client;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class ClientInterceptor implements HandlerInterceptor {

	// 반환이 false라면 controller로 요청 X
	// 매개변수 Object는 핸들러 정보 (RequestMapping, DefaultServletHandler)
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("pre-Handle");
		return false;
	}

	// controller의 handler가 끝나면 처리
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		System.out.println("post-Handle");
	}

	// view까지 처리가 끝난 후에 처리
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		System.out.println("after-Handle");
	}

	
}

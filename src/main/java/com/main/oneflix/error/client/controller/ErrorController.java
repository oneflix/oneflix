package com.main.oneflix.error.client.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice
public class ErrorController {
	
	@ExceptionHandler(Throwable.class)
	public ModelAndView errorHandler(HttpServletRequest req, Exception e) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("url", req.getRequestURL());
		mav.addObject("exception", e);
		mav.setViewName("error404");
		return mav;
	}

}

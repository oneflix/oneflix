package com.main.oneflix.aop;

import java.util.Arrays;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Aspect
public class LoggingAdvice {

	private static Logger logger = LoggerFactory.getLogger(LoggingAdvice.class);

	@Around("execution(* com.main.oneflix..*ServiceImpl.*(..))")
	public Object logging(ProceedingJoinPoint jp) throws Throwable {

		// 메서드가 실행되기 전
		logger.info("메서드 명: " + jp.getSignature().getName() + " 시작");
		logger.info("파라미터: " + Arrays.toString(jp.getArgs()));
		
		// 메서드 실행
		Object result = jp.proceed();

		// 메서드가 실행된 후
		logger.info("메서드 명: " + jp.getSignature().getName() + " 종료");
		return result;
	}
}

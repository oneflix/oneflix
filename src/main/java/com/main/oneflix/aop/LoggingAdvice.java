package com.main.oneflix.aop;


import java.text.DecimalFormat;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Aspect
public class LoggingAdvice {
	private static final Logger LOGGER = LoggerFactory.getLogger(LoggingAdvice.class); 
	@Around("execution(* com.main.oneflix..*ServiceImpl.*(..))") 
	public Object logPrint(ProceedingJoinPoint joinPoint) throws Throwable {

		long start = System.currentTimeMillis();
		try {
			return joinPoint.proceed();   
		} finally {
			DecimalFormat formatter = new DecimalFormat("###,###");
			long finish = System.currentTimeMillis();
			
			LOGGER.info(joinPoint.getSignature().toShortString() + 
					" in [" + formatter.format(finish - start) + "] ms");
			
		}
		
	}

}

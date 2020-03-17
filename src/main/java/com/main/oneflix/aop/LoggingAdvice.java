package com.main.oneflix.aop;


import java.text.DecimalFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.main.oneflix.manager.vo.ManagerVO;
import com.main.oneflix.member.vo.MemberVO;

@Aspect
public class LoggingAdvice {
	private static final Logger LOGGER = LoggerFactory.getLogger(LoggingAdvice.class); 
	@Around("execution(* com.main.oneflix..*ServiceImpl.*(..))") 
	public Object logPrint(ProceedingJoinPoint joinPoint) throws Throwable {

		HttpServletRequest request = 
		        ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
		String ip = request.getRemoteAddr();
		HttpSession session = request.getSession();
		String id = "";
		if (session.getAttribute("member") != null) {
			MemberVO member = (MemberVO)session.getAttribute("member");
			id = member.getEmail();
		} else if (session.getAttribute("loginManager") != null) {
			ManagerVO manager = (ManagerVO)session.getAttribute("loginManager");
			id = manager.getManagerId();
		}
		
		long start = System.currentTimeMillis();
		try {
			return joinPoint.proceed();   
		} finally {
			DecimalFormat formatter = new DecimalFormat("###,###");
			long finish = System.currentTimeMillis();
			
			LOGGER.info("[" + ip + "/" + id + "]\n\t" + joinPoint.getSignature().toShortString() + 
					" in [" + formatter.format(finish - start) + "] ms");
			
		}
		
	}

}

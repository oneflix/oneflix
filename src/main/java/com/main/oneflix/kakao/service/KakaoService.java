package com.main.oneflix.kakao.service;

public interface KakaoService {

	static final String MY_HOST = "http://127.0.0.1:8080/";
	static final String CONTENT_TYPE = "application/x-www-form-urlencoded; charset=UTF-8";
	
	static final String KAKAO_HOST = "https://kapi.kakao.com";
	
	static final String KAKAO_AUTH = "KakaoAK 4742437c38cc48af44b1cc3bd1d0c526";
	static final String KAKAO_SINGLE_PAY = "TC0ONETIME";
	static final String KAKAO_SUBSCRIP_PAY = "TCSUBSCRIP";
	
	static final String PAY_READY_PATH = "/v1/payment/ready";
	static final String PAY_APPROVE_PATH = "/v1/payment/approve";
	static final String PAY_SUBSCRIP_PATH = "/v1/payment/subscription";
}

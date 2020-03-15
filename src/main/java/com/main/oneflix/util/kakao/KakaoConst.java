package com.main.oneflix.util.kakao;

public interface KakaoConst {

	static final String MY_HOST = "http://113.209.21.185:8080/";
	static final String CONTENT_TYPE = "application/x-www-form-urlencoded; charset=UTF-8";
	
	static final String KAKAO_HOST = "https://kapi.kakao.com";
	
	static final String KAKAO_AUTH = "KakaoAK 4742437c38cc48af44b1cc3bd1d0c526";
	static final String KAKAO_SINGLE_PAY = "TC0ONETIME";
	static final String KAKAO_SUBSCRIP_PAY = "TCSUBSCRIP";
	
	static final String PAYMENT_READY_PATH = "/v1/payment/ready";
	static final String PAYMENT_APPROVE_PATH = "/v1/payment/approve";
	static final String PAYMENT_SUBSCRIP_PATH = "/v1/payment/subscription";
	static final String PAYMENT_INACTIVE_PATH = "/v1/payment/manage/subscription/inactive";
	static final String PAYMENT_REFUND_PATH = "/v1/payment/cancel";
	
	static final String KAKAO_CLIENT_ID = "1820aaaf12b6f3ad68c37261ecbf9eed";
	static final String KAKAO_REDIRECT_URI = "http://13.209.21.185:8080/kakao_oauth.do";
	static final String KAKAO_REQUEST_URL = "https://kauth.kakao.com/oauth/token";
	static final String KAKAO_URI = "https://kauth.kakao.com.oauth/authorize?"
									+"client_id" + KAKAO_CLIENT_ID + "&redirect_uri="
									+ KAKAO_REDIRECT_URI + "&response_type=code";
	
}

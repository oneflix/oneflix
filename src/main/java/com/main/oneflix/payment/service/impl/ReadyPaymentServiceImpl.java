package com.main.oneflix.payment.service.impl;

import java.util.Properties;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.main.oneflix.kakao.payment.service.ReadyPaymentService;
import com.main.oneflix.kakao.service.KakaoService;

public class ReadyPaymentServiceImpl implements KakaoService, ReadyPaymentService {

	@Override
	public Properties readyPayment(Properties props) {
		// 빈으로 등록하는 방법 연구해보기
		RestTemplate restTemplate = new RestTemplate();
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", KAKAO_AUTH);
		headers.add("Content-Type", CONTENT_TYPE);
		
		MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
		if (props.get("cid").equals("single")) {
			params.add("cid", KAKAO_SINGLE_PAY);
		} else {
			params.add("cid", KAKAO_SUBSCRIP_PAY);
		}
		params.add("partner_order_id", props.getProperty("partner_order_id"));
		params.add("partner_user_id", props.getProperty("partner_user_id"));
		params.add("item_name", props.getProperty("item_name"));
		params.add("total_amount", props.getProperty("total_amount"));
		params.add("quantity", props.getProperty("quantity"));
		params.add("tax_free_amount", props.getProperty("tax_free_amount"));
		params.add("payment_method_type", props.getProperty("payment_method_type")); // MONEY 에러 있어서 CARD 값 주기, 값 없으면 전체
		params.add("approval_url", MY_HOST + props.getProperty("approval_url"));
		params.add("cancel_url", MY_HOST + props.getProperty("cancel_url"));
		params.add("fail_url", MY_HOST + props.getProperty("fail_url"));
		
		HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
		
		
		return null;
	}

}

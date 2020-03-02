package com.main.oneflix.util.kakao.payment.service.impl;

import java.net.URI;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.main.oneflix.sales.vo.SalesVO;
import com.main.oneflix.util.factory.rest.RestTemplateFactory;
import com.main.oneflix.util.kakao.KakaoConst;
import com.main.oneflix.util.kakao.payment.service.ApprovePaymentService;

@Service
public class ApprovePaymentServiceImpl implements KakaoConst, ApprovePaymentService {

	@Override
	public SalesVO approvePayment(SalesVO vo) {
		RestTemplate restTemplate = RestTemplateFactory.getRestTemplate();
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", KAKAO_AUTH);
		headers.add("Content-Type", CONTENT_TYPE);
		
		MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
		params.add("cid", vo.getCid());
		params.add("tid", vo.getTid());
		params.add("partner_order_id", vo.getSalesId());
		params.add("partner_user_id", vo.getEmail());
		params.add("pg_token", vo.getPg_token());
		
		HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String,String>>(params, headers);
		
		try {
			URI uri = new URI(KAKAO_HOST + PAYMENT_APPROVE_PATH);
			SalesVO response = restTemplate.postForObject(uri, body, SalesVO.class);
			
			return response;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

}

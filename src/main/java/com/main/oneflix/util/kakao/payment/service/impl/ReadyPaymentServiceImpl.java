package com.main.oneflix.util.kakao.payment.service.impl;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.Properties;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.main.oneflix.sales.vo.SalesVO;
import com.main.oneflix.util.kakao.KakaoConst;
import com.main.oneflix.util.kakao.payment.service.ReadyPaymentService;

@Service
public class ReadyPaymentServiceImpl implements KakaoConst, ReadyPaymentService {

	@Autowired
	private RestTemplate restTemplate;
	
	@Override
	public SalesVO readyPayment(SalesVO vo) {
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", KAKAO_AUTH);
		headers.add("Content-Type", CONTENT_TYPE);
		
		MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
		if (vo.getCid().equals("single")) {
			vo.setCid(KAKAO_SINGLE_PAY);
		} else {
			vo.setCid(KAKAO_SUBSCRIP_PAY);
		}
		
		params.add("cid", vo.getCid());
		params.add("partner_order_id", vo.getSalesId());
		params.add("partner_user_id", vo.getEmail());
		params.add("item_name", vo.getItem_name());
		params.add("total_amount", vo.getTotal_amount());
		params.add("quantity", vo.getQuantity());
		params.add("tax_free_amount", vo.getTax_free_amount());
//		params.add("payment_method_type", vo.getPayment_method_type()); // MONEY 에러 있어서 CARD 값 주기, 값 없으면 전체
		params.add("approval_url", MY_HOST + vo.getApproval_url());
		params.add("cancel_url", MY_HOST + vo.getCancel_url());
		params.add("fail_url", MY_HOST + vo.getFail_url());
		
		HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
		
		try {
			URI uri = new URI(KAKAO_HOST + PAYMENT_READY_PATH);
			SalesVO response = restTemplate.postForObject(uri, body, SalesVO.class);
			vo.setTid(response.getTid());
			vo.setNext_redirect_pc_url(response.getNext_redirect_pc_url());

			return vo;
			
		} catch (URISyntaxException e) {
			e.printStackTrace();
		}
		return null;
	}

}

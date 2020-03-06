package com.main.oneflix.util.kakao.payment.service.impl;

import java.net.URI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.main.oneflix.sales.dao.SalesDAO;
import com.main.oneflix.sales.vo.SalesVO;
import com.main.oneflix.util.factory.rest.RestTemplateFactory;
import com.main.oneflix.util.kakao.KakaoConst;
import com.main.oneflix.util.kakao.payment.service.InactiveSubscriptionService;

@Service
public class InactiveSubscriptionServiceImpl implements KakaoConst, InactiveSubscriptionService {

	@Autowired
	private SalesDAO salesDAO;
	
	@Override
	public SalesVO inactivate(SalesVO vo) {
		
		RestTemplate restTemplate = RestTemplateFactory.getRestTemplate();
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", KAKAO_AUTH);
		headers.add("Content-Type", CONTENT_TYPE);
		
		MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
		params.add("cid", vo.getCid());
		params.add("sid", vo.getSid());
		
		HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String,String>>(params, headers);
		
		try {
			URI uri = new URI(KAKAO_HOST + PAYMENT_INACTIVE_PATH);
			SalesVO response = restTemplate.postForObject(uri, body, SalesVO.class);
			
			vo.setSalesStatus("inactive");
			salesDAO.updateSales(vo);
			return response;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
		
	}

}

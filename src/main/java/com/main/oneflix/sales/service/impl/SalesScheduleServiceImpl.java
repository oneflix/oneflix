package com.main.oneflix.sales.service.impl;

import java.net.URI;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.main.oneflix.member.dao.MemberDAO;
import com.main.oneflix.sales.dao.SalesDAO;
import com.main.oneflix.sales.service.SalesScheduleService;
import com.main.oneflix.sales.vo.SalesVO;
import com.main.oneflix.util.factory.rest.RestTemplateFactory;
import com.main.oneflix.util.kakao.KakaoConst;

@Service
public class SalesScheduleServiceImpl implements KakaoConst, SalesScheduleService {

	@Autowired
	private SalesDAO salesDAO;
	@Autowired
	private MemberDAO memberDAO;
		
	@Override
	public void salesSchedule() {
		
		// 이용권 만료
		List<SalesVO> subscriptionList = salesDAO.getSubscriptionList();
		List<String> subscriptionEmailList = new ArrayList<>();
		List<String> expiryEmailList = salesDAO.expiryCheck();
		salesDAO.updateExpiry();
		
		// 구독자 이용권 구매
		for (SalesVO vo : subscriptionList) {
			subscriptionEmailList.add(vo.getEmail());
			RestTemplate restTemplate = RestTemplateFactory.getRestTemplate();
			HttpHeaders headers = new HttpHeaders();
			headers.add("Authorization", KAKAO_AUTH);
			headers.add("Content-Type", CONTENT_TYPE);
			
			MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
			params.add("cid", vo.getCid());
			params.add("sid", vo.getSid());
			params.add("partner_order_id", makeSalesId());
			params.add("partner_user_id", vo.getEmail());
			params.add("quantity", "1");
			params.add("total_amount", String.valueOf(vo.getTicketPrice()));
			params.add("tax_free_amount", "0");
			
			HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String,String>>(params, headers);
			
			try {
				URI uri = new URI(KAKAO_HOST + PAYMENT_SUBSCRIP_PATH);
				SalesVO response = restTemplate.postForObject(uri, body, SalesVO.class);
				vo.setTid(response.getTid());
				vo.setSid(response.getSid());
				vo.setSalesId(response.getSalesId());
				vo.setPaymentMethodType(response.getPayment_method_type());
				if (vo.getPaymentMethodType().equals("CARD")) {
					vo.setCardName((String)vo.getCard_info().get("issuer_corp"));
				}
				salesDAO.insertSubscrition(vo);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			// ticket_id = 0으로
			Map<String, List<String>> map = new HashMap<>();
			map.put("expiryEmailList", expiryEmailList);
			map.put("subscriptionEmailList", subscriptionEmailList);
			if (expiryEmailList.size() != 0 || subscriptionEmailList.size() != 0) {
				System.out.println(expiryEmailList.size());
				System.out.println(subscriptionEmailList.size());
				memberDAO.updateTicketExpiry(map);
			}
		}
	
	}
	
	private String makeSalesId() {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
		long currentTime = System.currentTimeMillis();
		String time = String.valueOf(currentTime);
		time = time.substring(time.length() - 8, time.length());
		StringBuilder salesId = new StringBuilder(dateFormat.format(currentTime));
		salesId.append(time);
		return salesId.toString();
	}

}

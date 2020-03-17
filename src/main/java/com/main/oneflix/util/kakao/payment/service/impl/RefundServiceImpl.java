package com.main.oneflix.util.kakao.payment.service.impl;

import java.net.URI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.main.oneflix.member.dao.MemberDAO;
import com.main.oneflix.member.vo.MemberVO;
import com.main.oneflix.sales.dao.SalesDAO;
import com.main.oneflix.sales.vo.SalesVO;
import com.main.oneflix.util.factory.rest.RestTemplateFactory;
import com.main.oneflix.util.kakao.KakaoConst;
import com.main.oneflix.util.kakao.payment.service.RefundService;

@Service
public class RefundServiceImpl implements KakaoConst, RefundService {

	@Autowired
	private SalesDAO salesDAO;
	@Autowired
	private MemberDAO memberDAO;
	
	@Override
	@Transactional
	public SalesVO refund(SalesVO vo) {

		vo = salesDAO.getSales(vo);
		
		RestTemplate restTemplate = RestTemplateFactory.getRestTemplate();
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", KAKAO_AUTH);
		headers.add("Content-Type", CONTENT_TYPE);
		
		MultiValueMap<String, Object> params = new LinkedMultiValueMap<String, Object>();
		params.add("cid", vo.getCid());
		params.add("tid", vo.getTid());
		params.add("cancel_amount", vo.getTicketPrice());
		params.add("cancel_tax_free_amount", 0);
		
		HttpEntity<MultiValueMap<String, Object>> body = new HttpEntity<MultiValueMap<String,Object>>(params, headers);
		
		try {
			URI uri = new URI(KAKAO_HOST + PAYMENT_REFUND_PATH);
			SalesVO response = restTemplate.postForObject(uri, body, SalesVO.class);
			
			vo.setSalesStatus("refund");
			salesDAO.updateSales(vo);
			
			MemberVO member = new MemberVO();
			member.setEmail(vo.getEmail());
			member.setUpdateType("sales");
			member.setTicketId(0);
			memberDAO.updateMember(member);
			
			return response;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
		
	}

}

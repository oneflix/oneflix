package com.main.oneflix.inquiry.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.oneflix.inquiry.dao.InquiryDAO;
import com.main.oneflix.inquiry.service.GetInquiryService;
import com.main.oneflix.inquiry.vo.InquiryVO;

@Service
public class GetInquiryServiceImpl implements GetInquiryService {
	
	@Autowired
	private InquiryDAO inquiryDAO;

	@Override
	public void getInquiry(InquiryVO vo) {
		inquiryDAO.getInquiry(vo);
	}

}

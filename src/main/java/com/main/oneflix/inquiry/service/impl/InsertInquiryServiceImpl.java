package com.main.oneflix.inquiry.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.oneflix.inquiry.dao.InquiryDAO;
import com.main.oneflix.inquiry.service.InsertInquiryService;
import com.main.oneflix.inquiry.vo.InquiryVO;

@Service
public class InsertInquiryServiceImpl implements InsertInquiryService {
	
	@Autowired
	private InquiryDAO inquiryDAO;
	
	@Override
	public void insertInquiry(InquiryVO vo) {
		inquiryDAO.insertInquiry(vo);
	}

}

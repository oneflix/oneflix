package com.main.oneflix.inquiry.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.oneflix.inquiry.dao.InquiryDAO;
import com.main.oneflix.inquiry.vo.InquiryVO;

@Service
public class GetCountInquiryService implements com.main.oneflix.inquiry.service.GetCountInquiryService {
	@Autowired
	private InquiryDAO inquiryDAO;
	@Override
	public int getCountInquiry(InquiryVO vo) {
		return inquiryDAO.getCountInquiry(vo);
	}

}

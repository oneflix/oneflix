package com.main.oneflix.inquiry.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.oneflix.inquiry.dao.InquiryDAO;
import com.main.oneflix.inquiry.service.DeleteInquiryService;
import com.main.oneflix.inquiry.vo.InquiryVO;

@Service
public class DeleteInquiryServiceImpl implements DeleteInquiryService {
	@Autowired
	InquiryDAO inquiryDAO;

	@Override
	public void deleteInquiry(InquiryVO vo) {
		inquiryDAO.deleteInquiry(vo);
	}

}

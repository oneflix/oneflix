package com.main.oneflix.inquiry.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.oneflix.inquiry.dao.InquiryDAO;
import com.main.oneflix.inquiry.service.UpdateInquiryService;
import com.main.oneflix.inquiry.vo.InquiryVO;

@Service
public class UpdateInquriyServiceImpl implements UpdateInquiryService {
	@Autowired
	private InquiryDAO inquiryDAO;

	@Override
	public void updateInquiry(InquiryVO vo) {
		inquiryDAO.updateInquiry(vo);
		

	}

}

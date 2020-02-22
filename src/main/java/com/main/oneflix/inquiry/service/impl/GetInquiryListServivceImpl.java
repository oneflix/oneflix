package com.main.oneflix.inquiry.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.oneflix.inquiry.dao.InquiryDAO;
import com.main.oneflix.inquiry.service.GetInquiryListService;
import com.main.oneflix.inquiry.vo.InquiryVO;

@Service
public class GetInquiryListServivceImpl implements GetInquiryListService {
	@Autowired
	private InquiryDAO inquiryDAO;
	@Override
	public List<InquiryVO> getInquiryList(InquiryVO vo) {
		return inquiryDAO.getInquiryList(vo);
	}

}

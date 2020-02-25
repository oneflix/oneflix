package com.main.oneflix.inquiry.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.oneflix.inquiry.dao.InquiryDAO;
import com.main.oneflix.inquiry.service.SelectInquiryListService;
import com.main.oneflix.inquiry.vo.InquiryVO;
import com.main.oneflix.util.paging.vo.PagingVO;

@Service
public class SelectInquiryListServiceImpl implements SelectInquiryListService {
	@Autowired
	private InquiryDAO inquiryDAO;

	@Override
	public int countInquiry() {
		return inquiryDAO.countInquiry();
	}

	@Override
	public List<InquiryVO> selectInquiry(PagingVO vo) {
		return inquiryDAO.selectInquiry(vo);
	}

}

package com.main.oneflix.inquiry.service;

import java.util.List;

import com.main.oneflix.inquiry.vo.InquiryVO;

public interface GetInquiryListService {
	public List<InquiryVO> getInquiryList(InquiryVO vo);
}

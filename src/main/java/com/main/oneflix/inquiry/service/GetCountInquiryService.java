package com.main.oneflix.inquiry.service;

import com.main.oneflix.inquiry.vo.InquiryVO;

public interface GetCountInquiryService {
	// 게시물 총 갯수
	public int getCountInquiry(InquiryVO vo);
}

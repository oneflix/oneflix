package com.main.oneflix.inquiry.dao;

import java.util.List;

import com.main.oneflix.inquiry.vo.InquiryVO;

public interface InquiryDAO {
	void insertInquiry(InquiryVO vo);
	InquiryVO getInquiry(InquiryVO vo);
	List<InquiryVO> getInquiryList(InquiryVO vo);
	void updateInquiry(InquiryVO vo);
	int getCountInquiry(InquiryVO vo);
	void deleteInquiry(InquiryVO vo);

}

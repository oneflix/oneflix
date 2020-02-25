package com.main.oneflix.inquiry.dao;

import java.util.List;

import com.main.oneflix.inquiry.vo.InquiryVO;
import com.main.oneflix.util.paging.vo.PagingVO;

public interface InquiryDAO {
	public void insertInquiry(InquiryVO vo);
	public InquiryVO getInquiry(InquiryVO vo);
	public List<InquiryVO> getInquiryList(InquiryVO vo);
	public void updateInquiry(InquiryVO vo);
	public int countInquiry();
	public List<InquiryVO> selectInquiry(PagingVO vo);
}

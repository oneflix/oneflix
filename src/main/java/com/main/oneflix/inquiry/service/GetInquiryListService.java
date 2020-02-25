package com.main.oneflix.inquiry.service;

import java.util.List;

import com.main.oneflix.inquiry.vo.InquiryVO;
import com.main.oneflix.util.paging.vo.PagingVO;

public interface GetInquiryListService {
	public List<InquiryVO> getInquiryList(InquiryVO vo);

	// 게시물 총 갯수
	public int countInquiry();

	// 페이징 처리 게시글 조회
	public List<InquiryVO> selectInquiry(PagingVO vo);

}

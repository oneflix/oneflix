package com.main.oneflix.inquiry.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.main.oneflix.inquiry.dao.InquiryDAO;
import com.main.oneflix.inquiry.vo.InquiryVO;

@Repository
public class OracleInquiryDAO implements InquiryDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public void insertInquiry(InquiryVO vo) {
		sqlSessionTemplate.insert("InqiryDAO.insertInquiry", vo);
	}
	@Override
	public void getInquiry(InquiryVO vo) {
		sqlSessionTemplate.selectOne("InquiryDAO.getInquiry", vo);
	}
	@Override
	public List<InquiryVO> getInquiryList(InquiryVO vo) {
		return sqlSessionTemplate.selectList("InquiryDAO.getInquiryList", vo);
	}
	@Override
	public void updateInquiry(InquiryVO vo) {
		sqlSessionTemplate.update("InquiryDAO.updateInquiry",vo);
	}
}

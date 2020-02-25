package com.main.oneflix.util.email.service;

import java.util.Properties;

import com.main.oneflix.inquiry.vo.InquiryVO;

public interface EmailService {
	public void sendEmail(InquiryVO vo);

}

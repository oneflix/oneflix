package com.main.oneflix.util.email.service.impl;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.main.oneflix.inquiry.vo.InquiryVO;
import com.main.oneflix.util.email.service.EmailService;

@Service
public class EmailServiceImpl implements EmailService {
	@Autowired
	JavaMailSender mailSender;

	@Override
	public void sendEmail(InquiryVO vo) {
		try {
			MimeMessage msg = mailSender.createMimeMessage();

//	        html로 보낼 경우            
			MimeMessageHelper helper = new MimeMessageHelper(msg, true, "utf-8");
			helper.setTo(vo.getEmail());
			helper.setSubject(vo.getReplyTitle());
			helper.setText(vo.getReplyContent(), true);

			// 이메일 보내기
			mailSender.send(msg);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}

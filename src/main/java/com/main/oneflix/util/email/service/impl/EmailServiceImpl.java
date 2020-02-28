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
	            // 이메일 객체
	            MimeMessage msg = mailSender.createMimeMessage();
	 
	            // 받는 사람을 설정 (수신자, 받는사람의 이메일 주소 객체를 생성해서 수신자 이메일주소를 담음)
//	            msg.addRecipient(RecipientType.TO, new InternetAddress(vo.getMemberEmail()));

	            /*
	             * createMimeMessage() : MimeMessage객체를 생성시킴 (이것을 이용해서 메시지를 구성한 뒤 메일 발송)
	             * addRecipient() : 메시지의 발신자를 설정 InternetAddress() : 이메일 주소 getReceiveMail() :
	             * 수신자 이메일 주소
	             */
	 
	            // 보내는 사람(이메일주소+이름)
	            // (발신자, 보내는 사람의 이메일 주소와 이름을 담음)
	            // 이메일 발신자
//	            String AdminEmail = "jaenyes17@gmail.com";
//	            msg.addFrom(new InternetAddress[] { new InternetAddress(vo.getAdminEmail(), vo.getAdminName())});
	 
//	            // 이메일 제목 (인코딩을 해야 한글이 깨지지 않음)
//	            msg.setSubject(vo.getEmailTitle(), "utf-8");
//	            // 이메일 본문 (인코딩을 해야 한글이 깨지지 않음)
//	            msg.setText(vo.getEmailContent(), "utf-8");
	 
//	            html로 보낼 경우            
//	            MimeMessage message = mailSender.createMimeMessage();
	            MimeMessageHelper helper
	            = new MimeMessageHelper(msg, true,"utf-8");
//	            helper.setFrom(vo.getAdminEmail());
	            helper.setTo(vo.getMemberEmail());
	            helper.setSubject(vo.getEmailTitle());
	            helper.setText(vo.getEmailContent(), true);
	            
	            // 이메일 보내기
	            mailSender.send(msg);
	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	    }
	
}

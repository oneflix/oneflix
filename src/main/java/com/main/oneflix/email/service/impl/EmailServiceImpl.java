package com.main.oneflix.email.service.impl;

import javax.inject.Inject;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.main.oneflix.email.dto.EmailDTO;
import com.main.oneflix.email.service.EmailService;

@Service
public class EmailServiceImpl implements EmailService {
	 @Inject
	 JavaMailSender mailSender; 
	@Override
	public void sendMail(EmailDTO dto) {
		 try {
	            // 이메일 객체
	            MimeMessage msg = mailSender.createMimeMessage();
	 
	            // 받는 사람을 설정 (수신자, 받는사람의 이메일 주소 객체를 생성해서 수신자 이메일주소를 담음)
	            msg.addRecipient(RecipientType.TO, new InternetAddress(dto.getReceiveMail()));
	 
	            /*
	             * createMimeMessage() : MimeMessage객체를 생성시킴 (이것을 이용해서 메시지를 구성한 뒤 메일 발송)
	             * addRecipient() : 메시지의 발신자를 설정 InternetAddress() : 이메일 주소 getReceiveMail() :
	             * 수신자 이메일 주소
	             */
	 
	            // 보내는 사람(이메일주소+이름)
	            // (발신자, 보내는 사람의 이메일 주소와 이름을 담음)
	            // 이메일 발신자
	            msg.addFrom(new InternetAddress[] { new InternetAddress(dto.getSenderMail(), dto.getSenderName()) });
	 
	            // 이메일 제목 (인코딩을 해야 한글이 깨지지 않음)
	            msg.setSubject(dto.getSubject(), "utf-8");
	            // 이메일 본문 (인코딩을 해야 한글이 깨지지 않음)
	            msg.setText(dto.getMessage(), "utf-8");
	 
//	            html로 보낼 경우            
//	            MimeMessage message = mailSender.createMimeMessage();
//	            MimeMessageHelper helper 
//	            = new MimeMessageHelper(message, true);
//	            helper.setTo("test@host.com");
//	            helper.setText("<html><body><img src='cid:identifier1234'></body></html>", true);
	 
	            // 이메일 보내기
	            mailSender.send(msg);
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
}

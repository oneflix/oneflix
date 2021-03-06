package com.main.oneflix.inquiry.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.main.oneflix.alarm.dao.AlarmDAO;
import com.main.oneflix.inquiry.dao.InquiryDAO;
import com.main.oneflix.inquiry.service.ReplyService;
import com.main.oneflix.inquiry.vo.InquiryVO;

@Service
public class ReplyServiceImpl implements ReplyService {
	@Autowired
	private InquiryDAO inquiryDAO;
	@Autowired
	private AlarmDAO alarmDAO;

	@Override
	@Transactional
	public void reply(InquiryVO vo) {
		vo.setManagerEmail("main.oneflix@gmail.com");
		inquiryDAO.updateInquiry(vo);
		alarmDAO.insertReplyAlarm(vo.getEmail());
	}

}

package com.main.oneflix.inquiry.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	public void reply(InquiryVO vo) {
		inquiryDAO.updateInquiry(vo);
		alarmDAO.insertReplyAlarm(vo.getEmail());
	}

}

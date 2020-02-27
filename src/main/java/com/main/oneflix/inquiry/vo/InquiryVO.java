package com.main.oneflix.inquiry.vo;

import java.util.Date;

public class InquiryVO {

	private Integer inquiryId;
	private String inquiryType;
	private String inquiryTitle;
	private String inquiryContent;
	
	//이메일정보
	private String nick; // 수신자이름
	private String memberEmail; // 수신자메일
	private String adminName; // 발신자이름
	private String adminEmail; // 발신자메일
	private String emailTitle; // 메일제목
	private String emailContent; // 메일내용
	private Date receiveDate;
	private Date replyDate;
	
	//페이징
	private int start;
	private int end;
	
	//검색
	private String searchInquiry;
	private String searchInquiryType;
	private String searchMember;
	private String searchCheckReply;
	
	public String getSearchInquiry() {
		return searchInquiry;
	}
	public void setSearchInquiry(String searchInquiry) {
		this.searchInquiry = searchInquiry;
	}
	public String getSearchInquiryType() {
		return searchInquiryType;
	}
	public void setSearchInquiryType(String searchInquiryType) {
		this.searchInquiryType = searchInquiryType;
	}
	public String getSearchMember() {
		return searchMember;
	}
	public void setSearchMember(String searchMember) {
		this.searchMember = searchMember;
	}
	public String getSearchCheckReply() {
		return searchCheckReply;
	}
	public void setSearchCheckReply(String searchCheckReply) {
		this.searchCheckReply = searchCheckReply;
	}
	public Integer getInquiryId() {
		return inquiryId;
	}
	public void setInquiryId(Integer inquiryId) {
		this.inquiryId = inquiryId;
	}
	public String getInquiryType() {
		return inquiryType;
	}
	public void setInquiryType(String inquiryType) {
		this.inquiryType = inquiryType;
	}
	public String getInquiryTitle() {
		return inquiryTitle;
	}
	public void setInquiryTitle(String inquiryTitle) {
		this.inquiryTitle = inquiryTitle;
	}
	public String getInquiryContent() {
		return inquiryContent;
	}
	public void setInquiryContent(String inquiryContent) {
		this.inquiryContent = inquiryContent;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public String getMemberEmail() {
		return memberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}
	public String getAdminName() {
		return adminName;
	}
	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}
	public String getAdminEmail() {
		return adminEmail;
	}
	public void setAdminEmail(String adminEmail) {
		this.adminEmail = adminEmail;
	}
	public String getEmailTitle() {
		return emailTitle;
	}
	public void setEmailTitle(String emailTitle) {
		this.emailTitle = emailTitle;
	}
	public String getEmailContent() {
		return emailContent;
	}
	public void setEmailContent(String emailContent) {
		this.emailContent = emailContent;
	}
	public Date getReceiveDate() {
		return receiveDate;
	}
	public void setReceiveDate(Date receiveDate) {
		this.receiveDate = receiveDate;
	}
	public Date getReplyDate() {
		return replyDate;
	}
	public void setReplyDate(Date replyDate) {
		this.replyDate = replyDate;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
}	

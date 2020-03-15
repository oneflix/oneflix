package com.main.oneflix.inquiry.vo;

import java.util.Date;

public class InquiryVO {

	private int rnum;
	private Integer inquiryId;
	private String inquiryType;
	private String inquiryTitle;
	private String inquiryContent;

	// 이메일정보
	private String nick; // 수신자이름
	private String email; // 수신자메일
	private String adminName; // 발신자이름
	private String adminEmail; // 발신자메일
	private String replyTitle; // 메일제목
	private String replyContent; // 메일내용
	private Date inquiryDate;
	private Date replyDate;

	// 페이징
	private int start;
	private int end;

	// 검색
	private String searchInquiryType;
	private String searchCondition;
	private String searchInquiry;
	private String replyCheck;

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
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

	public String getReplyTitle() {
		return replyTitle;
	}

	public void setReplyTitle(String replyTitle) {
		this.replyTitle = replyTitle;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public Date getInquiryDate() {
		return inquiryDate;
	}

	public void setInquiryDate(Date inquiryDate) {
		this.inquiryDate = inquiryDate;
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

	public String getSearchInquiryType() {
		return searchInquiryType;
	}

	public void setSearchInquiryType(String searchInquiryType) {
		this.searchInquiryType = searchInquiryType;
	}

	public String getSearchCondition() {
		return searchCondition;
	}

	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}

	public String getSearchInquiry() {
		return searchInquiry;
	}

	public void setSearchInquiry(String searchInquiry) {
		this.searchInquiry = searchInquiry;
	}

	public String getReplyCheck() {
		return replyCheck;
	}

	public void setReplyCheck(String replyCheck) {
		this.replyCheck = replyCheck;
	}

	@Override
	public String toString() {
		return "InquiryVO [rnum=" + rnum + ", inquiryId=" + inquiryId + ", inquiryType=" + inquiryType
				+ ", inquiryTitle=" + inquiryTitle + ", inquiryContent=" + inquiryContent + ", nick=" + nick
				+ ", email=" + email + ", adminName=" + adminName + ", adminEmail=" + adminEmail + ", replyTitle="
				+ replyTitle + ", replyContent=" + replyContent + ", inquiryDate=" + inquiryDate + ", replyDate="
				+ replyDate + ", start=" + start + ", end=" + end + ", searchInquiryType=" + searchInquiryType
				+ ", searchCondition=" + searchCondition + ", searchInquiry=" + searchInquiry + ", replyCheck="
				+ replyCheck + "]";
	}

	
}
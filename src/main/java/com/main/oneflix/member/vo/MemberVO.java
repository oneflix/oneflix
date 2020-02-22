package com.main.oneflix.member.vo;

import java.util.Date;

public class MemberVO {
	private String email;
	private String pass;
	private String nick;
	private String birth;
	private String gender;
	private int MemberAge;
	private int ticketPeriod;
	private String cert;
	private String ban;
	private String searchMember;
	private String searchAll;
	private String searchTicket;
	private String searchCert;
	private String searchBan;
	private Date joinDate;

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public int getMemberAge() {
		return MemberAge;
	}

	public void setMemberAge(int memberAge) {
		MemberAge = memberAge;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public int getTicketPeriod() {
		return ticketPeriod;
	}

	public void setTicketPeriod(int ticketPeriod) {
		this.ticketPeriod = ticketPeriod;
	}

	public String getCert() {
		return cert;
	}

	public void setCert(String cert) {
		this.cert = cert;
	}

	public String getBan() {
		return ban;
	}

	public void setBan(String ban) {
		this.ban = ban;
	}

	public String getSearchMember() {
		return searchMember;
	}

	public void setSearchMember(String searchMember) {
		this.searchMember = searchMember;
	}

	public String getSearchAll() {
		return searchAll;
	}

	public void setSearchAll(String searchAllCategory) {
		this.searchAll = searchAllCategory;
	}

	public String getSearchTicket() {
		return searchTicket;
	}

	public void setSearchTicket(String searchTicket) {
		this.searchTicket = searchTicket;
	}

	public String getSearchCert() {
		return searchCert;
	}

	public void setSearchCert(String searchCert) {
		this.searchCert = searchCert;
	}

	public String getSearchBan() {
		return searchBan;
	}

	public void setSearchBan(String searchBan) {
		this.searchBan = searchBan;
	}

	public Date getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}

	@Override
	public String toString() {
		return "MemberVO [email=" + email + ", pass=" + pass + ", nick=" + nick + ", birth=" + birth + ", gender="
				+ gender + ", MemberAge=" + MemberAge + ", ticketPeriod=" + ticketPeriod + ", cert=" + cert + ", ban="
				+ ban + ", searchMember=" + searchMember + "]";
	}

}

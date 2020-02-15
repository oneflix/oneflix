package com.main.oneflix.member.vo;

public class MemberVO {
	private String email;
	private String pass;
	private String nick;
	private String birth;
	private String gender;
	private int ticketPeriod;
	private String cert;

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

}

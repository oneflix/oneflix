package com.main.oneflix.sales.vo;

public class SalesVO {

	private Integer salesId;
	private Integer ticketId;
	private String memberEmail;
	private String next_redirect_pc_url;

	public Integer getSalesId() {
		return salesId;
	}

	public void setSalesId(Integer salesId) {
		this.salesId = salesId;
	}

	public Integer getTicketId() {
		return ticketId;
	}

	public void setTicketId(Integer ticketId) {
		this.ticketId = ticketId;
	}

	public String getMemberEmail() {
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}

	public String getNext_redirect_pc_url() {
		return next_redirect_pc_url;
	}

	public void setNext_redirect_pc_url(String next_redirect_pc_url) {
		this.next_redirect_pc_url = next_redirect_pc_url;
	}

}

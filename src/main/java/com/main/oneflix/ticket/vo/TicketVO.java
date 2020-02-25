package com.main.oneflix.ticket.vo;

public class TicketVO {
	private Integer ticketId;
	private String ticketName;
	private int ticketPeriod;
	private int ticketPrice;
	private String ticketRecommend;
	private String ticketStatus;

	public Integer getTicketId() {
		return ticketId;
	}

	public void setTicketId(Integer ticketId) {
		this.ticketId = ticketId;
	}

	public String getTicketName() {
		return ticketName;
	}

	public void setTicketName(String ticketName) {
		this.ticketName = ticketName;
	}

	public int getTicketPeriod() {
		return ticketPeriod;
	}

	public void setTicketPeriod(int ticketPeriod) {
		this.ticketPeriod = ticketPeriod;
	}

	public int getTicketPrice() {
		return ticketPrice;
	}

	public void setTicketPrice(int ticketPrice) {
		this.ticketPrice = ticketPrice;
	}

	public String getTicketRecommend() {
		return ticketRecommend;
	}

	public void setTicketRecommend(String ticketRecommend) {
		this.ticketRecommend = ticketRecommend;
	}

	public String getTicketStatus() {
		return ticketStatus;
	}

	public void setTicketStatus(String ticketStatus) {
		this.ticketStatus = ticketStatus;
	}
}

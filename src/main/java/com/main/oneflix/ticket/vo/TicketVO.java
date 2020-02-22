package com.main.oneflix.ticket.vo;

public class TicketVO {
	Integer ticketId;
	String ticketName;
	int ticketPeriod;
	int ticketPrice;
	char ticketRecommend;
	char ticketStatus;
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
	public char getTicketRecommend() {
		return ticketRecommend;
	}
	public void setTicketRecommend(char ticketRecommend) {
		this.ticketRecommend = ticketRecommend;
	}
	public char getTicketStatus() {
		return ticketStatus;
	}
	public void setTicketStatus(char ticketStatus) {
		this.ticketStatus = ticketStatus;
	}
}

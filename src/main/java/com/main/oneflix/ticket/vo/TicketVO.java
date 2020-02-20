package com.main.oneflix.ticket.vo;

public class TicketVO {
	Integer ticketPeriod;
	int price;
	char recommend;
	char ticketStatus;
	public int getTicketPeriod() {
		return ticketPeriod;
	}
	public void setTicketPeriod(int ticketPeriod) {
		this.ticketPeriod = ticketPeriod;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;

	}
	public char getRecommend() {
		return recommend;
	}
	public void setRecommend(char recommend) {
		this.recommend = recommend;
	}
	public char getTicketStatus() {
		return ticketStatus;
	}
	public void setTicketStatus(char ticketStatus) {
		this.ticketStatus = ticketStatus;
	}
}

package com.main.oneflix.ticket.vo;

public class TicketVO {
	Integer ticketPeriod;
	int Price;
	char recommend;
	char ticketStatus;
	public int getTicketPeriod() {
		return ticketPeriod;
	}
	public void setTicketPeriod(int ticketPeriod) {
		this.ticketPeriod = ticketPeriod;
	}
	public int getPrice() {
		return Price;
	}
	public void setPrice(int price) {
		Price = price;
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

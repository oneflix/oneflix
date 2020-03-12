package com.main.oneflix.sales.vo;

import java.util.Date;

import org.json.simple.JSONObject;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;

@JsonInclude(JsonInclude.Include.NON_NULL)
public class SalesVO {

	// kakaopay request
	private String cid;
//	private String partner_order_id;
//	private String partner_user_id;
	private String item_name;
	private String quantity;
	private String total_amount;
	private String tax_free_amount;
	private String approval_url;
	private String cancel_url;
	private String fail_url;

	// kakaopay ready response
	private String tid;
	private String next_redirect_pc_url;

	// kakaopay success
	private String pg_token;

	// kakaopay approve response
	private String sid;
	private String payment_method_type;
	private JSONObject amount;
	private JSONObject card_info;
	private Date approved_at;

	// kakaopay inactive response
	private String status;
	private Date inactivated_at;

	// sales column
//	private String cid;
//	private String tid;
//	private String sid;
	private int rnum;
	@JsonProperty("partner_order_id")
	private String salesId;
	private String email;
	private Integer ticketId;
	private String ticketName;
	private int ticketPrice;
	private int ticketPeriod;
	private String salesStatus;
	private Date paymentDate;
	private Date expiryDate;
	private String paymentMethodType;
	private String cardName;
	private String startDate;
	private String endDate;
	private String searchSales;
	private int lastDate;

	// 페이징
	private int start;
	private int end;

	public String getCid() {
		return cid;
	}

	public void setCid(String cid) {
		this.cid = cid;
	}

	public String getItem_name() {
		return item_name;
	}

	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}

	public String getQuantity() {
		return quantity;
	}

	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}

	public String getTotal_amount() {
		return total_amount;
	}

	public void setTotal_amount(String total_amount) {
		this.total_amount = total_amount;
	}

	public String getTax_free_amount() {
		return tax_free_amount;
	}

	public void setTax_free_amount(String tax_free_amount) {
		this.tax_free_amount = tax_free_amount;
	}

	public String getApproval_url() {
		return approval_url;
	}

	public void setApproval_url(String approval_url) {
		this.approval_url = approval_url;
	}

	public String getCancel_url() {
		return cancel_url;
	}

	public void setCancel_url(String cancel_url) {
		this.cancel_url = cancel_url;
	}

	public String getFail_url() {
		return fail_url;
	}

	public void setFail_url(String fail_url) {
		this.fail_url = fail_url;
	}

	public String getTid() {
		return tid;
	}

	public void setTid(String tid) {
		this.tid = tid;
	}

	public String getNext_redirect_pc_url() {
		return next_redirect_pc_url;
	}

	public void setNext_redirect_pc_url(String next_redirect_pc_url) {
		this.next_redirect_pc_url = next_redirect_pc_url;
	}

	public String getPg_token() {
		return pg_token;
	}

	public void setPg_token(String pg_token) {
		this.pg_token = pg_token;
	}

	public String getSid() {
		return sid;
	}

	public void setSid(String sid) {
		this.sid = sid;
	}

	public String getPayment_method_type() {
		return payment_method_type;
	}

	public void setPayment_method_type(String payment_method_type) {
		this.payment_method_type = payment_method_type;
	}

	public JSONObject getAmount() {
		return amount;
	}

	public void setAmount(JSONObject amount) {
		this.amount = amount;
	}

	public JSONObject getCard_info() {
		return card_info;
	}

	public void setCard_info(JSONObject card_info) {
		this.card_info = card_info;
	}

	public Date getApproved_at() {
		return approved_at;
	}

	public void setApproved_at(Date approved_at) {
		this.approved_at = approved_at;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getInactivated_at() {
		return inactivated_at;
	}

	public void setInactivated_at(Date inactivated_at) {
		this.inactivated_at = inactivated_at;
	}

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	public String getSalesId() {
		return salesId;
	}

	public void setSalesId(String salesId) {
		this.salesId = salesId;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

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

	public int getTicketPrice() {
		return ticketPrice;
	}

	public void setTicketPrice(int ticketPrice) {
		this.ticketPrice = ticketPrice;
	}

	public int getTicketPeriod() {
		return ticketPeriod;
	}

	public void setTicketPeriod(int ticketPeriod) {
		this.ticketPeriod = ticketPeriod;
	}

	public String getSalesStatus() {
		return salesStatus;
	}

	public void setSalesStatus(String salesStatus) {
		this.salesStatus = salesStatus;
	}

	public Date getPaymentDate() {
		return paymentDate;
	}

	public void setPaymentDate(Date paymentDate) {
		this.paymentDate = paymentDate;
	}

	public Date getExpiryDate() {
		return expiryDate;
	}

	public void setExpiryDate(Date expiryDate) {
		this.expiryDate = expiryDate;
	}

	public String getPaymentMethodType() {
		return paymentMethodType;
	}

	public void setPaymentMethodType(String paymentMethodType) {
		this.paymentMethodType = paymentMethodType;
	}

	public String getCardName() {
		return cardName;
	}

	public void setCardName(String cardName) {
		this.cardName = cardName;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getSearchEmail() {
		return searchSales;
	}

	public void setSearchEmail(String searchEmail) {
		this.searchSales = searchEmail;
	}

	public String getSearchSales() {
		return searchSales;
	}

	public void setSearchSales(String searchSales) {
		this.searchSales = searchSales;
	}

	public int getLastDate() {
		return lastDate;
	}

	public void setLastDate(int lastDate) {
		this.lastDate = lastDate;
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

	@Override
	public String toString() {
		return "SalesVO [cid=" + cid + ", item_name=" + item_name + ", quantity=" + quantity + ", total_amount="
				+ total_amount + ", tax_free_amount=" + tax_free_amount + ", approval_url=" + approval_url
				+ ", cancel_url=" + cancel_url + ", fail_url=" + fail_url + ", tid=" + tid + ", next_redirect_pc_url="
				+ next_redirect_pc_url + ", pg_token=" + pg_token + ", sid=" + sid + ", payment_method_type="
				+ payment_method_type + ", amount=" + amount + ", card_info=" + card_info + ", approved_at="
				+ approved_at + ", status=" + status + ", inactivated_at=" + inactivated_at + ", rnum=" + rnum
				+ ", salesId=" + salesId + ", email=" + email + ", ticketId=" + ticketId + ", ticketName=" + ticketName
				+ ", ticketPrice=" + ticketPrice + ", ticketPeriod=" + ticketPeriod + ", salesStatus=" + salesStatus
				+ ", paymentDate=" + paymentDate + ", expiryDate=" + expiryDate + ", startDate=" + startDate
				+ ", endDate=" + endDate + ", searchSales=" + searchSales + ", lastDate=" + lastDate + ", start="
				+ start + ", end=" + end + ", getCid()=" + getCid() + ", getItem_name()=" + getItem_name()
				+ ", getQuantity()=" + getQuantity() + ", getTotal_amount()=" + getTotal_amount()
				+ ", getTax_free_amount()=" + getTax_free_amount() + ", getApproval_url()=" + getApproval_url()
				+ ", getCancel_url()=" + getCancel_url() + ", getFail_url()=" + getFail_url() + ", getTid()=" + getTid()
				+ ", getNext_redirect_pc_url()=" + getNext_redirect_pc_url() + ", getPg_token()=" + getPg_token()
				+ ", getSid()=" + getSid() + ", getPayment_method_type()=" + getPayment_method_type() + ", getAmount()="
				+ getAmount() + ", getCard_info()=" + getCard_info() + ", getApproved_at()=" + getApproved_at()
				+ ", getStatus()=" + getStatus() + ", getInactivated_at()=" + getInactivated_at() + ", getRnum()="
				+ getRnum() + ", getSalesId()=" + getSalesId() + ", getEmail()=" + getEmail() + ", getTicketId()="
				+ getTicketId() + ", getTicketName()=" + getTicketName() + ", getTicketPrice()=" + getTicketPrice()
				+ ", getTicketPeriod()=" + getTicketPeriod() + ", getSalesStatus()=" + getSalesStatus()
				+ ", getPaymentDate()=" + getPaymentDate() + ", getExpiryDate()=" + getExpiryDate()
				+ ", getStartDate()=" + getStartDate() + ", getEndDate()=" + getEndDate() + ", getSearchEmail()="
				+ getSearchEmail() + ", getSearchSales()=" + getSearchSales() + ", getLastDate()=" + getLastDate()
				+ ", getStart()=" + getStart() + ", getEnd()=" + getEnd() + ", getClass()=" + getClass()
				+ ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}

}

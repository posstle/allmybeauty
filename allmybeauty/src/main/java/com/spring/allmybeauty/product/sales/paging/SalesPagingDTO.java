package com.spring.allmybeauty.product.sales.paging;

import java.sql.Date;

import lombok.Data;

@Data
public class SalesPagingDTO {
	private int pageNum;
	private int rowAmountPerPage;
	private String orderDateType;
	private Date orderDay;
	private String orderMonth;
	private String orderYear;
	private long sales;
	private int orderAmount;
	private Date searchStartDate;
	private Date searchEndDate;
	
	public SalesPagingDTO() {
		this.pageNum = 1;
		this.rowAmountPerPage = 5;
	}
	
	public SalesPagingDTO(int pageNum) {
		if(pageNum<=0) {
			this.pageNum = 1;
		} else {
			this.pageNum = pageNum;
		}
		this.rowAmountPerPage = 5;
	}
	
	public SalesPagingDTO(int pageNum, int rowAmountPerPage) {
		if(pageNum<=0) {
			this.pageNum = pageNum;
		} else {
			this.pageNum = pageNum;
		}
		if(rowAmountPerPage<=0) {
			this.rowAmountPerPage = 5;
		} else {
			this.rowAmountPerPage = rowAmountPerPage;
		}
	}
}

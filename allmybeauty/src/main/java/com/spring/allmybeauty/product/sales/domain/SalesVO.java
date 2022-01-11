package com.spring.allmybeauty.product.sales.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class SalesVO {
	private String orderDateType;
	private Date orderDay;
	private String orderMonth;
	private String orderYear;
	private long sales;
	private int orderAmount;
	private Date searchStartDate;
	private Date searchEndDate;
	
}

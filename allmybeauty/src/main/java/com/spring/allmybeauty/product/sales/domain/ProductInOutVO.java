package com.spring.allmybeauty.product.sales.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class ProductInOutVO {
	private String ioStatus;
	private Date ioDate;
	private long ioAmount;
	private String InOutType;
	private Date searchStartDate;
	private Date searchEndDate;
	private long productId;
}

package com.spring.allmybeauty.product.order.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class OrderDataVO {
	
	private int orderNo;	
	private String mid;		
	private String mName;
	private String mPhone;
	private String orderAddress;		
	private String orderPhone;	
	private String orderName;	
	private String orderRequirement;        
	private int oTotalPrice;		
	private Date orderDate;
	private String oPostalCode;
	private String oAddress;
	private String oDetailAddress;
	private String mPostalCode;
	private String mAddress;
	private String mDetailAddress;
	private String productName;
	private int productId;
	private int amount;
	private long cartId;
	private int orderAmount;
	private int orderPoint;
	private int productStock;
	private int productAmount;
	
}

package com.spring.allmybeauty.mypage.domain;

import java.util.Date;

import lombok.Data;

@Data
public class MyPageOrderListVO {

	private String mid;
	private int orderno;
	private Date orderdate;
	private String productname;
	private String productbrand;
	private int orderamount;
	private int productprice;
	private String OTOTALPRICE; 
	private int productamount;
	private int productid;
	
	
	private String uploadPath;
	private String uuid;
	private String fileName;
	private String repoPath = "C:\\myupload";

}

package com.spring.allmybeauty.mypage.domain;


import com.spring.allmybeauty.product.list.domain.ProductVO;

import lombok.Data;

@Data
public class MyPageThumbVO {

	private int thumbid;
	private String mid;
	private String productid; 
	private String productname;
	private String productprice;
	private String productbrand;
	
	private ProductVO productVO;
	
	private String uploadPath;
	private String uuid;
	private String fileName;
	private String repoPath = "C:\\myupload";
}

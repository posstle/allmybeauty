package com.spring.allmybeauty.mypage.domain;

import java.util.Date;

import lombok.Data;

@Data
public class MyPageQboardVO {

	private String mid;
	private long qno;
	private long qrno;
	private String productname;
	private String productbrand;
	private String qcontent;
	private Date qdate;
	private boolean qanswerno;
	private int productid;
	
	
	private String uploadPath;
	private String uuid;
	private String fileName;
	private String repoPath = "C:\\myupload";
}

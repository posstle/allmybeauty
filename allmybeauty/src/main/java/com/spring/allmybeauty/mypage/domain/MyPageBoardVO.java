package com.spring.allmybeauty.mypage.domain;

import java.util.Date;

import lombok.Data;

@Data
public class MyPageBoardVO {

	private long bno;
	private String mid;
	private String btitle;
	private String bcontent;
	private Date bregdate;
	private int bviewcount;
	private int breplycnt;
	private boolean bdelflag;
	
	private String uploadPath;
	private String uuid;
	private String fileName;
	private String repoPath = "C:\\myupload";
	
}

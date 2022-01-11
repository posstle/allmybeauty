package com.spring.allmybeauty.QnA.notices.domain;

import java.util.Date;
import java.util.List;

import com.spring.allmybeauty.QnA.common.upload.domain.QnAAttachFileVO;

import lombok.Data;

@Data
public class NoticesBoardVO {

	private long rn;
	private long bno;
	private String mid;
	private String btitle;
	private String bcontent;
	private Date bregdate;
	private Date bmoddate;
	private long fileno;
	
	private List<QnAAttachFileVO> attachFileList;
	
}

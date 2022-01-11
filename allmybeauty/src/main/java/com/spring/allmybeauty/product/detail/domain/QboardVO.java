package com.spring.allmybeauty.product.detail.domain;

import java.util.Date;
import java.util.List;

import com.spring.allmybeauty.common.fileupload.domain.AttachfilesVO;

import lombok.Data;

@Data
public class QboardVO {
	private int qno;
	private String productid;
	private String mid;
	private String qcontent;
	private int qanswerno;
	private Date qdate;
	private int qrno;
	
	private List<AttachfilesVO> attachFileList;
}

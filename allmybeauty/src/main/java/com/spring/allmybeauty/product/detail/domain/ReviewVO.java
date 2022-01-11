package com.spring.allmybeauty.product.detail.domain;

import java.util.Date;
import java.util.List;

import com.spring.allmybeauty.common.fileupload.domain.AttachfilesVO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReviewVO {
	
	private long rno;
	private long productid;
	private String mid;
	private String rcontent;
	private String rfilename;
	private Date rdate;
	private int prno;
//	private String fileurl;
	private String mskinType;
	private List<AttachfilesVO> fileurl;
}

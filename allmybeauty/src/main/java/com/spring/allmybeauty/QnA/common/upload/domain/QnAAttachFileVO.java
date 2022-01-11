package com.spring.allmybeauty.QnA.common.upload.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class QnAAttachFileVO {
	
	private String uuid;
	private String uploadpath;
	private String filename;
	private String boardtype;
	private long nbno;
	private long cbno;
	private String repopath = "C:\\\\myupload\\QNA";

}

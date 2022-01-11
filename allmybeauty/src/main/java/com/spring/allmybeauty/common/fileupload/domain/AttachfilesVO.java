package com.spring.allmybeauty.common.fileupload.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AttachfilesVO {
	private String uuid;
	private String uploadpath;
	private String filename;
	private long productid;
	private long rno;
	
	private String repoPath = "C:\\myupload";
}

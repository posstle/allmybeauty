package com.spring.allmybeauty.product.list.domain;

import com.spring.allmybeauty.common.fileupload.domain.AttachfilesVO;

import lombok.Data;

@Data
public class ProductAttachfileMapVO {
	private ProductVO productVO;
	private AttachfilesVO attachfilesVO;

}

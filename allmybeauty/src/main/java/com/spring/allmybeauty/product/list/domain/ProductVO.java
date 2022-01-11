package com.spring.allmybeauty.product.list.domain;

import java.util.List;

import com.spring.allmybeauty.common.fileupload.domain.AttachfilesVO;
import com.spring.allmybeauty.product.register.domain.ProdCompMapVO;

import lombok.Data;

@Data
public class ProductVO {
	private long productId;
	private String productName;
	private int productPrice;
	private String productCategory;
	private String productSubCategory;
	private String productBrand;
	private String productDesc;
	private int productStock;
	private int productThumb;
	private int skintypeid;
	private int thumbflag;
	
	private List<AttachfilesVO> attachFileList;
	private List<ProdCompMapVO> compList;
}

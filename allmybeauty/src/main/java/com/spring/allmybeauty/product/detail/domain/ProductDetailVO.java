package com.spring.allmybeauty.product.detail.domain;

import lombok.Data;

@Data
public class ProductDetailVO {
	private int productid;
	private String productname;
	private int productprice;
	private String productcategory;
	private String productsubcategory;
	private String productdesc;
	private String productbrand;
	private int productstock;
	private int productthumb;
	private String comname;

}

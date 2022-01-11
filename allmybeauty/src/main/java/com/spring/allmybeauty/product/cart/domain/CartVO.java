package com.spring.allmybeauty.product.cart.domain;

import lombok.Data;

@Data
public class CartVO {
	
	private long cartId;		//장바구니아이디
	private String mid;			//주문자아이디
	private String mName;		//주문자이름
	private int productId;	//상품아이디
	private String productName;	//상품이름
	private String productBrand; //제조회사
	private int productPrice;   //가격       
	private int cartAmount;		//수량
	private int productPriceSum;//productPrice와 cartAmount 를 곱한값
	private int totalPrice;		//주문 총가격
	private int rownum;		//장바구니 상품 갯수
	private int cartCheck;	//장바구니 체크 유무
	private String uploadPath;
	private String uuid;
	private String fileName;
	private String repoPath = "C:\\myupload";
	private int productAmount;
	
}

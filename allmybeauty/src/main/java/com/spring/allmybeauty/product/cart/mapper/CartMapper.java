package com.spring.allmybeauty.product.cart.mapper;

import java.util.List;

import com.spring.allmybeauty.product.cart.domain.CartVO;
import com.spring.allmybeauty.product.list.domain.ProductVO;

public interface CartMapper {
	
	//장바구니 조회
	public List<CartVO> selcetCartList(String mid);
	
	//장바구니 개별 삭제
	public void deleteCart(long cartId);
	
	//장바구니 담기
	public int insertCart(CartVO cartVO);
	
	//장바구니 비우기
	public void deleteCartAll(String mid);
	
	//장바구니 금액 합계
	public int totalPrice(String mid);
	
	//장바구니 수량 증가
	public int cartAmountPlus(CartVO cartVO);
	
	//장바구니 수량 1 감소
	public void cartAmountMinus(String cartId);
	
	//장바구니 체크
	public void cartCheck(long cartId);
	
	//장바구니 체크안함
	public void cartUnCheck(long cartId);
	
	//좋아요 조회
	public List<ProductVO> thumbList(String mid);
		
	//thumbflag 조회
	public int thumbflag(CartVO cartVO);
	
	//카트에 이미 상품이 있는지 확인
	public Integer selectExistCart(CartVO cartVO);
	
}

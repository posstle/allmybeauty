package com.spring.allmybeauty.product.cart.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.allmybeauty.product.cart.domain.CartVO;
import com.spring.allmybeauty.product.cart.mapper.CartMapper;
import com.spring.allmybeauty.product.list.domain.ProductVO;
import com.spring.allmybeauty.product.order.domain.OrderDataVO;
import com.spring.allmybeauty.product.order.mapper.OrderDataMapper;

import lombok.AllArgsConstructor;

//@Log4j
@Service
@AllArgsConstructor
public class CartServiceImpl implements CartService {

	private CartMapper cartMapper;
	private OrderDataMapper orderDataMapper;
	
	//장바구니 조회
	@Override
	public List<CartVO> selcetCartList(String mid) {
		return cartMapper.selcetCartList(mid);
	}
	
	//장바구니 담기
	@Override
	public int addtoCart(CartVO cartVO) {
		Integer ExistProduct = cartMapper.selectExistCart(cartVO);
		int result;
		
		if(ExistProduct==null || ExistProduct==0) {
			result=cartMapper.insertCart(cartVO);
		} else {
			cartVO.setCartId(ExistProduct);
			result=cartMapper.cartAmountPlus(cartVO);
		}
		return result;
	}
	
	//주문자 데이터 조회
	@Override
	public OrderDataVO orderData(String mid) {
		return orderDataMapper.orderData(mid);
	}
	
	//개별 상품 제거
	@Override
	public void deleteCart(long cartId) {
		//log.info("CartService.deleteCart 실행");
		cartMapper.deleteCart(cartId);
	}
	
	//장바구니 비우기
	@Override
	public void deleteCartAll(String mid) {		
		cartMapper.deleteCartAll(mid);
	}
	
	//총 가격
	@Override
	public int totalPrice(String mid) {
		return cartMapper.totalPrice(mid);
	}
	
	//상품 수량 1개 증가
	@Override
	public void cartAmountPlus(CartVO cartVO) {
		cartMapper.cartAmountPlus(cartVO);
	}
	
	//상품 수량 1개 감소
	@Override
	public void cartAmountMinus(String cartId) {
		cartMapper.cartAmountMinus(cartId);
	}
	
	//장바구니 체크된 물품
	@Override
	public void cartCheck(long cartId) {
		cartMapper.cartCheck(cartId);
	}
	
	//장바구니 체크안된 물품
	@Override
	public void cartUnCheck(long cartId) {
		cartMapper.cartUnCheck(cartId);
	}
	
	@Override
	public List<ProductVO> thumbList(String mid) {
		return cartMapper.thumbList(mid);
	}

	@Override
	public int thumbflag(CartVO cartVO) {
		return cartMapper.thumbflag(cartVO);
	}

}

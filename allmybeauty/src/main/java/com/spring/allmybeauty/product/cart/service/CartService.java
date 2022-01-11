package com.spring.allmybeauty.product.cart.service;

import java.util.List;

import com.spring.allmybeauty.product.cart.domain.CartVO;
import com.spring.allmybeauty.product.list.domain.ProductVO;
import com.spring.allmybeauty.product.order.domain.OrderDataVO;

public interface CartService {
	
	public List<CartVO> selcetCartList(String mid);
	
	public int addtoCart(CartVO cartVO);
	
	public void deleteCart(long cartId);
	
	public void deleteCartAll(String mid);
	
	public int totalPrice(String mid);
	
	public void cartAmountPlus(CartVO cartVO);
	
	public void cartAmountMinus(String cartId);
	
	public void cartCheck(long cartId);
	
	public void cartUnCheck(long cartId);
	
	public OrderDataVO orderData(String mid);
	
	public List<ProductVO> thumbList(String mid);
	
	public int thumbflag(CartVO cartVO);
	
}

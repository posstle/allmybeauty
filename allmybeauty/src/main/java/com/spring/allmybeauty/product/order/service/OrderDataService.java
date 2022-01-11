package com.spring.allmybeauty.product.order.service;

import java.util.List;

import com.spring.allmybeauty.product.cart.domain.CartVO;
import com.spring.allmybeauty.product.cart.domain.OrderVO;
import com.spring.allmybeauty.product.order.domain.KakaoPayApprovalVO;
import com.spring.allmybeauty.product.order.domain.KakaoPayReadyVO;
import com.spring.allmybeauty.product.order.domain.OrderDataVO;

public interface OrderDataService {
	
	public OrderDataVO orderData(String mid);
	
	public void orderDataInsert(OrderDataVO orderDataVO); 
	
	public void orderDetailInsert(CartVO orderDetail);
	
	public List<CartVO> selcetCartCheckList(String mid);

	public int checkTotalPrice (String mid);
	
	public List<OrderDataVO> orderDataList (String mid);
	
	public KakaoPayReadyVO kakaoPayReady(OrderDataVO orderDataVO);
	
	public KakaoPayApprovalVO kakaoPayInfo(String pg_token, String mid);
	
	public void orderDelete(String mid);
	
	public OrderVO selectOrder(CartVO cartVO);
	
	public void productStockMinus(OrderDataVO orderDataVO);
	
	public void productOut (OrderDataVO orderDataVO);
	
	public List<OrderDataVO> selectOrderDetail(String mid);
	
	public void pointPlus(OrderDataVO orderDataVO);
	
	public void pointMinus(OrderDataVO orderDataVO);
	
	public OrderDataVO selectOrderData(String mid);

	public int selectPoint(String mid);
	
	public int selectStock(int productId);
	
}

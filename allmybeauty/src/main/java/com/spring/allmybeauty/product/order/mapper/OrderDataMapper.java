package com.spring.allmybeauty.product.order.mapper;


import java.util.List;

import com.spring.allmybeauty.product.cart.domain.CartVO;
import com.spring.allmybeauty.product.cart.domain.OrderVO;
import com.spring.allmybeauty.product.order.domain.OrderDataVO;

public interface OrderDataMapper {
	
	//주문자데이터 조회
	public OrderDataVO orderData(String mid); 
	
	//체크된상품 목록 조회
    public List<CartVO> selcetCartCheckList(String mid);
    
    //체크된상품 총 가격
    public int checkTotalPrice(String mid);
	
	//주문정보 입력
	public void orderDataInsert(OrderDataVO orderDataVO);
	
	//주문상품 상세입력
	public void orderDetailInsert(CartVO orderDetail);
	
	//주문상품 조회
	public List<OrderDataVO> orderDataList(String mid);
	
	//최신주문번호
	public int orderno();
	
	//내 최신주문번호
	public int myOrderno(String mid);
	
	//주문상품갯수
	public int count(String mid);
	
	//주문 취소/실패시 주문데이터 삭제
	public void orderDelete(String mid);
	
	//바로주문 /디테일->주문
	public OrderVO selectOrder(CartVO cartVO);
	
	//결제 성공시 재고 감소
	public void productStockMinus(OrderDataVO orderDataVO);
	
	//결제 성공시 출고
	public void productOut (OrderDataVO orderDataVO);
	
	//주문상품 상세조회
	public List<OrderDataVO> selectOrderDetail(String mid);
	
	//주문성공시 포인트 적립
	public void pointPlus(OrderDataVO orderDataVO);
	
	//포인트사용 주문시 포인트 차감
	public void pointMinus(OrderDataVO orderDataVO);
	
	//주문정보 개별조회
	public OrderDataVO selectOrderData(String mid);
	
	//포인트 조회
	public int selectPoint(String mid); 
	
	//재고 조회
	public int selectStock(int productId);
}

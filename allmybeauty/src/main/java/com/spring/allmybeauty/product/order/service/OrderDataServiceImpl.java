package com.spring.allmybeauty.product.order.service;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.List;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import com.spring.allmybeauty.product.cart.domain.CartVO;
import com.spring.allmybeauty.product.cart.domain.OrderVO;
import com.spring.allmybeauty.product.order.domain.KakaoPayApprovalVO;
import com.spring.allmybeauty.product.order.domain.KakaoPayReadyVO;
import com.spring.allmybeauty.product.order.domain.OrderDataVO;
import com.spring.allmybeauty.product.order.mapper.OrderDataMapper;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class OrderDataServiceImpl implements OrderDataService{
	
	private static final String HOST = "https://kapi.kakao.com";

	private OrderDataMapper orderDataMapper;
	
	public OrderDataServiceImpl(OrderDataMapper orderDataMapper) {
		
		this.orderDataMapper = orderDataMapper;
	}
	
	private KakaoPayReadyVO kakaoPayReadyVO; 
	private KakaoPayApprovalVO kakaoPayApprovalVO; 

	//주문자 데이터 조회
	@Override
	public OrderDataVO orderData(String mid) {
		return orderDataMapper.orderData(mid);
	}
	
	//체크된상품 조회
	@Override
	public List<CartVO> selcetCartCheckList(String mid) {
		return orderDataMapper.selcetCartCheckList(mid);
	}

	//체크된상품 총 가격
	@Override
	public int checkTotalPrice(String mid) {
		return orderDataMapper.checkTotalPrice(mid);
	}
	
	//주문자 정보입력
	@Override
	public void orderDataInsert(OrderDataVO orderDataVO) {
		orderDataMapper.orderDataInsert(orderDataVO);
	}

	//주문상품상세입력
	@Override
	public void orderDetailInsert(CartVO orderDetail) {
		orderDataMapper.orderDetailInsert(orderDetail);
	}
	
	//주문데이터조회
	@Override
	public List<OrderDataVO> orderDataList(String mid) {
		return orderDataMapper.orderDataList(mid);
	}
	
	//주문 취소/실패시 주문데이터 삭제
	@Override
	public void orderDelete(String mid) {
		orderDataMapper.orderDelete(mid);
	}
	
	//카카오페이 결제 준비
	@Override
	public KakaoPayReadyVO kakaoPayReady(OrderDataVO orderDataVO) {
		
		RestTemplate restTemplate = new RestTemplate();
		String mid = orderDataVO.getMid();
		
	    orderDataMapper.orderDataInsert(orderDataVO);  
	    log.info("orderDataVO: " + orderDataVO);
	    if(orderDataVO.getCartId()==0) {
	    	int productId = orderDataVO.getProductId();
		    int amount = orderDataVO.getAmount();
		    CartVO orderDetail = new CartVO();
		    
		    orderDetail.setProductAmount(1);
		    orderDetail.setProductId(productId);
	      	orderDetail.setCartAmount(amount);
	      	orderDetail.setMid(mid);	
	     	orderDataMapper.orderDetailInsert(orderDetail);
	    }else if(orderDataVO.getCartId()!=0){
	    	List<CartVO> cartVO =orderDataMapper.selcetCartCheckList(mid);
	 	   
		    for(int i=0; cartVO.size() > i; i++) {
		    	int productId = cartVO.get(i).getProductId();
		      	int cartAmount = cartVO.get(i).getCartAmount();
	
		      	CartVO orderDetail = new CartVO();
		      			
		      	orderDetail.setProductId(productId);
		      	orderDetail.setCartAmount(cartAmount);
		      	orderDetail.setMid(mid);	
		      	orderDetail.setProductAmount(cartVO.size());
		      	orderDataMapper.orderDetailInsert(orderDetail);
		    }
	    }    
	    
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization","KakaoAK "+"f4f6a8f339adb795bb893c708da4cb45");
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
        
        MultiValueMap<String, String> paymentData = new LinkedMultiValueMap<String, String>();
        paymentData.add("cid", "TC0ONETIME");
        paymentData.add("partner_order_id", Integer.toString(orderDataMapper.orderno()));
        paymentData.add("partner_user_id", mid);   
        
        if(orderDataMapper.count(mid) == 1 ) {
        	paymentData.add("item_name", orderDataMapper.orderDataList(mid).get(0).getProductName());
        }
        paymentData.add("item_name", orderDataMapper.orderDataList(mid).get(0).getProductName() + " 외 " + Integer.toString(orderDataMapper.count(mid)-1)+ "개");    
        paymentData.add("quantity", Integer.toString(orderDataMapper.count(mid)));
        paymentData.add("tax_free_amount", "100");
        paymentData.add("total_amount", Integer.toString(orderDataMapper.orderDataList(mid).get(0).getOTotalPrice()));
        paymentData.add("approval_url", "http://localhost:8080/allmybeauty/order/kakaopaysuccess?mid=" + mid);
        paymentData.add("cancel_url", "http://localhost:8080/allmybeauty/order/kakaopaycancel");
        paymentData.add("fail_url", "http://localhost:8080/allmybeauty/order/kakaopayFail?mid=" + mid);
        
        
        HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(paymentData, headers);     
        
        try {
            kakaoPayReadyVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/ready"),body, KakaoPayReadyVO.class);
            return kakaoPayReadyVO; 
 
        } catch (RestClientException e) {
            e.printStackTrace();
        } catch (URISyntaxException e) {
            e.printStackTrace();
        }     
        return null;
	}
	
	//카카오페이 승인
	@Override
	public KakaoPayApprovalVO kakaoPayInfo(String pg_token, String mid) {
     
        RestTemplate restTemplate = new RestTemplate();
 
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization","KakaoAK "+"f4f6a8f339adb795bb893c708da4cb45");
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");

        MultiValueMap<String, String> paymentData = new LinkedMultiValueMap<String, String>();
        paymentData.add("cid", "TC0ONETIME");
        paymentData.add("tid", kakaoPayReadyVO.getTid());
        paymentData.add("partner_order_id",Integer.toString(orderDataMapper.myOrderno(mid)));    
        paymentData.add("partner_user_id", mid);
        paymentData.add("pg_token", pg_token);   
        paymentData.add("total_amount", Integer.toString(orderDataMapper.orderDataList(mid).get(0).getOTotalPrice()));   
                 
        HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(paymentData, headers);
        
        try {
            kakaoPayApprovalVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/approve"), body, KakaoPayApprovalVO.class);
          
            return kakaoPayApprovalVO;
        
        } catch (RestClientException e) {
            e.printStackTrace();
        } catch (URISyntaxException e) {
            e.printStackTrace();
        }
        
        return null;
	}
	
	//바로주문 /디테일->주문
	@Override
	public OrderVO selectOrder(CartVO cartVO) {
		return orderDataMapper.selectOrder(cartVO);
	}
	
	//결제 성공시 재고 감소
	@Override
	public void productStockMinus(OrderDataVO orderDataVO) {
		orderDataMapper.productStockMinus(orderDataVO);
	}
	
	//결제 성공시 출고
	@Override
	public void productOut(OrderDataVO orderDataVO) {
		orderDataMapper.productOut(orderDataVO);
	}
	
	//주문데이터 상세조회
	@Override
	public List<OrderDataVO> selectOrderDetail(String mid) {
		return orderDataMapper.selectOrderDetail(mid);
	}
	
	//주문성공시 포인트 적립
	@Override
	public void pointPlus(OrderDataVO orderDataVO) {
		orderDataMapper.pointPlus(orderDataVO);
	}
	
	//포인트사용 주문시 포인트 차감
	@Override
	public void pointMinus(OrderDataVO orderDataVO) {
		orderDataMapper.pointMinus(orderDataVO);
	}
	
	//주문정보 개별조회
	@Override
	public OrderDataVO selectOrderData(String mid) {
		return orderDataMapper.selectOrderData(mid);
	}

	@Override
	public int selectPoint(String mid) {
		return orderDataMapper.selectPoint(mid);
	}

	@Override
	public int selectStock(int productId) {
		return orderDataMapper.selectStock(productId);
	}

}

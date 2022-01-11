package com.spring.allmybeauty.product.order.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.allmybeauty.product.cart.domain.CartVO;
import com.spring.allmybeauty.product.order.domain.KakaoPayReadyVO;
import com.spring.allmybeauty.product.order.domain.OrderDataVO;
import com.spring.allmybeauty.product.order.service.OrderDataService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/order")
public class OrderDataController {
	
	@Setter(onMethod_ = @Autowired)
	private OrderDataService orderDataService;
	
	//주문자 정보,주문 정보 조회 / 장바구니->주문하기
	@PostMapping("/payment")
	public void  payment (Model model, @RequestParam("mid") String mid) {
		model.addAttribute("cartCheckList", orderDataService.selcetCartCheckList(mid));	
		model.addAttribute("oTotalPrice", orderDataService.checkTotalPrice(mid));
		model.addAttribute("mid", mid);			
		model.addAttribute("orderData", orderDataService.orderData(mid));
		model.addAttribute("point", orderDataService.selectPoint(mid));
	}
	
	//주문자 정보,주문 정보 조회 / 상품디테일->주문하기
	@PostMapping("/order")
	public String dpayment (Model model, CartVO cartVO)  {
		model.addAttribute("point", orderDataService.selectPoint(cartVO.getMid()));
		model.addAttribute("mid", cartVO.getMid());	
		model.addAttribute("amount", cartVO.getCartAmount());
		model.addAttribute("orderData", orderDataService.selectOrder(cartVO));
		return "/order/payment";
	}
	
	//카카오페이 준비
	@PostMapping("/kakaopay")
	@ResponseBody
    public KakaoPayReadyVO kakaoPay(OrderDataVO orderDataVO) {
		return orderDataService.kakaoPayReady(orderDataVO);
    }
	
	//결제성공
    @GetMapping("/kakaopaysuccess")
    public void kakaoPaySuccess(@RequestParam("pg_token") String pg_token, Model model,String mid) { 	
    	model.addAttribute("pg_token", pg_token);
    	model.addAttribute("mid", mid);
    }
    
    //결제성공페이지
    @GetMapping("/completepayment")
    public void completepayment(Model model,String pg_token, String mid) { 	
    	List<OrderDataVO> orderDataVO = orderDataService.selectOrderDetail(mid);
    	
    	for(int i=0; i < orderDataVO.size(); i++ ) {
    		orderDataService.productStockMinus(orderDataVO.get(i));
        	orderDataService.productOut(orderDataVO.get(i));
    	}   	
    	
    	OrderDataVO orderData = orderDataService.selectOrderData(mid);
    	
    	if(orderData.getOrderPoint()==0) {
    		orderDataService.pointPlus(orderData);
    	}else if(orderData.getOrderPoint() > 0){
    		orderDataService.pointMinus(orderData);
    		orderDataService.pointPlus(orderData);
    	}
    	
    	model.addAttribute("info", orderDataService.kakaoPayInfo(pg_token, mid)); 
    	model.addAttribute("orderData", orderDataService.orderDataList(mid));	
    }
    
    //결제취소
    @GetMapping("/kakaopaycancel")
    public void kakaoPayCancel() {
    }
    
    //결제실패
    @GetMapping("/kakaopayfail")
    public void kakaoPaySuccessFail(String mid) {
    	orderDataService.orderDelete(mid);
    }
    
    //재고 조회
    @ResponseBody
    @PostMapping("/selectStock")
    public boolean selectStock(OrderDataVO orderDataVO) {
    	String mid = orderDataVO.getMid();
    	
    	if(orderDataVO.getCartId()==0) {
    		int amount = orderDataVO.getAmount();
    		int productStock =orderDataService.selectStock(orderDataVO.getProductId());
    		
    		if (amount > productStock) {
    			log.info("재고부족");
    			return false;
    		}
	    }else if(orderDataVO.getCartId()!=0){
	    	List<CartVO> cartVO =orderDataService.selcetCartCheckList(mid);
	 	   
		    for(int i=0; cartVO.size() > i; i++) {
		    	int amount = cartVO.get(i).getCartAmount();
		    	int productStock =orderDataService.selectStock(cartVO.get(i).getProductId());		    	
		    	
		    	if (amount > productStock) {
		    		log.info(cartVO.get(i).getProductName() + " 재고부족");
		    		return false;
		    	}
		    }
	    }	
    	return true;
    }
}

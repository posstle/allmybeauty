package com.spring.allmybeauty.product.cart.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.allmybeauty.product.cart.domain.CartVO;
import com.spring.allmybeauty.product.cart.service.CartService;

import lombok.Setter;

//@Log4j
@Controller
@RequestMapping("/cart")
public class CartController {
	
	@Setter(onMethod_ = @Autowired)
	private CartService cartService ;
	
	//장바구니 리스트 조회
	@GetMapping("/cartlist")
	public void showCartList(Model model, String mid) {
		model.addAttribute("thumbList", cartService.thumbList(mid));
		model.addAttribute("cartList", cartService.selcetCartList(mid));
		model.addAttribute("cartListSize", cartService.selcetCartList(mid).size());
		model.addAttribute("totalPrice", cartService.totalPrice(mid));
	}
	
	//장바구니 담기
	@ResponseBody
	@GetMapping("/inserttocart")
	public boolean addtoCart(CartVO cartVO) {
		return cartService.addtoCart(cartVO)==1;
	}
	
	//장바구니 개별삭제
	@ResponseBody
	@PostMapping("/cartdelete")
	public void deleteCart(long cartId) {
		cartService.deleteCart(cartId);
	}
	
	//장바구니 전체 비우기
	@PostMapping("/cartdeleteall")
	public String deleteCartAll(@RequestParam("mid") String mid) {
		cartService.deleteCartAll(mid);
		return "redirect:/cart/cartlist?mid="+mid;
	}
	
	//총 금액
	@PostMapping("/carttotalprice")
	public void cartTotalPrice (Model model,String mid) {
		model.addAttribute("realTotalPrice", cartService.totalPrice(mid));
	}
	
	//장바구니 수량 1 증가
	@ResponseBody
	@PostMapping("/cartamountplus")
	public void cartAmountPlus (CartVO cartVO) {
		cartService.cartAmountPlus(cartVO);
	}
	
	//장바구니 수량 1 감소
	@ResponseBody
	@PostMapping("/cartamountminus")
	public void cartAmountMinus (String cartId) {
		cartService.cartAmountMinus(cartId);
	}
	
	//상품 체크확인 -> check
	@ResponseBody
	@PostMapping("/cartcheck")
	public void cartCheck (long cartId) {
		cartService.cartCheck(cartId);
	}
	
	//상품 체크확인 -> uncheck
	@ResponseBody
	@PostMapping("/cartuncheck")
	public void cartUnCheck (long cartId) {
		cartService.cartUnCheck(cartId);
	}
	
	//좋아요 조회
	@ResponseBody
	@PostMapping("/thumbflag")
	public String thumbflag(CartVO cartVO) {
		return Integer.toString(cartService.thumbflag(cartVO));
	}
	
}

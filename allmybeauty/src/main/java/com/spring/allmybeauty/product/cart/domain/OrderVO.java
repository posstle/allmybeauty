package com.spring.allmybeauty.product.cart.domain;

import com.spring.allmybeauty.product.order.domain.OrderDataVO;

import lombok.Data;

@Data
public class OrderVO {
	private OrderDataVO orderDataVO;
	private CartVO cartVO;
}

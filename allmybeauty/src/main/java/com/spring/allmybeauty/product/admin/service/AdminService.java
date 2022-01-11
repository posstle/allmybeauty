package com.spring.allmybeauty.product.admin.service;

import java.util.List;

import com.spring.allmybeauty.product.sales.domain.ProductInOutVO;

public interface AdminService {
	
	public long selectTodayOrderCount();
	
	public long selectTodayOrderIn();
	
	public long selectTodayOrderOut();
	
	public long selectTodayTotalPrice();
	
	public List<ProductInOutVO> ProductInOutHistoryToday(long productId);
	
	public List<ProductInOutVO> ProductInOutHistory(ProductInOutVO productInOut);

}

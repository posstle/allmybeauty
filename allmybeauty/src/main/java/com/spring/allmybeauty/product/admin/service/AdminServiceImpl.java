package com.spring.allmybeauty.product.admin.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.allmybeauty.product.sales.domain.ProductInOutVO;
import com.spring.allmybeauty.product.sales.mapper.SalesMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class AdminServiceImpl implements AdminService{
	
	private  SalesMapper salesMapper;
	
	public long selectTodayOrderCount() {
		
		return salesMapper.selectTodayOrderCount();
	};
	
	public long selectTodayOrderIn() {
			
		return salesMapper.selectTodayOrderIn();
	};
	
	public long selectTodayOrderOut() {
		
		return salesMapper.selectTodayOrderOut();
	};
	
	public long selectTodayTotalPrice() {
		
		return salesMapper.selectTodayTotalPrice();
	};
	
	public List<ProductInOutVO> ProductInOutHistoryToday(long productId){
		return salesMapper.ProductInOutHistoryToday(productId);
	}
	
	public List<ProductInOutVO> ProductInOutHistory(ProductInOutVO productInOut){
		return salesMapper.ProductInOutHistory(productInOut);
	}


	
}

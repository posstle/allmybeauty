package com.spring.allmybeauty.product.sales.mapper;

import java.util.List;

import com.spring.allmybeauty.product.sales.domain.ProductInOutVO;
import com.spring.allmybeauty.product.sales.domain.SalesVO;

public interface SalesMapper {
	
	public List<SalesVO> selectDayList(SalesVO salesVO);
	
	public List<SalesVO> selectMonthList(SalesVO salesVO);
	
	public List<SalesVO> selectYearList(SalesVO salesVO);
	
	public List<ProductInOutVO> ProductInOutHistoryToday(long productId);
	
	public List<ProductInOutVO> ProductInOutHistory(ProductInOutVO productInOut);
	
	public long selectTodayOrderCount();
	
	public long selectTodayOrderIn();
	
	public long selectTodayOrderOut();
	
	public long selectTodayTotalPrice();
	
	
	
}

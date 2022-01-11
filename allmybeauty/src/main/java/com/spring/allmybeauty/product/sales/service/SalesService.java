package com.spring.allmybeauty.product.sales.service;

import java.util.List;

import com.spring.allmybeauty.product.sales.domain.SalesVO;

public interface SalesService {
	
	public List<SalesVO> selectDayList(SalesVO salesVO);
	
	public List<SalesVO> selectMonthList(SalesVO salesVO);
	
	public List<SalesVO> selectYearList(SalesVO salesVO);

}

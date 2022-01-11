package com.spring.allmybeauty.product.sales.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.allmybeauty.product.sales.domain.SalesVO;
import com.spring.allmybeauty.product.sales.mapper.SalesMapper;

import lombok.AllArgsConstructor;

//@Log4j
@Service
@AllArgsConstructor
public class SalesServiceImpl implements SalesService{
	private SalesMapper salesMapper;

	@Override
	public List<SalesVO> selectDayList(SalesVO salesVO) {
		return salesMapper.selectDayList(salesVO);
	}

	@Override
	public List<SalesVO> selectMonthList(SalesVO salesVO) {
		return salesMapper.selectMonthList(salesVO);
	}

	@Override
	public List<SalesVO> selectYearList(SalesVO salesVO) {
		return salesMapper.selectYearList(salesVO);
	}
	
	
}

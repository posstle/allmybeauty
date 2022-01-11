package com.spring.allmybeauty.product.sales.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.allmybeauty.product.sales.domain.SalesVO;
import com.spring.allmybeauty.product.sales.service.SalesService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/sales")
public class SalesController {
	
	@Setter(onMethod_ = @Autowired)
	private SalesService salesService ;
	
	@GetMapping("/sales")
	public void showSalesPage() {
	} 
	
	@PostMapping("/sales")
	public void selectSalesPage(Model model ,SalesVO salesVO) {
		if(salesVO.getOrderDateType().equals("day")) {
			model.addAttribute("day", salesService.selectDayList(salesVO));
		}else if (salesVO.getOrderDateType().equals("month")) {
			log.info("month: "+salesService.selectMonthList(salesVO));
			model.addAttribute("month", salesService.selectMonthList(salesVO));
		}else if (salesVO.getOrderDateType().equals("year")) {
			model.addAttribute("year", salesService.selectYearList(salesVO));
		}	
		model.addAttribute("daySize", salesService.selectDayList(salesVO).size());
		model.addAttribute("monthSize", salesService.selectMonthList(salesVO).size());
		model.addAttribute("yearSize", salesService.selectYearList(salesVO).size());
		log.info("daySize: " + salesService.selectDayList(salesVO).size());
		log.info("monthSize: " + salesService.selectMonthList(salesVO).size());
		log.info("yearSize: " + salesService.selectYearList(salesVO).size());
	} 

}

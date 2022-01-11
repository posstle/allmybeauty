package com.spring.allmybeauty.product.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.allmybeauty.product.admin.service.AdminService;
import com.spring.allmybeauty.product.sales.domain.ProductInOutVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/admin")
@Log4j
public class AdminController {
	
	@Setter(onMethod_=@Autowired)
	private AdminService adminService;
	
	@GetMapping("/main")
	public void showProductList(Model model) {
		model.addAttribute("todayOrderCount", adminService.selectTodayOrderCount());
		model.addAttribute("todayOrderInCount", adminService.selectTodayOrderIn());
		model.addAttribute("todayOrderOutCount", adminService.selectTodayOrderOut());
		model.addAttribute("todaySalesTotalPrice", adminService.selectTodayTotalPrice());
	}
	
	@GetMapping("/productInOutHistory")
	public void showProductInOutHistory(Model model, long productId) {
		model.addAttribute("productHistory", adminService.ProductInOutHistoryToday(productId));
		log.info(adminService.ProductInOutHistoryToday(productId));
	}
	
	@PostMapping("/productInOutHistory")
	public void showProductInOutHistory(Model model, ProductInOutVO productInOut) {
		model.addAttribute("productHistory", adminService.ProductInOutHistory(productInOut));
		log.info(adminService.ProductInOutHistory(productInOut));
	}

}

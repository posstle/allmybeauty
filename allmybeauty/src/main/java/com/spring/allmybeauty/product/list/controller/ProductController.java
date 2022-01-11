package com.spring.allmybeauty.product.list.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.allmybeauty.common.fileupload.domain.AttachfilesVO;
import com.spring.allmybeauty.common.paging.ProductPagingCreatorDTO;
import com.spring.allmybeauty.common.paging.ProductPagingDTO;
import com.spring.allmybeauty.product.list.domain.ProductVO;
import com.spring.allmybeauty.product.list.domain.ThumbVO;
import com.spring.allmybeauty.product.list.service.ProductService;
import com.spring.allmybeauty.product.register.domain.ComponentVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/product")
public class ProductController {
	
	@Setter(onMethod_ = @Autowired)
	private ProductService productService;
	
	@GetMapping("/productList")
	public void showProductList(Model model, ProductPagingDTO productPaging) {
		
		model.addAttribute("productList", productService.getProductList(productPaging));
		
		long rowAmountTotal=productService.getRowAmountTotal(productPaging);
		ProductPagingCreatorDTO productPagingCreatorDTO=new ProductPagingCreatorDTO(rowAmountTotal, productPaging);
		model.addAttribute("pagingCreator", productPagingCreatorDTO);
			
	}
	
	@ResponseBody
	@GetMapping("/plusThumb")
	public int plusThumbCount(ThumbVO thumb, Model model) {
		log.info("컨트롤러에 진입 - 추가된 추천 수 : " + thumb);
		
		return productService.plusThumbCount(thumb);
	}
	
	@ResponseBody
	@GetMapping("/minusThumb")
	public int minusThumbCount(ThumbVO thumb, Model model) {
		log.info("컨트롤러에 진입 - 추가된 추천 수 : " + thumb);
		
		return productService.minusThumbCount(thumb);
	}
	
	//첨부파일 목록 수집
	@GetMapping(value="/getFilesForModify", produces = {"application/json;charset=UTF-8"})
	@ResponseBody
	public ResponseEntity<List<AttachfilesVO>> showAttachFilesForModify(long productId) {
		
		return new ResponseEntity<List<AttachfilesVO>>(productService.getAttachFilesByProductId(productId), HttpStatus.OK);
	}
	
	//등록페이지 호출
	@GetMapping("/addproduct")
	public void addProduct() {
	}
	
	//등록 처리
	@PostMapping("/addproduct")
	public String addProductProcess(Model model, ProductVO product) {
		
		productService.insertProduct(product);
		
		return "redirect:/product/productList";
	}
	
	//수정페이지 호출
	@GetMapping("/modifyProduct")
	public void modifyProduct(Model model, int productId) {
		model.addAttribute("componentList", productService.getComponentListForModify(productId));
		model.addAttribute("productInfo", productService.getProductInfoForModify(productId));
	}
	
	//수정페이지 - 수정버튼 처리
	@PostMapping("/modifyProduct")
	public String modifyProduct(Model model, ProductVO product) {
		productService.updateProduct(product);
		
		return "redirect:/product/productListForAdmin";
	}
	
	//삭제 이벤트
	@PostMapping("/deleteProduct")
	@ResponseBody
	public int deleteProduct(@RequestParam("productIdList[]")long[] productIdList) {
		log.info(productIdList);

		return productService.deleteProduct(productIdList);
	}
	
	//관리자 리스트페이지 호출
	@GetMapping("/productListForAdmin")
	public void modifyProduct(Model model, ProductPagingDTO productPaging) {
		model.addAttribute("productList", productService.getProductList(productPaging));
		
		long rowAmountTotal=productService.getRowAmountTotal(productPaging);
		ProductPagingCreatorDTO productPagingCreatorDTO=new ProductPagingCreatorDTO(rowAmountTotal, productPaging);
		model.addAttribute("pagingCreator", productPagingCreatorDTO);
	}
	
	//성분검색
   @ResponseBody
   @GetMapping("/searchComponent")
   public List<ComponentVO> searchComponent(@RequestParam("keyword") String keyword) {
	  
      List<ComponentVO> complist=productService.searchComponent(keyword);
      System.out.println(complist);
      return complist;
   } 
	
	 @PreAuthorize("isAuthenticated()")
	 @ResponseBody
	 @PostMapping("/memberThumb")
	 public int memberThumb(ThumbVO thumb) {
	    log.info("컨트롤러에 진입 -  추천 조회 : " + thumb.getMid());
	    log.info("컨트롤러에 진입 -  추천 조회 : " + productService.memberThumb(thumb));
	    return productService.memberThumb(thumb);
	 }



}

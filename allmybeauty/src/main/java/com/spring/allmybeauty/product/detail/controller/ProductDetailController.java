package com.spring.allmybeauty.product.detail.controller;

import javax.annotation.Resource;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.allmybeauty.product.detail.domain.QboardVO;
import com.spring.allmybeauty.product.detail.paging.QBoardPagingCreatorDTO;
import com.spring.allmybeauty.product.detail.paging.QBoardPagingDTO;
import com.spring.allmybeauty.product.detail.paging.QnABoardPagingCreatorDTO;
import com.spring.allmybeauty.product.detail.paging.QnABoardPagingDTO;
import com.spring.allmybeauty.product.detail.service.DetailService;
import com.spring.allmybeauty.product.detail.service.QboardService;

import lombok.extern.log4j.Log4j;
//@RestController
@Controller
@Log4j
@RequestMapping("/product")
public class ProductDetailController {

	@Resource
	private DetailService detailService;
	
	@Resource
	private QboardService qboardService;
	
	@GetMapping("/detail")
	public void showComponent(Model model, QBoardPagingDTO qboardPagingDTO) {
		log.info("-============3==3=3=3=3=" + qboardPagingDTO.getPageNum());
		log.info("-============3==3=3=3=3= =" + qboardPagingDTO.getProductid());
		//페이징
		long rowAmountTotal = qboardService.selectQboardTotal(qboardPagingDTO);
		log.info("444444444444 " + rowAmountTotal);
		QBoardPagingCreatorDTO qboardPagingCreatorDTO = new QBoardPagingCreatorDTO(rowAmountTotal, qboardPagingDTO);
//		qboardPagingDTO.setPageNum(pageNum);
//		qboardPagingDTO.setProductid(productid);
		model.addAttribute("qboardPaging", qboardPagingCreatorDTO);
		
		//Q&A조회
		model.addAttribute("qboardList", qboardService.ListQboard(qboardPagingDTO));
		log.info("qboardList" + qboardService.ListQboard(qboardPagingDTO) );
		
		//이미지 조회
		model.addAttribute("selectImg", detailService.attachfiles(qboardPagingDTO.getProductid()));
		log.info("selectImg : " + detailService.attachfiles(qboardPagingDTO.getProductid()));
//		log.info("성분 조회");
//		log.info("productid" + productid);
		model.addAttribute("component", detailService.getComponent(qboardPagingDTO.getProductid()));
		
//		log.info("detailService.getComponent(productid)" + detailService.getComponent(productid));
		

//		log.info("Q&A List 조회" + qboardService.ListQboard(productid) + "====================" + productid);
	}

	//Q&A 등록 페이지 호출
//	@GetMapping("/Inquire")
//	public void showinquireRegister(@RequestParam("productid") int productid, Model model) {
////		log.info("컨트롤러 - 게시물 등록페이지 호출");
////		log.info("====================" + productid);
//		model.addAttribute("productid", productid);
//	}
	
	//Q&A 등록 처리
	@Transactional
	@PostMapping("/Inquire")
	public String inquireRegister(QboardVO qboardVO) {
		qboardService.insertQboard(qboardVO);
		//log.info("qboardService.insertQboard(qboardVO" + qboardService.insertQboard(qboardVO) );
		//log.info("==================================" + qboardVO.getProductid());
		return "redirect:/product/detail?productid=" + qboardVO.getProductid();
	}
	
//	//Q&A 답변 처리 페이지 호출
//	@GetMapping("/AdminInquire")
//	public void showadminInquireRegister(@RequestParam("qrno") int qrno, @RequestParam("productid") int productid, Model model) {
////		log.info("컨트롤러 관리자 답변하기 페이지 호출");
////		log.info("======qno====="+ qdelflag);
//		model.addAttribute("qrno", qrno);
//		model.addAttribute("productid", productid);
//	}
	
//	//Q&A 답변 처리
//	@PostMapping("/AdminInquire")
//	public String adminInquireRegister(QboardVO qboardVO) {
////		qboardVO.setProductid(productid);
////		log.info("==============adminInquire" + productid);
//		qboardService.insertAdmin(qboardVO);
//		qboardService.qansernoAdmin(qboardVO);
//		return "redirect:/allmybeauty/detail?productid=" + qboardVO.getProductid();
//	}
	
	//Q&A 수정 페이지 호출
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/modify")
	public void showmodify(@RequestParam("mid") String mid, Model model) {
//		log.info("컨트롤러 - 게시물 수정페이지 호출");
//		log.info("====================" + productid);
//		model.addAttribute("productid", productid);
		//model.addAttribute("qboard", qboardService.selectQboard(mid));
	}
	
	//Q&A 수정
	@PreAuthorize("isAuthenticated()")
	@Transactional
	@PostMapping("/modify")
	public String modifyQboard(QboardVO qboardVO) {
//		log.info("컨트롤러 - 게시물 수정 완료" + qboardVO.getProductid());
		log.info("==================" + qboardVO);
		qboardService.updateQboard(qboardVO);
//		log.info("qboardService.updateQboard(qboardVO)" + qboardService.updateQboard(qboardVO));
		
		return "redirect:/product/detail?productid=" + qboardVO.getProductid();
	}

	//Q&A 삭제
	@PreAuthorize("isAuthenticated()")
	@Transactional
	@PostMapping("/delete")
	public String deleteQboard(QboardVO qboardVO) {
//		log.info("컨트롤러========게시물 삭제 요청 " + qboardVO.getMid() + "productid " + qboardVO.getProductid());
//		log.info("qboardService.deleteQboard(mid, productid)" + qboardService.deleteQboard(qboardVO));
		qboardService.deleteQboard(qboardVO);

		return "redirect:/product/detail?productid=" + qboardVO.getProductid();
	}
	
	//관리자 Q&A 삭제
	@PreAuthorize("isAuthenticated()")
	@Transactional
	@PostMapping("/deleteAdmin")
	@ResponseBody
	public Integer deleteAdmin(QboardVO qboardVO) {
//		log.info("컨트롤러========게시물 삭제 요청 " + qboardVO.getMid() + "productid " + qboardVO.getProductid());
//		log.info("qboardService.deleteQboard(mid, productid)" + qboardService.deleteQboard(qboardVO));
		

		return qboardService.deleteAdmin(qboardVO);
	}

//	@GetMapping("/qboardselect")
//	public void selectQboard(@PathVariable("qno") int qno,
//			   				@PathVariable("mid") long mid,
//			   				Model model) {
//		log.info("qboardVO : " + qno + mid );
//		model.addAttribute("QboardSelect", qboardService.selectQboard(qno, mid));
//		
//	}
	
	//관리자 답변 보기
	//@PostMapping("/selectAnswer")
	
	@RequestMapping(value="/selectAnswer", produces = "application/text; charset=utf8")
	@ResponseBody
	public String selectAnswer(QboardVO qboardVO) {
		log.info("qno 값 : " + qboardVO);
		String qcontentAn = qboardService.selectAnswer(qboardVO);
		log.info("qcontentAn 값은  : " + qcontentAn);
		return qcontentAn;
	}
	
	//특정 게시물
	@RequestMapping(value="/selectQboard", produces = "application/text; charset=utf8")
	@ResponseBody
	public String selectQboard(QboardVO qboardVO) {
		log.info("qno 값 : " + qboardVO);
		String qcontent = qboardService.selectQboard(qboardVO);
		log.info("qcontent 값은  : " + qcontent);
		return qcontent;
	}
	
	//관리자 특정 상품 Q&A 페이지 호출
		@PreAuthorize("isAuthenticated() and (principal.username == 'admin' )")
		@GetMapping("/Q&Admin")
		public void showQnAdminPage(Model model, QnABoardPagingDTO qnAboardPaging) {
			log.info("qnAboardPaging" + qnAboardPaging);
			//페이징
			long rowAmountTotal = qboardService.QnAselectQboardTotal(qnAboardPaging);
			QnABoardPagingCreatorDTO qboardPagingCreatorDTO = new QnABoardPagingCreatorDTO(rowAmountTotal, qnAboardPaging);
			model.addAttribute("QnAboardPagingCreator", qboardPagingCreatorDTO);
			//log.info("QnAboardPagingCreator" + qboardPagingCreatorDTO.getQnAboardPaging() );
			//Q&A조회
			model.addAttribute("QnAListQboard", qboardService.QnAListQboard(qnAboardPaging));
			//log.info("qboardList" + qboardService.QnAListQboard(QnAboardPaging) );
			//log.info("model: ===" + model);
			
			
		}
		
		//관리자 특정 상품 Q&A 조회
		@PreAuthorize("isAuthenticated() and (principal.username == 'admin' )")
		@PostMapping("/Q&Admin")
		public void showQnAdmin(Model model, QnABoardPagingDTO qnAboardPaging) {

			//페이징
			long rowAmountTotal = qboardService.QnAselectQboardTotal(qnAboardPaging);
			QnABoardPagingCreatorDTO qboardPagingCreatorDTO = new QnABoardPagingCreatorDTO(rowAmountTotal, qnAboardPaging);
			model.addAttribute("QnAboardPagingCreator", qboardPagingCreatorDTO);
			
			//Q&A조회
			model.addAttribute("QnAListQboard", qboardService.QnAListQboard(qnAboardPaging));
		}
		
		//Q&A 답변 처리
		@PreAuthorize("isAuthenticated() and (principal.username == 'admin' )")
		   @PostMapping("/AdminInquire")
		   public String adminInquireRegister(QboardVO qboardVO, String scope) {
//		      qboardVO.setProductid(productid);
		      log.info("==============adminInquire" + qboardVO);
		      log.info("scopeeeeeeeeeeeeeeeee" + scope);

		      qboardService.insertAdmin(qboardVO);
		      qboardService.qansernoAdmin(qboardVO);
		      return "redirect:/product/Q&Admin?productid=" + qboardVO.getProductid() + "&scope=" + scope;
		   }
	
	
	
	
	
	
	
	
	
	
	
}


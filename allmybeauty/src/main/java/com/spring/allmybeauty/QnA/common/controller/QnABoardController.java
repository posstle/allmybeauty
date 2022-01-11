package com.spring.allmybeauty.QnA.common.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.allmybeauty.QnA.common.paging.QnAPagingCreatorDTO;
import com.spring.allmybeauty.QnA.common.paging.QnAPagingDTO;
import com.spring.allmybeauty.QnA.common.upload.domain.QnAAttachFileVO;
import com.spring.allmybeauty.QnA.common.upload.service.QnAAttachFileService;
import com.spring.allmybeauty.QnA.customer.domain.CustomerBoardVO;
import com.spring.allmybeauty.QnA.customer.service.CustomerBoardService;
import com.spring.allmybeauty.QnA.notices.domain.NoticesBoardVO;
import com.spring.allmybeauty.QnA.notices.service.NoticesBoardService;

import lombok.Setter;

//@Log4j
@Controller
@RequestMapping("/QnABoard" )
public class QnABoardController{

	@Setter(onMethod_ = @Autowired)
	private CustomerBoardService customerBoardService;
	
	@Setter(onMethod_ = @Autowired)
	private NoticesBoardService noticesBoardService;

	@Setter(onMethod_ = @Autowired)
	private QnAAttachFileService qnaAttachFileService;



	//<고객게시판리스트>
	@RequestMapping(value="/customer", method = {RequestMethod.GET, RequestMethod.POST})
	public void showCustomerList(Model model, QnAPagingDTO qnaPagingDTO,
									@RequestParam(value="divide", required = false)String divide){
		
		if (null == divide) {
	         divide = "C";
	      }
//		log.info("qnaPagingDTO:"+ qnaPagingDTO);
//		log.info("model:"+ model);
//		log.info("divide:"+ divide);
		
		model.addAttribute("divide",divide);
		model.addAttribute("CustomerList", customerBoardService.getCustomerBoardList(qnaPagingDTO));


		long rowAmountCTotal = customerBoardService.getTotalCustomer(qnaPagingDTO);
		
		QnAPagingCreatorDTO qnaPagingCCreatorDTO = new QnAPagingCreatorDTO(rowAmountCTotal, qnaPagingDTO);
		
		model.addAttribute("pagingCCreator", qnaPagingCCreatorDTO);

	}

	//<고객게시판리스트-관리자용>
	@PreAuthorize("isAuthenticated() and (principal.username == 'admin' )")
	@RequestMapping(value="/adminCustomer", method = {RequestMethod.GET, RequestMethod.POST})
	public void showAdminCustomerList(Model model, QnAPagingDTO qnaPagingDTO,
									@RequestParam(value="divide", required = false)String divide){
		
		if (null == divide) {
	         divide = "C";
	      }
//		log.info("qnaPagingDTO:"+ qnaPagingDTO);
//		log.info("model:"+ model);
//		log.info("divide:"+ divide);
		
		model.addAttribute("divide",divide);
		model.addAttribute("CustomerList", customerBoardService.getCustomerBoardList(qnaPagingDTO));


		long rowAmountCTotal = customerBoardService.getTotalCustomer(qnaPagingDTO);
		
		QnAPagingCreatorDTO qnaPagingCCreatorDTO = new QnAPagingCreatorDTO(rowAmountCTotal, qnaPagingDTO);
		
		model.addAttribute("pagingCCreator", qnaPagingCCreatorDTO);

	}
	
	
	//<공지게시판리스트>
	@PreAuthorize("isAuthenticated() and (principal.username == 'admin' )")
	@RequestMapping(value="/adminNotice", method = {RequestMethod.GET, RequestMethod.POST})
	public void showAdminNoticesList(Model model, QnAPagingDTO qnaPagingDTO, 
									@RequestParam(value="divide", required = false)String divide){
		
		 if (null == divide) {
	         divide = "N";
	      }

		model.addAttribute("divide",divide);
//		log.info("qnaPagingDTO:"+ qnaPagingDTO);
//		log.info("divide:"+ divide);
//			log.info("model:"+ model);
			
			model.addAttribute("NoticesList", noticesBoardService.getNoticesBoardList(qnaPagingDTO));
			
			long rowAmountNTotal = noticesBoardService.getTotalNotices(qnaPagingDTO);
			
			QnAPagingCreatorDTO qnaPagingNCreatorDTO = new QnAPagingCreatorDTO(rowAmountNTotal, qnaPagingDTO);
			
			model.addAttribute("pagingNCreator", qnaPagingNCreatorDTO);

	}
	
	//<삭제된 게시판리스트>
	@PreAuthorize("isAuthenticated() and (principal.username == 'admin' )")
	@RequestMapping(value="/delCustomer", method = {RequestMethod.GET, RequestMethod.POST})
	public void showDelCustomerList(Model model, QnAPagingDTO qnaPagingDTO,
									@RequestParam(value="divide", required = false)String divide){
		
		if (null == divide) {
	         divide = "C";
	      }
//		log.info("qnaPagingDTO:"+ qnaPagingDTO);
//		log.info("model:"+ model);
//		log.info("divide:"+ divide);
		
		model.addAttribute("divide",divide);

		model.addAttribute("delCustomerList", customerBoardService.delCustomerBoardList(qnaPagingDTO));


		long rowAmountCTotal = customerBoardService.getTotalDelCustomer(qnaPagingDTO);
		
		QnAPagingCreatorDTO qnaPagingCCreatorDTO = new QnAPagingCreatorDTO(rowAmountCTotal, qnaPagingDTO);
		
		model.addAttribute("pagingCCreator", qnaPagingCCreatorDTO);

	}
	
	
	//<공지게시판리스트>
	@RequestMapping(value="/notice", method = {RequestMethod.GET, RequestMethod.POST})
	public void showNoticesList(Model model, QnAPagingDTO qnaPagingDTO, 
									@RequestParam(value="divide", required = false)String divide){

		 if (null == divide) {
	         divide = "N";
	      }

		model.addAttribute("divide",divide);
//		log.info("qnaPagingDTO:"+ qnaPagingDTO);
//		log.info("divide:"+ divide);
//			log.info("model:"+ model);
			
			model.addAttribute("NoticesList", noticesBoardService.getNoticesBoardList(qnaPagingDTO));
			
			long rowAmountNTotal = noticesBoardService.getTotalNotices(qnaPagingDTO);
			
			QnAPagingCreatorDTO qnaPagingNCreatorDTO = new QnAPagingCreatorDTO(rowAmountNTotal, qnaPagingDTO);
			
			model.addAttribute("pagingNCreator", qnaPagingNCreatorDTO);

	}
	
	
	
	//<게시판등록-화면>
    @PreAuthorize("isAuthenticated()")
	@GetMapping("/register")
	public void registerQnABoard(Model model, @RequestParam(value="divide", required = false)String divide) {
		
		model.addAttribute("divide",divide);
//		log.info("Get-divide:" + divide);
//		log.info("컨트롤러- 게시물 등록 화면.....");
		
	}

	//< 게시판등록-실행>
    @PreAuthorize("isAuthenticated()")
	@PostMapping("/register")
	public String register(NoticesBoardVO noticesBoardVO, CustomerBoardVO customerBoardVO,Model model,
							@RequestParam(value="divide", required = false)String divide) {
//		log.info("컨트롤러- 게시물 등록 실행.....");
//		log.info("Rdivide:" + divide);
		
		model.addAttribute("divide",divide);
		
		if ("N".equals(divide)) {
			
//			log.info("Nregister-divide: "+divide);
	
			long bno = noticesBoardService.registerNoticesBoard(noticesBoardVO);
			
			model.addAttribute("result", bno);
			
			return "redirect:/QnABoard/adminNotice";
			
		}else {
			
//			log.info("Cregister-divide: "+divide);
			
			long bno = customerBoardService.regisertCustomerBoard(customerBoardVO);
			
			model.addAttribute("result", bno);
			
			return "redirect:/QnABoard/customer";
		}

	}
	
	
	//<게시판 상세>
	@RequestMapping(value="/detail", method = {RequestMethod.GET, RequestMethod.POST})
	public void detailBoard(Model model, @RequestParam("bno")long bno, 
										 @RequestParam(value = "divide", required = false)String divide,
										 @ModelAttribute("QnAPagingDTO") QnAPagingDTO qnaPagingDTO ) {

		model.addAttribute("divide",divide);

		if("N".equals(divide)) {
			
//			log.info("Ndetail-bno: "+bno);
//			log.info("Ndetail-divide: "+divide);
			model.addAttribute("NoticesDetail",noticesBoardService.getNoticesBoard(bno));
			model.addAttribute("QnAAttachFile" ,qnaAttachFileService.selectByNbno(bno));
			
		}else {
		
//			log.info("Cdetail-bno: "+bno);
//			log.info("Cdetail-divide: "+divide);
			model.addAttribute("CustomerDetail", customerBoardService.getCustomerBoard(bno));
			model.addAttribute("QnAAttachFile" ,qnaAttachFileService.selectByCbno(bno));

		}
		
	}
	
	//<게시판 수정>
	@GetMapping("/modify")
	public void modifyQnABoard( Model model,
								QnAPagingDTO qnaPagingDTO,
								@RequestParam(value = "bno", required = false) long bno,
								@RequestParam(value = "divide", required = false)String divide) {

		model.addAttribute("divide",divide);
		
		if ("N".equals(divide)) {
			
//			log.info("Nmodify-bno: "+bno);
//			log.info("Nmodify-divide: "+divide);
			model.addAttribute("NoticesDetail", noticesBoardService.getNoticeBoardDetailMod(bno));
			model.addAttribute("QnAPagingDTO", qnaPagingDTO);
			model.addAttribute("QnAAttachFile" ,qnaAttachFileService.selectByNbno(bno));
			
		}else{
		
//			log.info("Cmodify-bno: "+bno);
//			log.info("Cmodify-divide: "+divide);
			model.addAttribute("CustomerDetail", customerBoardService.getCustomerBoardDetailMod(bno));
			model.addAttribute("QnAPagingDTO", qnaPagingDTO);
			model.addAttribute("QnAAttachFile" ,qnaAttachFileService.selectByCbno(bno));
		}
		
	
	}
	
	//<게시판 수정>
	@GetMapping("/detailmod")
	public String QnABoardDetailMod( Model model,@RequestParam(value = "bno", required = false) long bno,
												 @RequestParam(value = "divide", required = false)String divide,
												 QnAPagingDTO qnAPagingDTO) {
	model.addAttribute("divide",divide);
		
		if ("N".equals(divide)) {
			
//			log.info("Nmodify-bno: "+bno);
//			log.info("Nmodify-divide: "+divide);
			model.addAttribute("NoticesDetail", noticesBoardService.getNoticeBoardDetailMod(bno));
			model.addAttribute("QnAPagingDTO" ,qnAPagingDTO);
			
		}else{
		
//			log.info("Cmodify-bno: "+bno);
//			log.info("Cmodify-divide: "+divide);
			model.addAttribute("CustomerDetail", customerBoardService.getCustomerBoardDetailMod(bno));
			model.addAttribute("QnAPagingDTO" ,qnAPagingDTO);
		}
		
		
		return "QnABoard/detail";
	}
	
	//<게시판 수정 실행>
	@PreAuthorize("isAuthenticated() and ((principal.username == #noticesBoardVO.mid) or (principal.username == #customerBoardVO.mid) )")
	@PostMapping("/modify") 
	public String modifyQnABoard(NoticesBoardVO noticesBoardVO, CustomerBoardVO customerBoardVO, Model model,
													@RequestParam(value = "divide", required = false)String divide,
													QnAPagingDTO qnaPagingDTO) {
//		log.info("수정불러오기"	);
		model.addAttribute("divide",divide);
		
		if("N".equals(divide)) {
			
			noticesBoardService.modifyNoticesBoard(noticesBoardVO);
				
			model.addAttribute("bno", noticesBoardVO.getBno());
			model.addAttribute("pagingNum", qnaPagingDTO.getPagingNum());
			model.addAttribute("rowAmountPerPage", qnaPagingDTO.getRowAmountPerPage());
			
			return "redirect:/QnABoard/detailmod?bno="+noticesBoardVO.getBno();
	
			
		}else{
		
			customerBoardService.modifyCustomerBoard(customerBoardVO);
			
			model.addAttribute("bno", noticesBoardVO.getBno());
			model.addAttribute("pagingNum", qnaPagingDTO.getPagingNum());
			model.addAttribute("rowAmountPerPage", qnaPagingDTO.getRowAmountPerPage());
			
			return "redirect:/QnABoard/detailmod?bno="+customerBoardVO.getBno();
		}
		
	}
	
	
	
	//게시판 삭제요청
	@PreAuthorize("isAuthenticated() and ((principal.username == #noticesBoardVO.mid) or (principal.username == #customerBoardVO.mid) or  (principal.username == 'admin' ))")
	@PostMapping("/remove")
	public String setcustomerBoardDeleted(NoticesBoardVO noticesBoardVO, CustomerBoardVO customerBoardVO,
										  @RequestParam("bno")long[] bno,  RedirectAttributes redirectAttr, QnAPagingDTO qnaPagingDTO) {
		
		customerBoardService.setCustomerBoardDeleted(bno);
		
		redirectAttr.addAttribute("pagingNum", qnaPagingDTO.getPagingNum());
		redirectAttr.addAttribute("rowAmountPerPage", qnaPagingDTO.getRowAmountPerPage());
		if (noticesBoardVO.getMid() != null ||customerBoardVO.getMid() != null) {
			return "redirect:/QnABoard/customer";
		}else {
			return "redirect:/QnABoard/adminCustomer";
		}
		
	}
	
	
	
	
	//게시판 삭제수행
	@PreAuthorize("isAuthenticated() and (principal.username == 'admin' )")
	@PostMapping("/removeAll")
	public String removeAllDeleteBoard(@RequestParam(value="bno") long[] bno , RedirectAttributes redirectAttr, QnAPagingDTO qnaPagingDTO) {
		

			customerBoardService.removeCustomerBoard(bno);
			redirectAttr.addAttribute("pagingNum", qnaPagingDTO.getPagingNum());
			redirectAttr.addAttribute("rowAmountPerPage", qnaPagingDTO.getRowAmountPerPage());
			
		return "redirect:/QnABoard/delCustomer";
	}

	
	
	//공지게시판 삭제수행
	@PreAuthorize("isAuthenticated() and (principal.username == 'admin' )")
	@PostMapping("/delete")
	public String deleteNoticesBoard( NoticesBoardVO noticesBoardVO, CustomerBoardVO customerBoardVO,
										@RequestParam("bno") long[] bno, RedirectAttributes redirectAttr, QnAPagingDTO qnaPagingDTO) {
		
		noticesBoardService.deleteNoticesBoard(bno);
		
		redirectAttr.addAttribute("pagingNum", qnaPagingDTO.getPagingNum());
		redirectAttr.addAttribute("rowAmountPerPage", qnaPagingDTO.getRowAmountPerPage());
		
		return "redirect:/QnABoard/adminNotice";
	}
	
	//공지사항 첨부파일 조회
	@GetMapping(value = "/getNoticFiles", produces = {"application/json;charset=UTF-8" })
	@ResponseBody
	public ResponseEntity<List<QnAAttachFileVO>> showNoticeFiles(long bno) {
//	log.info("컨트롤러: 조회할 첨부파일의 게시물번호(bno): " + bno);
	return new ResponseEntity<List<QnAAttachFileVO>>(noticesBoardService.getAttachFilesByNbno(bno), HttpStatus.OK);
	}
	
	//고객문의 첨부파일 조회
	@GetMapping(value = "/getCustomerFiles", produces = {"application/json;charset=UTF-8" })
	@ResponseBody
	public ResponseEntity<List<QnAAttachFileVO>> showCustomerFiles(long bno) {
//	log.info("컨트롤러: 조회할 첨부파일의 게시물번호(bno): " + bno);
	return new ResponseEntity<List<QnAAttachFileVO>>(customerBoardService.getAttachFilesByCbno(bno), HttpStatus.OK);
	}
	
}

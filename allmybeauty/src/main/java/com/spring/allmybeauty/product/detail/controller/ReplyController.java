package com.spring.allmybeauty.product.detail.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.spring.allmybeauty.common.fileupload.domain.AttachfilesVO;
import com.spring.allmybeauty.product.detail.domain.ReviewVO;
import com.spring.allmybeauty.product.detail.paging.ReplyPagingCreatorDTO;
import com.spring.allmybeauty.product.detail.paging.ReplyPagingDTO;
import com.spring.allmybeauty.product.detail.service.ReviewService;

import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping(value = {"/replies"})
@Log4j
public class ReplyController {
	@JsonFormat(with = JsonFormat.Feature.ACCEPT_SINGLE_VALUE_AS_ARRAY)
	private ReviewService reviewService;
	
	
	public ReplyController(ReviewService reviewService) {
		this.reviewService = reviewService;
	}
	
	//리뷰에 대한 댓글 조회
	@GetMapping(value = "/pages/{productid}/{page}",
				produces = {"application/json; charset=utf-8", "application/xml; charset=utf-8"})
	public ResponseEntity<ReplyPagingCreatorDTO> showReplyList(@PathVariable("productid") int productid,
															   @PathVariable("page") Integer pageNum){
		log.info("pageNum" + pageNum);
		log.info("productid" + productid);
		
		ReplyPagingDTO replyPaging = new ReplyPagingDTO(productid, pageNum);
		
		ReplyPagingCreatorDTO replyPagingCreator = reviewService.selectReviewList(replyPaging);
		log.info("댓글댓글" + replyPagingCreator);
		ResponseEntity<ReplyPagingCreatorDTO> responseEntity = new ResponseEntity<>(replyPagingCreator, HttpStatus.OK);

		return responseEntity;
		
	}
	
	//리뷰 등록
	@PostMapping(value = "/{productid}/new",
			 consumes = {"application/json; charset=utf-8"},
			 produces = {"text/plain; charset=utf-8"})
	public ResponseEntity<String> registerReply(@PathVariable("productid") int productid,
												@RequestBody ReviewVO reviewVO,
												MultipartFile multipartFile){
		log.info("productid" + productid);
		log.info("getProductid" + reviewVO.getProductid());
		log.info("ReviewVO" + reviewVO);
		log.info("multipartFile=======" + multipartFile);
		log.info("reviewVO========================" + reviewVO.getFileurl());
		
		if(reviewVO.getFileurl() != null) {
			reviewVO.getFileurl()
				.forEach(attachFile -> System.out.println("첨부 파일 정보" + attachFile.toString()));
		}
		Long registerRno = reviewService.insertReview(reviewVO);
		
		return registerRno != null ? new ResponseEntity<>("게시물의 댓글 등록 성공", HttpStatus.OK)
									: new ResponseEntity<>("게시물의 댓글 등록 실패", HttpStatus.INTERNAL_SERVER_ERROR);
		
	}
	
	//이미지 등록
//	@PostMapping(value = "/{productid}/new/file")
//	public ResponseEntity<String> registerFile(@PathVariable("productid") int productid,
//											   @PathVariable("multipartFile") MultipartFile multipartFile){
//		//log.info("==================이미지==========================" + productid);
//		Long registerFile = attachFileMapper.insertAttachFile(multipartFile);
//		return registerFile != null ? new ResponseEntity<>("파일 첨부 성공", HttpStatus.OK)
//									: new ResponseEntity<>("파일 첨부 실패", HttpStatus.INTERNAL_SERVER_ERROR);
//				
//	}
	
	//리뷰에 대한 답글
	@PostMapping(value = "/{productid}/{prno}/new",
				 consumes = {"application/json; charset=utf-8"},
				 produces = {"text/plain; charset=utf-8"})
	public ResponseEntity<String> registerForReply(@PathVariable("productid") int productid,
												   @PathVariable("prno") long prno,
												   @RequestBody ReviewVO reviewVO){
		
		log.info("Productid" + productid);
		log.info("getProductid" + reviewVO.getProductid());
		log.info("prno" + prno);
		log.info("getPrno" + reviewVO.getPrno());
		log.info("ReviewVO"  + reviewVO);
		
		Long registerRno = reviewService.registerReply(reviewVO);
		
		return registerRno != null
							? new ResponseEntity<>("댓글에 대한 답글 등록 성공", HttpStatus.OK)
							: new ResponseEntity<>("댓글에 대한 답글 등록 실패", HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	//특정 댓글/답글 조회
	@GetMapping(value = "/{productid}/{rno}",
				produces = {"application/json; charset=utf-8", "application/xml; charset=utf-8"})
	public ResponseEntity<ReviewVO> showReply(@PathVariable("productid") int productid,
											  @PathVariable("rno") long rno){
		
		ReviewVO reviewVO = reviewService.getReply(productid, rno);
		
		return new ResponseEntity<>(reviewVO, HttpStatus.OK);
	}
	
	//리뷰 수정
	@RequestMapping(value = "/{productid}/{rno}",
					method = {RequestMethod.PUT, RequestMethod.PATCH},
					consumes = "application/json; charset=utf-8",
					produces = "text/plain; charset=utf-8")
	public ResponseEntity<String> modifyReply(@PathVariable("productid") int productid,
											  @PathVariable("rno") long rno,
											  @RequestBody ReviewVO reviewVO){
		reviewVO.setProductid(productid);
		reviewVO.setRno(rno);
		log.info("reviewAttach" + reviewVO.getFileurl());
		
		long modCnt = reviewService.upadateReview(reviewVO);
		log.info("modCNt=========="+ modCnt);
		return modCnt == 1
					? new ResponseEntity<>("댓글 수정 성공", HttpStatus.OK)
					: new ResponseEntity<>("댓글 수정 실패", HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	//리뷰 삭제
	@DeleteMapping(value = "/{productid}/{rno}", 
					produces = {"text/plain; charset=utf-8"})
	public ResponseEntity<String> removeReply(@PathVariable("productid") int productid,
											  @PathVariable("rno") long rno){
		int delCnt = reviewService.deleteReview(productid, rno);
		log.info("==========reviewService.deleteReview(productid, rno)"+ reviewService.deleteReview(productid, rno));
		return delCnt == 1 
						? new ResponseEntity<>("댓글 삭제 성공", HttpStatus.OK)
						: new ResponseEntity<>("댓글 삭제 실패", HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	//첨부파일 조회
	@GetMapping(value = "/getFiles", produces = {"application/json; charset=UTF-8"})
	@ResponseBody
	public ResponseEntity<List<AttachfilesVO>> showAttachFiles(long productid){
		log.info("파일 조회 시작");
		return new ResponseEntity<List<AttachfilesVO>>(reviewService.getAttachFileBypro(productid), HttpStatus.OK);
	}
	
	
}

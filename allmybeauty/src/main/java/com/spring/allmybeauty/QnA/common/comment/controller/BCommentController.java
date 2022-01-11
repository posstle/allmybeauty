package com.spring.allmybeauty.QnA.common.comment.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.spring.allmybeauty.QnA.common.comment.domain.BCommentVO;
import com.spring.allmybeauty.QnA.common.comment.paging.BCommentPagingCreatorDTO;
import com.spring.allmybeauty.QnA.common.comment.paging.BCommentPagingDTO;
import com.spring.allmybeauty.QnA.common.comment.service.BCommentService;

@RequestMapping(value={"/qnaReplies"})
@RestController
//@Log4j
public class BCommentController {
	
	private BCommentService bCommentService;

	
	public BCommentController (BCommentService bCommentService) {
		this.bCommentService = bCommentService;
	}
	
	
	//게시물에 대한 댓글 목록 조회(페이징)
	@GetMapping(value = "/pages/{bno}/{page}",
				
				produces = { "application/json; charset=UTF-8", "application/xml; charset=UTF-8"})
	public ResponseEntity<BCommentPagingCreatorDTO> cmtList(@PathVariable("bno") Long bno,
															@PathVariable("page") Integer pageNum){

		BCommentPagingDTO bCommentPaging = new BCommentPagingDTO(bno, pageNum);

		
		BCommentPagingCreatorDTO bCommentPagingCreator = bCommentService.selectCnoListByBno(bCommentPaging);
  		
		ResponseEntity<BCommentPagingCreatorDTO> responseEntity =
				new ResponseEntity<>(bCommentPagingCreator, HttpStatus.OK);
		

		return responseEntity;
	}
	
	

	//게시물에 대한 댓글 등록:cno반환
	@PreAuthorize("isAuthenticated()")
	@PostMapping(value = "/{bno}/new",
				 consumes = {"application/json; charset=UTF-8"},
				 produces = {"text/plain; charset=UTF-8"})
	public ResponseEntity<String> registerCnoForBoard(@PathVariable("bno") Long bno,
													  @RequestBody BCommentVO bComment){
//		log.info(bno);
//		log.info(bcomment.getBno());
//		log.info(creply);
//		log.info(creply);
//		log.info(bcomment.getCreply());
//		log.info(bcomment);
		
		Long registerdCno = bCommentService.registerCnoForBoard(bComment);
		
		
		
		return registerdCno != null ? new ResponseEntity<>("게시물에 댓글 등록 성공", HttpStatus.OK)
							:new ResponseEntity<>("게시물에 댓글 등록 실패", HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	
	//게시물에 대한 댓글의 답글 등록:creply 반환
	@PostMapping(value = "/{bno}/{creply}/new",
			 consumes = {"application/json; charset=UTF-8"},
			 produces = { "text/plain; charset=UTF-8"})
	public ResponseEntity<String> registerCnoForReply(@PathVariable("bno") Long bno,
												  @PathVariable("creply") Long creply,
													  @RequestBody BCommentVO bComment){
//		log.info(bno);
//		log.info(bComment.getBno());
//		log.info(creply);
//		log.info(bComment.getCreply());
//		log.info(bComment);
		
		Long registerdCno = bCommentService.registerCnoForReply(bComment);
		
		
	
	return registerdCno != null ? new ResponseEntity<>("댓글에 대한 답글 등록 성공", HttpStatus.OK)
						:new ResponseEntity<>("게시물에 댓글 등록 실패", HttpStatus.INTERNAL_SERVER_ERROR);
}
	
	
	//게시물에 대한 특정 댓글 조회
	@GetMapping(value = "/{bno}/{cno}",	
			produces = { "application/json; charset=UTF-8", "application/xml; charset=UTF-8"})
	public ResponseEntity<BCommentVO> selectBComment(@PathVariable("bno") Long bno,
													 @PathVariable("cno") Long cno){
		BCommentVO bComment = bCommentService.selectBComment(bno, cno);
		
		return new ResponseEntity<>(bComment, HttpStatus.OK);
		
	}
	
	
	//게시글에 대한 댓글 수정
	@RequestMapping(value = "/{bno}/{cno}",
					method = {RequestMethod.PUT, RequestMethod.PATCH},
					consumes = "application/json; charset=UTF-8",
					produces = "text/plain; charset=UTF-8")
	public ResponseEntity<String> modifyCno(@PathVariable("bno") Long bno,
											@PathVariable("cno") Long cno,
											@RequestBody BCommentVO bComment){
		int modCnt = bCommentService.modifyCno(bComment);
		
		return modCnt== 1
				? new ResponseEntity<>("댓글 수정 성공", HttpStatus.OK)
				: new ResponseEntity<>("댓글 수정 실패", HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	
	//게시글에 대한 댓글 삭제
	@DeleteMapping(value = "/{bno}/{cno}", produces = "text/plain; charset=UTF-8")
	public ResponseEntity<String> removeCno(@PathVariable("bno") Long bno,
									@PathVariable("cno") Long cno){
		
		int delCnt = bCommentService.removeCno(bno, cno);

		return delCnt== 1
		? new ResponseEntity<>("댓글 수정 성공", HttpStatus.OK)
		: new ResponseEntity<>("댓글 수정 실패", HttpStatus.INTERNAL_SERVER_ERROR);
	}
}

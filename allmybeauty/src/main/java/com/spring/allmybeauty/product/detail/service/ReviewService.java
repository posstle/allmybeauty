package com.spring.allmybeauty.product.detail.service;

import java.util.List;

import com.spring.allmybeauty.common.fileupload.domain.AttachfilesVO;
import com.spring.allmybeauty.product.detail.domain.ReviewVO;
import com.spring.allmybeauty.product.detail.paging.ReplyPagingCreatorDTO;
import com.spring.allmybeauty.product.detail.paging.ReplyPagingDTO;

public interface ReviewService {
		
	//리뷰 목록 조회
	//public List<ReviewVO> selectReviewList(ReplyPagingDTO replyPagingDTO);
	public ReplyPagingCreatorDTO selectReviewList(ReplyPagingDTO replyPaging);
	
	//댓글 총 개수
	public long getReplyTotal(ReplyPagingDTO replyPaging);
	
	//리뷰 등록
	public long insertReview(ReviewVO reviewVO);
		
	//리뷰에 대한 답글 등록
	public long registerReply(ReviewVO reviewVO);
	
	//특정 댓글/답글 조회
	public ReviewVO getReply(int productid, long rno);
			
	//리뷰 수정
	public long upadateReview(ReviewVO reviewVO);
	
	//리뷰 삭제
	public int deleteReview(int productid, long rno);
	
	//리뷰 첨부파일 조회
	public List<AttachfilesVO> getAttachFileBypro(long productid);
}






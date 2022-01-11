package com.spring.allmybeauty.product.detail.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.allmybeauty.product.detail.domain.ReviewVO;
import com.spring.allmybeauty.product.detail.paging.ReplyPagingDTO;

public interface ReviewMapper {
	
	//리뷰 목록 조회
	public List<ReviewVO> selectReviewList(@Param("reviewPagingDTO") ReplyPagingDTO reviewPagingDTO);
	
	//댓글 총 개수
	public long selectReplyTotal(@Param("reviewPagingDTO") ReplyPagingDTO reviewPagingDTO);
	
	//리뷰 등록
	public Integer insertReview(ReviewVO reviewVO);
	
	//리뷰에 대한 답글 등록
	public long insertReviewReply(ReviewVO reviewVO);
	
	//특정 댓글/답글 조회
	public ReviewVO selectReview(@Param("rno") long rno, @Param("productid") int productid);
	
	//리뷰 수정
	public long upadateReview(ReviewVO reviewVO);
	
	//리뷰 삭제
	public int deleteReview(@Param("productid") int productid, @Param("rno") long rno);
}

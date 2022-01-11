package com.spring.allmybeauty.QnA.common.comment.service;

import com.spring.allmybeauty.QnA.common.comment.domain.BCommentVO;
import com.spring.allmybeauty.QnA.common.comment.paging.BCommentPagingCreatorDTO;
import com.spring.allmybeauty.QnA.common.comment.paging.BCommentPagingDTO;

public interface BCommentService {
	//게시물에 대한 댓글목록 조회
	public BCommentPagingCreatorDTO selectCnoListByBno(BCommentPagingDTO bCommentPaging);
	
	//게시물에 대한 댓글 갯수 확인
	public long selectCnoTotalByBno(BCommentPagingDTO bCommentPaging);
	
	//게시물에 대한 댓글 등록
	public long registerCnoForBoard(BCommentVO bComment);
	
	//댓글에 답글 등록
	public long registerCnoForReply(BCommentVO bComment);
	
	//게시물에 대한 댓글/답글 조회
	public BCommentVO selectBComment(long bno, long cno);
	
	//게시물에 대한 댓글 수정
	public int modifyCno(BCommentVO bComment);
	
	//게시물에 대한 댓글 삭제
	public int removeCno(long bno, long cno);
	
	
}


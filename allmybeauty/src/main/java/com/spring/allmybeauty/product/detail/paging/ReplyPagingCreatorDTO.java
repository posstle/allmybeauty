package com.spring.allmybeauty.product.detail.paging;

import java.util.List;

import com.spring.allmybeauty.common.fileupload.domain.AttachfilesVO;
import com.spring.allmybeauty.product.detail.domain.ReviewVO;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class ReplyPagingCreatorDTO {
	
	private ReplyPagingDTO replyPaging;
	private int startPagingNum;
	private int endPagingNum;
	private boolean prev;
	private boolean next;
	private long replyTotalByBno;
	private int pagingNumCnt;
	private int lastPageNum;
	
	private List<ReviewVO> reviewList;
	private List<AttachfilesVO> fileurl;
	
	public ReplyPagingCreatorDTO(long replyTotalByBno,
								 ReplyPagingDTO replyPaging,
								 List<ReviewVO> reviewList,
								 List<AttachfilesVO> fileurl) {
		this.replyPaging = replyPaging;
		this.replyTotalByBno = replyTotalByBno;
		this.reviewList = reviewList;
		this.fileurl = fileurl;
		this.pagingNumCnt = 2;
		
		this.endPagingNum = (int) (Math.ceil(replyPaging.getPageNum() / (this.pagingNumCnt * 1.0))) * this.pagingNumCnt;
		
		this.startPagingNum = this.endPagingNum - (this.pagingNumCnt - 1);
		
		this.lastPageNum = (int) (Math.ceil(replyTotalByBno * 1.0 / (replyPaging.getRowAmountPerPage())));
		
		if(lastPageNum < this.endPagingNum) {
			this.endPagingNum = lastPageNum;
		}
		
		this.prev = this.startPagingNum > 1;
		this.next = this.endPagingNum < lastPageNum;

		System.out.println("댓글-전달된 페이징 기본데이터 - myReplyPaging : " + replyPaging.toString());
		System.out.println("댓글-끝 페이징번호 : " + this.endPagingNum);
		System.out.println("댓글-시작 페이징번호 : " + this.startPagingNum);
		System.out.println("댓글-이전버튼 표시 여부 : " + this.prev);
		System.out.println(replyTotalByBno);
		System.out.println("댓글-다음버튼 표시 여부 : " + this.next);
		System.out.println("전달된 댓글 목록 데이터 : " + this.reviewList);
		
	}
}

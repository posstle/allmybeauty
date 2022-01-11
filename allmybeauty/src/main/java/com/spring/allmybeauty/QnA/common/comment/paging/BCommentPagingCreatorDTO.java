package com.spring.allmybeauty.QnA.common.comment.paging;

import java.util.List;

import com.spring.allmybeauty.QnA.common.comment.domain.BCommentVO;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class BCommentPagingCreatorDTO {
	
	private BCommentPagingDTO cntPaging;
	private int startPagingNum;
	private int endPagingNum;
	private boolean prev;
	private boolean next;
	private long cntTotalByBno;
	private int pagingNumCnt;
	private int lastPageNum;
	
	private List<BCommentVO> cmtList;
	
	public BCommentPagingCreatorDTO(long cntTotalByBno,
								BCommentPagingDTO bCommentPaing,
								List<BCommentVO> cmtList) {
		this.cntPaging = bCommentPaing;
		this.cntTotalByBno = cntTotalByBno;
		this.cmtList = cmtList;
		this.pagingNumCnt = 10;
		
		//계산된 끝-시작 페이징 번호:
		this.endPagingNum =
				(int)( Math.ceil(bCommentPaing.getPageNum() / (this.pagingNumCnt * 1.0 ) )) * this.pagingNumCnt;
				
		this.startPagingNum = this.endPagingNum - (this.pagingNumCnt -1);
						
		this.lastPageNum = (int)( Math.ceil((cntTotalByBno * 1.0) / bCommentPaing.getRowAmountPerPage()));
		
		if(lastPageNum < this.endPagingNum) {
			this.endPagingNum = lastPageNum;
			
		}
		
		this.prev = this.startPagingNum > 1;
		this.next = this.endPagingNum < lastPageNum;

	}
	
	
}

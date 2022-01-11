package com.spring.allmybeauty.product.detail.paging;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class QnABoardPagingCreatorDTO {
	private  QnABoardPagingDTO qnAboardPaging;
	private int startPagingNum;
	private int endPagingNum;
	private boolean prev;
	private boolean next;
	private long rowAmountTotal;
	private int pagingNumCnt;
	private int lastPageNum;
	
	public QnABoardPagingCreatorDTO(long rowAmountTotal, QnABoardPagingDTO qnAboardPaging) {
		this.qnAboardPaging = qnAboardPaging;
		this.rowAmountTotal = rowAmountTotal;
		this.pagingNumCnt = 10;
		
		this.endPagingNum 
			= (int)(Math.ceil(qnAboardPaging.getPageNum() / (this.pagingNumCnt * 1.0) ) ) * this.pagingNumCnt;
		System.out.println("endPagingNum" + endPagingNum);
		this.startPagingNum = this.endPagingNum - (this.pagingNumCnt - 1);
		
		this.lastPageNum = (int)(Math.ceil((rowAmountTotal * 1.0) / qnAboardPaging.getRowAmountPerPage()));
		System.out.println("lastPagingNum" + lastPageNum);
		if(lastPageNum < this.endPagingNum) {
			this.endPagingNum = lastPageNum;
		}
		
		this.prev = this.startPagingNum > 1;
		this.next = this.endPagingNum < lastPageNum;
		System.out.println("총 개수" + rowAmountTotal);
		System.out.println("버튼 페이지-------" + lastPageNum);
	}
	

}

package com.spring.allmybeauty.QnA.common.paging;

import lombok.Data;

@Data
public class QnAPagingCreatorDTO {

	private QnAPagingDTO qnaPagingDTO;
	private int startPagingNum;
	private int endPagingNum;
	private boolean prev;
	private boolean next;
	private long rowAmounTotal;
	private int pagingNumCnt;
	private int lastPagingNum;
	public QnAPagingCreatorDTO(long rowAmounTotal, QnAPagingDTO qnaPagingDTO) {
		
		this.qnaPagingDTO = qnaPagingDTO;
		this.rowAmounTotal = rowAmounTotal;
		this.pagingNumCnt = 10 ;
		
//		끝번호페이지 계산
		this.endPagingNum=
				(int)(Math.ceil(qnaPagingDTO.getPagingNum() / (this.pagingNumCnt * 1.0 ) ) ) * this.pagingNumCnt;
	
//		시작페이지 계산
		this.startPagingNum=
				this.endPagingNum - (this.pagingNumCnt -1);

//		끝페이지 계산
		this.lastPagingNum = (int)(Math.ceil((rowAmounTotal * 1.0)/qnaPagingDTO.getRowAmountPerPage() ) );
		
		if(lastPagingNum < this.endPagingNum) {
			this.endPagingNum = lastPagingNum;
		}
		
//		이전
		this.prev = this.startPagingNum >1;
		
//		다음
		this.next = this.endPagingNum < lastPagingNum;
		
		
	}
	

	
}

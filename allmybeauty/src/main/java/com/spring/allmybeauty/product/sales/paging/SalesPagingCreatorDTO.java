package com.spring.allmybeauty.product.sales.paging;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class SalesPagingCreatorDTO {
	
	private SalesPagingDTO salesPagingDTO;
	private int startPagingNum;
	private int endPagingNum;
	private boolean prev;
	private boolean next;
	private long rowAmountTotal;
	private int pagingNumCnt;
	private int lastPageNum;
	
	public SalesPagingCreatorDTO(long rowAmountTotal, SalesPagingDTO salesPagingDTO) {
		this.salesPagingDTO=salesPagingDTO;
		this.rowAmountTotal=rowAmountTotal;
		this.pagingNumCnt=10;
		
		this.endPagingNum=(int)(Math.ceil(salesPagingDTO.getPageNum() / (this.pagingNumCnt * 1.0))) * this.pagingNumCnt;
		
		this.startPagingNum=this.endPagingNum - (this.pagingNumCnt - 1);
		
		this.lastPageNum=(int)(Math.ceil((rowAmountTotal * 1.0) / salesPagingDTO.getRowAmountPerPage()));
		
		if(lastPageNum < this.endPagingNum) {
			this.endPagingNum=lastPageNum;
		}
		
		this.prev=this.startPagingNum>1;
		this.next=this.endPagingNum < lastPageNum;
		
	}
}

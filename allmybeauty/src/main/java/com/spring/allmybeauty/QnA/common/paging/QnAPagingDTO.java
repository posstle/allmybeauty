package com.spring.allmybeauty.QnA.common.paging;

import lombok.Data;

@Data
public class QnAPagingDTO {

	private long pagingNum;	//페이지
	private long rowAmountPerPage; //페이지당 게시물수

	public  QnAPagingDTO() {
		
		this.pagingNum = 1;
		this.rowAmountPerPage = 10;
	}
	
	public QnAPagingDTO(int pagingNum) {
		if (pagingNum <= 0) {
			this.pagingNum =1;
			
		}else {
			this.pagingNum = pagingNum;
			
		}
		
		this.rowAmountPerPage =10 ;
	}

	public QnAPagingDTO(int pagingNum, int rowAmountPerPage) {
		
		if (pagingNum <= 0) {
			this.pagingNum = 1;
		}else {
			this.pagingNum = pagingNum;
		}
		
		if (rowAmountPerPage <= 0) {
			this.rowAmountPerPage = 10;
			
		}else {
			this.rowAmountPerPage = rowAmountPerPage;
			
		}
		
	}
	
}

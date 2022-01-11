package com.spring.allmybeauty.product.detail.paging;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
@EqualsAndHashCode
public class QnABoardPagingDTO {
	private int pageNum;
	private int rowAmountPerPage;
	private String productid;
	private int qno;
	private String scope;
	private String startDate;
	private String endDate;
	
	public QnABoardPagingDTO() {
		this.pageNum = 1;
		this.rowAmountPerPage = 10;
	}
	
	public QnABoardPagingDTO(int pageNum) {
		if(pageNum <= 0) {
			this.pageNum = 1;
		} else {
			this.pageNum = pageNum;
		}
		this.rowAmountPerPage = 10;
	}
	
	public QnABoardPagingDTO(int pageNum, int rowAmountPerPage) {
		if(pageNum <= 0) {
			this.pageNum = 1;
		} else {
			this.pageNum = pageNum;
		}
		if(rowAmountPerPage <= 0) {
			this.rowAmountPerPage = 10;
		} else {
			this.rowAmountPerPage = rowAmountPerPage;
		}
		
	}
}

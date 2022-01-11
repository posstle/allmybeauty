package com.spring.allmybeauty.product.detail.paging;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
@EqualsAndHashCode
public class QBoardPagingDTO {
	private int pageNum;
	private int rowAmountPerPage;
	private int productid;
	
	public QBoardPagingDTO() {
		this.pageNum = 1;
		this.rowAmountPerPage = 3;
	}
	
	public QBoardPagingDTO(int pageNum) {
		if(pageNum <= 0) {
			this.pageNum = 1;
		} else {
			this.pageNum = pageNum;
		}
		this.rowAmountPerPage = 3;
	}
	
	public QBoardPagingDTO(int pageNum, int rowAmountPerPage) {
		if(pageNum <= 0) {
			this.pageNum = 1;
		} else {
			this.pageNum = pageNum;
		}
		if(rowAmountPerPage <= 0) {
			this.rowAmountPerPage = 3;
		} else {
			this.rowAmountPerPage = rowAmountPerPage;
		}
		
	}
}

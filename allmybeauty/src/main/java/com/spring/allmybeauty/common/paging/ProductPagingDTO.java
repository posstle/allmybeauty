package com.spring.allmybeauty.common.paging;


import lombok.Data;

@Data
public class ProductPagingDTO {
	
	private int pageNum;
	private int rowAmountPerPage;
	private String skintype;
	private String sortBy;
	private String keyword;
	private String category;
	private String subCategory;
	private String mid;
	private int delflag;
	
	public ProductPagingDTO() {
		this.pageNum = 1;
		this.rowAmountPerPage = 12;
	}
	
	public ProductPagingDTO(int pageNum) {
		if(pageNum<=0) {
			this.pageNum = 1;
		} else {
			this.pageNum = pageNum;
		}
		this.rowAmountPerPage = 12;
	}
	
	public ProductPagingDTO(int pageNum, int rowAmountPerPage) {
		if(pageNum<=0) {
			this.pageNum = pageNum;
		} else {
			this.pageNum = pageNum;
		}
		if(rowAmountPerPage<=0) {
			this.rowAmountPerPage = 12;
		} else {
			this.rowAmountPerPage = rowAmountPerPage;
		}
	}
}

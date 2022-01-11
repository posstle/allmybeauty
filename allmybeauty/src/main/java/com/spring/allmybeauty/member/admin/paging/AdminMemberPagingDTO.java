package com.spring.allmybeauty.member.admin.paging;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@EqualsAndHashCode
public class AdminMemberPagingDTO {
  
	private int pageNum;
	private int rowAmountPerPage;
	private String scope; 
	private String keyword;
	private String mid;
	
	public String[] getScopeArray() {
		return scope == null ? new String[] {} : scope.split("");
	}
	
	public AdminMemberPagingDTO() {
		this.pageNum = 1;
		this.rowAmountPerPage = 10;
	}
	
	public AdminMemberPagingDTO(int pageNum) {
		if(pageNum <= 0) {
			this.pageNum = 1;
		} else {
			this.pageNum = pageNum;
		}
		this.rowAmountPerPage = 10;
	}
	
	public AdminMemberPagingDTO (int pageNum, int rowAmountPerPage) {
		if(pageNum <= 0) {
			this.pageNum = 1;
		}else {
			this.pageNum = pageNum;
		}
		
		if(rowAmountPerPage <= 0) {
			this.rowAmountPerPage = 10;
		}else {
			this.rowAmountPerPage = rowAmountPerPage;
		}
	}
}

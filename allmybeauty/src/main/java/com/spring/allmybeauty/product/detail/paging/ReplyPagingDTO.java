package com.spring.allmybeauty.product.detail.paging;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
@EqualsAndHashCode
public class ReplyPagingDTO {
	
	private int productid;
	private Integer pageNum;
	private int rowAmountPerPage;
	
	public ReplyPagingDTO(int productid, Integer pageNum) {
		this.productid = productid;
		
		if(pageNum == null) {
			this.pageNum = 1;
		} else {
			this.pageNum = pageNum;
		}
		this.rowAmountPerPage = 3;
	}
}

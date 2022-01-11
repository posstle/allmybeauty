package com.spring.allmybeauty.mypage.paging;

import lombok.Data;

@Data
public class MyPagePagingCreatorDTO {

	private MyPagePagingDTO myPagePagingDTO;
	private int startPagingNum;
	private int endPagingNum;
	private boolean prev;
	private boolean next;
	private long rowAmountTotal;  //전체 행 개수
	private int pagingNumCnt;    //화면 하단에 표시할 기본 페이지 번호 개수(5)
	private int lastPageNum;


	public MyPagePagingCreatorDTO(long rowAmountTotal, MyPagePagingDTO myPagePagingDTO) {
		this.myPagePagingDTO = myPagePagingDTO;
		this.rowAmountTotal = rowAmountTotal;
		this.pagingNumCnt = 3;
		
		
		//계산된 끝 - 시작 페이징 번호
		this.endPagingNum = 
				(int)(Math.ceil(myPagePagingDTO.getPageNum() / (this.pagingNumCnt * 1.0)))  * this.pagingNumCnt;
		
		this.startPagingNum = this.endPagingNum - (this.pagingNumCnt -1);
		
		//행 총수를 기준으로 한 실제 마지막 페이지 번호 저장
		this.lastPageNum = (int)( Math.ceil( (rowAmountTotal * 1.0) / myPagePagingDTO.getRowAmountPerPage() ) );
		
		//계산된 끝 페이징 번호가 실제 마지막 페이지 번호보다 크면, endPagingNum 값을 lastPageNum 값으로 대체
		if(lastPageNum < this.endPagingNum) {
			this.endPagingNum = lastPageNum;
		}
		
		this.prev = this.startPagingNum > 1;
		this.next = this.endPagingNum < lastPageNum;
		
		System.out.println("전달된 페이징 기본 데이터 - myPagePagingDTO :" + myPagePagingDTO.toString());
		System.out.println("끝 페이징 번호 :" + this.endPagingNum);
		System.out.println("시작 페이징 번호 :" + this.startPagingNum);
		System.out.println("이전버튼 표시여부  :" + this.prev);
		System.out.println("다음버튼 표시여부 :" + this.next);
		System.out.println("마지막 페이지 번호 :" + this.lastPageNum);
		
	}
}

package com.spring.allmybeauty.mypage.paging;



import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
@EqualsAndHashCode 
public class MyPagePagingDTO {


	private int pageNum;                       //현재페이지 번호
	private int rowAmountPerPage;        // 페이지당 출력할 레코드 개수 
	private String mid;
	private Integer searchMonth;
	private String startDate;
	private String endDate;
	private long qno;

	private String uploadPath;
	private String uuid;
	private String fileName;
	private String repoPath = "C:\\myupload";


	
	//생성자를 통해 표시할 페이지번호와 페이지당 출력할 레코드 개수를 컨트롤러로 전달
	//생성자1 : mypageOrder.jsp가 처음 호출 시에 페이지 번호와 행수를 각각 1과 5로 전달 
	public MyPagePagingDTO() {
		this.pageNum = 1;
		this.rowAmountPerPage = 10;
	}
	
	// 생성자2: 목록 화면에서 페이징 번호 킬릭스 , 페이지 번호와 행수를 각각 사용자가 선택한 페이지 번호와 5로 전달 
	public MyPagePagingDTO(int pageNum) {
		

		
		if(pageNum <= 0) {
			this.pageNum = 1;
		}else {
			this.pageNum = pageNum;
		}
		
		this.rowAmountPerPage = 10;
	}
	
	// 생성자3 : 목록 화면에서 사용자가 표시할 행 수를 선택하고 페이징 번호 클릭시, 
	//페이지번호와 행수를 각각 사용자가 선택한 페이징번호와 표시행수로 전달 
	public MyPagePagingDTO(int pageNum, int rowAmountPerPage) {
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
	
	
	public MyPagePagingDTO(String mid , Integer pageNum) {
		this.mid = mid;
		
		if(pageNum == null) {
			this.pageNum = 1;
		}else {
			this.pageNum = pageNum;
		}
		
		this.rowAmountPerPage = 10;
	}
	
}

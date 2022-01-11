<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- jstl / c:if... 등 사용 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!--  fmt:fomrmatDate.. 형식 사용 -->
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!-- 스프링 시큐리티  -->

<%@ include file="../include/myheader.jsp"%>

<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

</head>


<style>
input:invalid {
	border: 1px solid red;
}

/*  .col-sm-offset-2 {
     	margin-left:80px;
     }
     
     li {
     	list-style: none;
     } */
li {
	list-style: none;
}

#aside {
	float: left;
	width: 200px;
	min-height: 250px;
}

#article {
	float: right;
	width: 100%;
	margin-left: -50px;
	padding-left: 50px;
}

.PostFile label {
	display: inline-block;
	padding: .5em .75em;
	color: #fff;
	font-size: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: #00BFFF;
	cursor: pointer;
	border: 1px solid #00BFFF;
	border-radius: .25em;
	-webkit-transition: background-color 0.2s;
	transition: background-color 0.2s;
}

.PostFile label:hover {
	background-color: #4682B4;
}

.PostFile label:active {
	background-color: #4682B4;
}

.PostFile input[type="file"] {
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
}

textarea {
	height: 40px;
	width: 300px;
	border-radius: 4px;
	font-size: 20px;
}

}
#productDesc {
	height: 40px;
	width: 300px;
	border-radius: 4px;
	font-size: 20px;
}

input[type=text] {
	height: 44px;
	width: 300px;
	font-size: 15px;
}

#insertWon {
	height: 30px;
	width: 150px;
	font-size: 18px;
	position: static;
	top: 10px;
	border-radius: 4;
	display: in-block;
}

#category {
	width: 200px;
	height: 35px;
}

.subcategory {
	width: 200px;
	height: 35px;
}

#skintypeid {
	width: 200px;
	height: 35px;
}

input::-webkit-input-placeholder {
	color: #00BFFF;
}

;
.pagination>.active>a, .pagination>.active>span, .pagination>.active>a:hover,
	.pagination>.active>span:hover, .pagination>.active>a:focus,
	.pagination>.active>span:focus {
	background: #BDBDBD;
	border-color: #000000;
}
or
:
 
white
;
</style>

<style type="text/css">
.module, .module-small {
	padding: 80px 60px;
}
</style>
</head>
<body>
	<div class="main">
		<section class="module">
			<div class="aside col-sm-2 col-md-2" id="aside">
				<div class="widget">
					<h5 class="widget-title font-alt">관리자메뉴</h5>
					<ul class="icon-list">
						<li><a href="${contextPath }/admin/main">메인페이지</a></li>
						<li><a href="${contextPath }/product/addproduct">상품등록</a></li>
						<li><a href="${contextPath }/product/productListForAdmin">상품리스트</a></li>
						<li><a href="${contextPath }/admin/adminmemberlist">회원관리</a></li>
						<li><a href="${contextPath }/QnABoard/adminNotice">고객센터관리</a></li>
					</ul>
				</div>
			</div>


			<div class="container" style=" position: absolute; left: 200px; top: 50px;">
	
					<div style="margin: 0 auto; ">
						<header>
							<h1 style="color: #2f4f4e; margin-top: 50px; margin-bottom: 43.98px; text-align: center;">회원관리</h1>
						</header>
					</div>


					<div class="col-12"  style="margin-left:35px;">

						<div style="float: left;">
							<span style="font-size: 15px; text-align: center; margin-right: 20px; float: left;"><strong>[
									전체 회원 수 &nbsp; <c:out
										value="${adminpagingCreator.rowAmountTotal }" />명]
							</strong></span><br>
						</div>

						<div >
							<!-- 회원 검색 -->
							<form class="form-inline" id="frmSendValue"
								action="${contextPath }/admin/adminmemberlist" method="get"
								name="frmSendValue"  >

								<div class="form-group" >
									<label class="sr-only">frmSendValues</label> <select
										class="form-control" id="selectAmount" name="rowAmountPerPage">
										<option value="10"
											<c:out value="${adminpagingCreator.adminMemberPagingDTO.rowAmountPerPage eq '10' 
                                                                          ? 'selected' : ''}"/>>10개</option>
										<option value="20"
											<c:out value="${adminpagingCreator.adminMemberPagingDTO.rowAmountPerPage eq '20' 
                                                                          ? 'selected' : ''}"/>>20개</option>
										<option value="50"
											<c:out value="${adminpagingCreator.adminMemberPagingDTO.rowAmountPerPage eq '50' 
                                                                          ? 'selected' : ''}"/>>50개</option>
										<option value="100"
											<c:out value="${adminpagingCreator.adminMemberPagingDTO.rowAmountPerPage eq '100' 
                                                                          ? 'selected' : ''}"/>>100개</option>

									</select> <select class="form-control" id="selectScope" name="scope">
										<option value=""
											<c:out value="${adminpagingCreator.adminMemberPagingDTO.scope == null 
                                                                          ? 'selected' : ''}"/>>검색범위</option>
										<option value="I"
											<c:out value="${adminpagingCreator.adminMemberPagingDTO.scope eq 'I' 
                                                                          ? 'selected' : ''}"/>>아이디</option>
										<option value="A"
											<c:out value="${adminpagingCreator.adminMemberPagingDTO.scope eq 'A' 
                                                                          ? 'selected' : ''}"/>>주소</option>
										<option value="N"
											<c:out value="${adminpagingCreator.adminMemberPagingDTO.scope eq 'N' 
                                                                          ? 'selected' : ''}"/>>이름</option>
									</select>

									<div class="input-group">
										<input class="form-control" id="inputKeyword" name="keyword"
											type="text" style="width: 250px; height: 35px;"
											placeholder="검색어를 입력하세요"
											value='<c:out value="${adminpagingCreator.adminMemberPagingDTO.keyword}" />' />&nbsp;
										<span class="input-group-btn">
											<!-- 전송버튼 -->
											<button class="btn btn-d btn-round" type="button"
												id="btnSearchGo">
												검색 &nbsp;<i class="fa fa-search"></i>
											</button>
										</span>
									</div>

									<div class="input-group">
										<button id="btnReset" class="btn btn-d btn-round" type="reset">검색초기화</button>
									</div>

								</div>

								<input type='hidden' name='mid' class="AdminMember_mid"
									value="${adminpagingCreator.adminMemberPagingDTO.mid }">
								<input type='hidden' name='pageNum'
									value="${adminpagingCreator.adminMemberPagingDTO.pageNum }">
								<input type='hidden' name='lastPageNum'
									value="${adminpagingCreator.lastPageNum }">

							</form>
						</div>
					</div>

					<hr class="my-hr2">



					<div class="row">
						<div class="col-sm-2">
							<ul class="list-group">
								<li>
									<h6>
										<a href="${contextPath }/admin/adminnewmemberlist">신규회원목록</a>
									</h6>
									<hr>
								</li>


								<li>
									<h6>
										<a href=" ${contextPath }/admin/adminmemberlist">회원정보조회</a>
									</h6>
									<hr>
								</li>

								<li>
									<h6>
										<a href="${contextPath }/admin/admindeletelist">회원탈퇴관리</a>
									</h6>
									<hr>
								</li>
							</ul>
						</div>

						<div class="col-sm-8" style="text-align: center; ">
							<table class="table table-striped table-border checkout-table">
								<thead>
									<tr>
										<th scope="col" style="text-align: center;"><strong>아이디</strong></th>
										<th scope="col" style="text-align: center;"><strong>이름</strong></th>
										<th scope="col" style="text-align: center;"><strong>전화번호</strong></th>
										<th scope="col" style="text-align: center;"><strong>주소</strong></th>
										<th scope="col" style="text-align: center;"><strong>가입일</strong></th>
										<th scope="col" style="text-align: center;"><strong>관리</strong></th>
									</tr>
								</thead>

								<tbody>

									<c:forEach items="${AdminMemberList}" var="adminmember">
										<%-- <tr class="MemberMid" data-mid ='<c:out value="${adminmember.mid}"/>'>	   --%>
										<tr>
											<td><span>${adminmember.mid }</span></td>
											<td><span>${adminmember.mname }</span></td>
											<td><span>${adminmember.mphone }</span></td>
											<td><span>${adminmember.maddress  }
													${adminmember.mdetailAddress} </span></td>
											<td><span><fmt:formatDate pattern="yyyy/MM/dd"
														value="${adminmember.mregDate}" /></span></td>
											<td>
												<button type="button"
													class="btn btn-default btn-circle btn-xs modify_btn"
													data-mid="${adminmember.mid}">수정</button>
											</td>
										</tr>

									</c:forEach>

								</tbody>
							</table>

							<!--  			    <form class="formMember" id="frmMember" name="frmMember">
   			      <input type="hidden" name="mid" class="AdminMember_mid"> 

   			    </form>  -->


						</div>

					</div>

					<%-- Pagination 시작 --%>
					<div class='text-center'>
						<ul class="pagination pagination-sm">

							<c:if test="${adminpagingCreator.prev }">
								<li class="paginate_button previous"><a href="1">&laquo;</a>
								</li>
							</c:if>

							<c:if test="${adminpagingCreator.prev}">
								<li class="paginate_button previous"><a
									href="${adminpagingCreator.startPagingNum - 1 }">이전</a></li>
							</c:if>

							<c:forEach var="pageNum"
								begin="${adminpagingCreator.startPagingNum}"
								end="${adminpagingCreator.endPagingNum}">
								<%-- 선택된 숫자의 경우, Bootstrap의 active 클래스 이름 추가 --%>
								<li
									class='paginate_button ${adminpagingCreator.adminMemberPagingDTO.pageNum == pageNum ? "active":"" }'>
									<a href="${pageNum}">${pageNum}</a>
								</li>
							</c:forEach>

							<c:if test="${adminpagingCreator.next }">
								<li class="paginate_button next"><a
									href="${adminpagingCreator.endPagingNum + 1 }">다음</a></li>
							</c:if>

							<c:if test="${adminpagingCreator.next }">
								<li class="paginate_button next"><a
									href="${adminpagingCreator.lastPageNum}">&raquo;</a></li>
							</c:if>
						</ul>

					</div>

					<%-- Pagination 끝 --%>


			</div>

		</section>
	</div>
	<!-- /main -->
</body>


<script type="text/javascript">
	var frmSendValue = $("#frmSendValue");

	// 페이징
	$(".paginate_button a").on("click", function(e) {

		e.preventDefault();
		frmSendValue.find("input[name='pageNum']").val($(this).attr("href"));

		// alert(frmMyPageOrderValue.find("input[name='pageNum']").val());

		frmSendValue.attr("action", "${contextPath}/admin/adminmemberlist");

		frmSendValue.attr("method", "get");
		frmSendValue.submit();

	});

	// 회원 수정페이지 
	$(".modify_btn").on("click", function(e) {
		e.preventDefault();

		mid = $(this).data("mid");
		$(".AdminMember_mid").val(mid);

		//alert(mid);

		frmSendValue.attr("action", "${contextPath}/admin/adminmodify");
		frmSendValue.attr("method", "get");
		frmSendValue.submit();

	});
<%-- 검색 관련 요소의 이벤트 처리   --%>
	
<%-- 표시 행수 변경 --%>
	$("#selectAmount").on("change", function() {
		frmSendValue.find("input[name='pageNum']").val(1);
		frmSendValue.attr("action", "${contextPath}/admin/adminmemberlist");
		frmSendValue.attr("method", "get");
		frmSendValue.submit();
	});
<%-- 검색 버튼 클릭 이벤트 --%>
	$("#btnSearchGo")
			.on(
					"click",
					function(e) {
						if (!$("#selectScope").find("option:selected").val()) {
							alert("검색범위를 선택하세요");
							return false;
						}

						if (!((frmSendValue.find("input[name='keyword']").val()) || (frmSendValue
								.find("input[name='keyword']").val() != ""))) {
							alert("검색어를 입력하세요");
							return false;
						}
						frmSendValue.find("input[name='pageNum']").val("1");
						frmSendValue.submit();
					});
<%-- 검색초기화 버튼 --%>
	$("#btnReset").on("click", function() {
		$("#selectAmount").val(10);
		$("#selectScope").val("");
		$("#inputKeyword").val("");
		$("#hiddenPageNum").val(1);
		$("#hiddenLastPageNum").val("");
		frmSendValue.submit();
	});
</script>



</html>
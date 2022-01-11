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


			<div class="container" style=" position: absolute; left: 220px; top: 50px;">

				<div>
					<div style="margin: 0 auto; ">
						<header>
							<h1 style="color: #2f4f4e; margin-top: 50px; margin-bottom: 43.98px; text-align: center;">탈퇴회원관리</h1>
						</header>
					</div>


					<hr class="my-hr2">

					<div class="row">
						<div class="col-sm-2">
							<ul>
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

						<div class="col-sm-8" style="text-align: center;">
					           <table class="table table-striped table-border checkout-table">
				                  <thead>
				                    <tr>
				                     <th scope="col" style="text-align: center;">
				                          <input id="allCheck" type="checkbox" name="allCheck"/>
				                      </th>
				                      <th scope="col" style="text-align: center;"><strong>아이디</strong></th>
				                      <th scope="col" style="text-align: center;"><strong>이름</strong></th>
				                      <th scope="col" style="text-align: center;"><strong>전화번호</strong></th>
				                      <th scope="col" style="text-align: center;"><strong>주소</strong></th>
				                      <th scope="col" style="text-align: center;"><strong>가입일</strong></th>
				                     </tr>
				                  </thead>  

								<tbody>

								       <c:forEach items="${AdminMemberDeleteList}" var="adminmemberdel">                    
					                      <tr>
					
					                            <td>
					                                <input name="midCheck" type="checkbox" value="${adminmemberdel.mid }"/>
					                             </td>
							         	         <td>
							         	              <span>${adminmemberdel.mid }</span>
							         	         </td>
							         	         <td>
							         	             <span>${adminmemberdel.mname }</span>
							         	         </td>           	         		                               
							         	         <td>
							         	              <span>${adminmemberdel.mphone }</span>
							         	         </td>       
							         	         <td>
							         	              <span>${adminmemberdel.mdetailAddress} </span>
							         	         </td>
							         	         
							         	         <td>
							         	               <span><fmt:formatDate pattern="yyyy/MM/dd" value="${adminmemberdel.mregDate}"/></span>
							         	         </td>
								          </tr>
					 		               		              
					                    </c:forEach>   

								</tbody>
							</table>
                                    <input type="button" value="선택삭제"	class="btn btn-outline-info" onclick="deleteValue();"/>	

						</div>

					</div>

         <%-- Pagination 시작 --%>                   
                <div class='text-center' >
                    <ul class="pagination pagination-sm">
                    
                        <c:if test="${adminpagingCreator.prev }">
                            <li class="paginate_button previous">
                                <a href="1">&laquo;</a>
                             </li>
                        </c:if>
                        
                        <c:if test="${adminpagingCreator.prev}">
                        	<li class="paginate_button previous">
                        	    <a href="${adminpagingCreator.startPagingNum - 1 }">이전</a>
                        	 </li>
                        </c:if>
                        
                        <c:forEach var="pageNum" begin="${adminpagingCreator.startPagingNum}" end="${adminpagingCreator.endPagingNum}">
							<%-- 선택된 숫자의 경우, Bootstrap의 active 클래스 이름 추가 --%>
							<li class='paginate_button ${adminpagingCreator.adminMemberPagingDTO.pageNum == pageNum ? "active":"" }'>
							 		<a href="${pageNum}">${pageNum}</a>
							</li>
							</c:forEach>

                           <c:if test="${adminpagingCreator.next }">
                              <li class="paginate_button next">
                                  <a href="${adminpagingCreator.endPagingNum + 1 }">다음</a>   
                              </li>
                           </c:if>
                           
                           <c:if test="${adminpagingCreator.next }">
                           	    <li class="paginate_button next">
                           	       <a href="${adminpagingCreator.lastPageNum}">&raquo;</a>
                           	     </li>
                           </c:if>                                                                        
                       </ul>                        
                </div> 
               <%-- Pagination 끝 --%>
		    </div>

			</div>

		</section>
	</div>
	<!-- /main -->
</body>


<script type="text/javascript">
 
var csrfHeaderName = "${_csrf.headerName}";
var csrfTokenValue = "${_csrf.token}";
    console.log("csrfHeaderName: "+ csrfHeaderName);
    console.log("csrfTokenValue: "+ csrfTokenValue);
$(document).ajaxSend(function(e, xhr, options){
    xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
});


var frmMyPageboardValue = $("#frmMyPageboardValue");


// 페이징
 $(".paginate_button a").on( "click", function(e) {

	 e.preventDefault();
	 frmMyPageboardValue.find("input[name='pageNum']").val($(this).attr("href"));
	 
	// alert(frmMyPageOrderValue.find("input[name='pageNum']").val());
	 
	 frmMyPageboardValue.attr("action", "${contextPath}/admin/admindeletelist");
	 
	 frmMyPageboardValue.attr("method","get");
	 frmMyPageboardValue.submit();
	
 });
 

// 체크박스 선택 
$(function(){
	 var chkobj = document.getElementsByName("midCheck");
	 var rowCnt = chkobj.length;
	 
	 
	 $("input[name='allCheck']").click(function(){
		 var chk_listArr = $("input[name='midCheck']");
		 for(var i = 0 ; i < chk_listArr.length; i++){
			 chk_listArr[i].checked = this.checked;
		 }
	 });
	 
	 $("input[name='midCheck']").click(function(){
		 if($("input[name='midCheck']:checked").length == rowCnt){
			 $("input[name='allCheck']")[0].checked = true;
		 }else{
			 $("input[name='allCheck']")[0].checked= false;
		 }
	 });
});

// 회원 삭제
function deleteValue(){
	var url="${contextPath}/admin/admindelete";
	var valueArr = new Array();
	var list = $("input[name='midCheck']");
	
	for(var i = 0; i < list.length; i++){
		if(list[i].checked){
			valueArr.push(list[i].value);
		}
	}
	if(valueArr.length == 0){
		alert("선택된 아이디가 없습니다.");
	}else {
		if(!confirm("회원을 삭제하시겠습니까?")){
			return;
		}			
		$.ajax({
			url : url,
			type :'post',
			traditional : true,
			data : {
				valueArr : valueArr
			},
			success : function(jdata){
				if(jdata = 1){
					alert("삭제 성공");
					location.replace("${contextPath}/admin/admindeletelist")
				}else{
					alert("삭제 실패");
				}
			}
		})
	}
	
}

 
 </script>
  
  
  
</html>
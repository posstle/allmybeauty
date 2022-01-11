<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<%@ include file="../include/myheader.jsp" %>
<sec:authentication property="principal" var="principal"/>
<head>
<style type="text/css">
.module, .module-small {
	padding: 80px 60px;
}

</style>
</head>

<sec:authorize access="hasRole('ROLE_ADMIN')">
 		<section class="module">
 		<div>
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
         </div>
         
          <div class="container" style="margin:0 auto;">

              <div class="col-sm-8 col-sm-offset-2">
				
                   <!-- 공지사항 -->
                    <div class="Notice" style="float: left;">
              	         <header>
             			 <h1 style="color: #2f4f4e; margin-top: 50px; text-align: center;">공지사항관리</h1>
        				 </header>
						<div id="page-wrapper">
							<div class="row">
								<div class="col-lg-12" >
									<div class="btn-group " role="group" aria-label="..." style="float: right;">
										  <div class="btn-group" role="group" >
										    <button id="write" type="button" class="btn btn-default btn-lg" style="color:#2f4f4e; font-size: 15px;"><strong><span class="glyphicon glyphicon-pencil">글쓰기</span></strong></button>   
										  </div>
				                  	</div>
								 <div class="btn-group btn-group-justified" role="group" aria-label="..." >
								 		  <div class="btn-group" role="group" >
										    <button id="noticeBtn" type="button" class="btn btn-default btn-lg" style="color:#2f4f4e; font-size: 15px;"><strong>공지사항관리</strong></button>   
										  </div>
										  <div class="btn-group" role="group" >
										    <button id="customerBtn" type="button" class="btn btn-default btn-lg" style="color:#2f4f4e; font-size: 15px;"><strong>고객문의관리</strong></button>   
										  </div>
										  <div class="btn-group" role="group">
										    <button  id="deleteAll" type="button" class="btn btn-default btn-lg" style="color:#2f4f4e; font-size: 15px;"><strong>고객삭제글관리</strong></button> 
										  </div>
									</div>
									<div class="panel panel-default">
										
											<table class="table table-striped table-bordered table-hover" style="width:100%;text-align:center; border: 3px solid #22d3d6 " >
											<thead style="background-color: #22d3d6">
												<tr>
													<th style="width:7%;text-align:center; color: white;">No.</th>
													<th style="width:60%;text-align:center; color: white;">제목</th>
													<th style="width:10%;text-align:center; color: white;">작성자</th>
													<th style="width:15%;text-align:center; color: white;">게시일</th>
													<th style="width:18%;text-align:center;"><button id="deleteBtn">삭제</button></th>
													
												</tr>
											</thead>
											
											<tbody>
												<c:forEach items="${NoticesList}" var="Notices" varStatus="status">
												<c:set var="i" value="${pagingNCreator.rowAmounTotal - (10 * (pagingNCreator.qnaPagingDTO.pagingNum-1)) }" />
													<tr   style="cursor: pointer;">
														<td class="NoticesDetail" data-bno='<c:out value="${Notices.bno}"/>' style="width:7%;text-align:center;"> <c:out value="${i -status.index}"/></td>
														<td class="NoticesDetail" data-bno='<c:out value="${Notices.bno}"/>' style="width:50%;text-align:center;"><c:out value="${Notices.btitle}"/></td>
														<td class="NoticesDetail" data-bno='<c:out value="${Notices.bno}"/>'style="width:10%;text-align:center;"><c:out value="${Notices.mid}"/></td>
														<td class="NoticesDetail" data-bno='<c:out value="${Notices.bno}"/>'style="width:15%;text-align:center;"><fmt:formatDate pattern="yyyy/MM/dd" value="${Notices.bmoddate}"/></td>
														<td  style="width:10%;text-align:center;"><input type="checkbox" name="delete" value="<c:out value="${Notices.bno}"/>" /></td>
													</tr>
												</c:forEach>
											</tbody>
											
											</table><%-- /.table-responsive --%>
											
											
									<%--Pagination 시작 --%>
										<div class="pull-right">
										  <ul class="pagination pagination-sm">
										  
											  <c:if test="${pagingNCreator.prev }">
												   <li class="paginate_button previous">
												      <a href="1">&laquo;</a>
												   </li>
											  </c:if>
											  <c:if test="${pagingNCreator.prev }">
												   <li class="paginate_button previous">
												      <a href="${pagingNCreator.startPagingNum -1 }">이전</a>
												   </li>
											  </c:if>
											  <c:forEach var="pageNum" begin="${pagingNCreator.startPagingNum }" end="${pagingNCreator.endPagingNum }">
											  
											    <li class='paginate_button ${pagingNCreator.qnaPagingDTO.pagingNum == pageNum ? "active":""}'>
											      <a href="${pageNum }" >${pageNum }</a>
											    </li>
										     </c:forEach>
										     
										     <c:if test="${pagingNCreator.next }">
											 	  <li class="paginate_button next">
												   		<a href="${pagingNCreator.endPagingNum + 1 }">다음</a>
												   </li>
										     </c:if>
										   	 <c:if test="${pagingNCreator.next }">
											 	  <li class="paginate_button next">
												   		<a href="${pagingNCreator.lastPagingNum}">&raquo;</a>
												   </li>
										     </c:if>
										  </ul>
										</div>
											
												
									</div><%-- /.panel --%>
								</div><%-- /.col-lg-12 --%>
							</div><%-- /.row --%>
						</div><%-- /#page-wrapper --%>              			
              </div>
            </div>
          </div>
         
        </section>
 		</sec:authorize>    

<form id="frmSendValue">
	<input type='hidden' name='pagingNum' value='${pagingNCreator.qnaPagingDTO.pagingNum}'> 
 	<input type='hidden' name='rowAmountPerPage' value='${pagingNCreator.qnaPagingDTO.rowAmountPerPage}'>
	 <input type='hidden' name='lastPagingNum' value='${pagingNCreator.lastPagingNum}'>
</form>

<form id="frmSendValue">

</form>

<script type="text/javascript">
$(document).ready(function(){


});

var frmSendValue =$("#frmSendValue")


$("#write").on("click", function(e) {
	
	frmSendValue.append("<input type='hidden' name='divide' value='N'/>");
	frmSendValue.attr("action", "${contextPath}/QnABoard/register");
	frmSendValue.attr("method", "get");
	frmSendValue.submit();
});

$(".NoticesDetail").on("click", function(e) {

	frmSendValue.append("<input type='hidden' name='bno' value='"+$(this).data("bno")+"'/>");
	frmSendValue.append("<input type='hidden' name='divide' value='N'/>");
	frmSendValue.attr("action", "${contextPath}/QnABoard/detail");
	frmSendValue.attr("method", "get");
	frmSendValue.submit();
	
});

$("#noticeBtn").on("click", function () {

	frmSendValue.empty();
	frmSendValue.attr("action", "${contextPath}/QnABoard/adminNotice");
	frmSendValue.attr("method", "get");
	frmSendValue.submit();
});


 $("#customerBtn").on("click", function () {

	frmSendValue.empty();
	frmSendValue.append("<input type='hidden' name='divide' value='C'/>");
	frmSendValue.attr("action", "${contextPath}/QnABoard/adminCustomer");
	frmSendValue.attr("method", "get");
	frmSendValue.submit();
});
 
 $("#deleteAll").on("click", function(){
	 	
		frmSendValue.empty();
		frmSendValue.append("<input type='hidden' name='divide' value='C'/>");
		frmSendValue.attr("action", "${contextPath}/QnABoard/delCustomer");
		frmSendValue.attr("method", "get");
		frmSendValue.submit();

	 	
	 });
 
 <%-- 삭제구현 --%> 
 $("#deleteBtn").on("click", function () {
 	
 	var cnt =$("input:checkbox[name='delete']:checked").length;

 	
 	if(cnt === 0){
 		
 		alert("삭제할 게시물을 선택해주세요.");
 		return;
 	}
 	
 	frmSendValue.empty();
  	$("input:checkbox[name='delete']:checked").each(function(){

  		frmSendValue.append("<input type='hidden' name='bno' value='"+$(this).val()+"'/>");

 	});

  	frmSendValue.append('<sec:csrfInput />');
 	frmSendValue.attr("method", "post");
 	frmSendValue.attr("action", "${contextPath}/QnABoard/delete");
 	frmSendValue.submit();
  
 });
 
 <%-- 페이징 화면 이동--%>
 $(".paginate_button a").on("click", function(e) {
 	e.preventDefault();
 	
 	frmSendValue.find("input[name='pagingNum']").val($(this).attr("href"));
 	frmSendValue.attr("action", "${contextPath}/QnABoard/adminNotice");
 	frmSendValue.attr("method", "get");
 	frmSendValue.submit();
 });



</script>

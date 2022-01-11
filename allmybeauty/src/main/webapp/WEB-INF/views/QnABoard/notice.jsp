<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<%@ include file="../include/myheader.jsp" %>
<head>
<style type="text/css">
.module {
	padding: 100px 0;
}

</style>
</head>
	
	<c:if test="${pagingNCreator.qnaPagingDTO.pagingNum ==1 }">
      <section class="module faq-page-header" data-background="${contextPath}/resources/images/QnA/camille-brodard-224_Fws32Z8-unsplash1.jpg">
          <div class="container">
            <div class="row">
              <div class="col-sm-6 col-sm-offset-3">
                <h1 class="module-title font-alt" style="font-size: xx-large;color: #2f4f4e"><strong>고객센터</strong></h1>
                <div class="module-subtitle font-serif" style=" font-size:large ;color: #2f4f4e"><strong>항상 고객님을 먼저 생각하는 All My Beauty 입니다.</strong></div>
              </div>
            </div>
          </div>
        </section>
        	
      </c:if>

 		<section class="module" data-background="${contextPath}/resources/images/QnA/sarah-dorweiler-9Z1KRIfpBTM-unsplash.jpg">

		        <div class="btn-group btn-group-justified" role="group" aria-label="..."  >
					  <div class="btn-group" role="group" >
					    <button id="noticeBtn" type="button" class="btn btn-default btn-lg" style="color:#2f4f4e; font-size: 15px;"><strong>공지사항</strong></button>   
					  </div>
					  <div class="btn-group" role="group">
					    <button  id="customerBtn" type="button" class="btn btn-default btn-lg" style="color:#2f4f4e; font-size: 15px;"><strong>고객문의</strong></button> 
					  </div>
				</div>

         <h1 style="text-align: center; color: #2f4f4e; margin-top: 50px; margin-bottom: 100px;">공지사항</h1>
          <div class="container">
            <div class="row">
             
              <div class="col-sm-8 col-sm-offset-2">

                   <!-- 공지사항 -->
                   
                    <div class='Notice'>
                 		
                      <div class="panel-group" id="accordion">
                  
						<div id="page-wrapper">
							<div class="row">
								<div class="col-lg-12">
								 
									<div class="panel panel-default">
										
											<table class="table table-striped table-bordered table-hover" style="width:100%;text-align:center; border: 3px solid #22d3d6 " >
											<thead style="background-color: #22d3d6">
												<tr>
													<th style="width:7%;text-align:center; color: white;">No.</th>
													<th style="width:68%;text-align:center; color: white;">제목</th>
													<th style="width:10%;text-align:center; color: white;">작성자</th>
													<th style="width:15%;text-align:center; color: white;">게시일</th>
												</tr>
											</thead>
											
											<tbody>
												<c:forEach items="${NoticesList}" var="Notices" varStatus="status">
												<c:set var="i" value="${pagingNCreator.rowAmounTotal - (10 * (pagingNCreator.qnaPagingDTO.pagingNum-1)) }" />
													<tr class="NoticesDetail" data-bno='<c:out value="${Notices.bno}"/>' style="cursor: pointer;">
														<td style="width:7%;text-align:center;"> <c:out value="${i -status.index}"/></td>
														<td style="width:50%;text-align:center;"><c:out value="${Notices.btitle}"/></td>
														<td style="width:10%;text-align:center;"><c:out value="${Notices.mid}"/></td>
														<td style="width:15%;text-align:center;"><fmt:formatDate pattern="yyyy/MM/dd" value="${Notices.bmoddate}"/></td>
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

                    </div><!-- 공지사항 -->

              </div>
            </div>
          </div>
          </div>
        </section>


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
	frmSendValue.attr("action", "${contextPath}/QnABoard/notice");
	frmSendValue.attr("method", "get");
	frmSendValue.submit();
});


 $("#customerBtn").on("click", function () {

	frmSendValue.empty();
	frmSendValue.append("<input type='hidden' name='divide' value='C'/>");
	frmSendValue.attr("action", "${contextPath}/QnABoard/customer");
	frmSendValue.attr("method", "get");
	frmSendValue.submit();
});
 


 <%-- 페이징 화면 이동--%>
 $(".paginate_button a").on("click", function(e) {
 	e.preventDefault();
 	
 	frmSendValue.find("input[name='pagingNum']").val($(this).attr("href"));
 	frmSendValue.attr("action", "${contextPath}/QnABoard/notice");
 	frmSendValue.attr("method", "get");
 	frmSendValue.submit();
 });



</script>
<%@ include file="../include/myfooter.jsp" %>
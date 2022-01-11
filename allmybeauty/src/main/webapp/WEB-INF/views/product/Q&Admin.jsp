<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../include/myheader.jsp" %>
<c:set var = "contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    	<link rel="shortcut icon" href="#">
		<link id="Q&AList" href="${contextPath }/resources/css/Q&AList.css" rel="stylesheet">
		<link id="Q&AList" href="${contextPath }/resources/css/form.css" rel="stylesheet">
	</head>
	
	<body>
		<div id="QnaSelectD" name="scope">
	       	<ul id="QnASelect">
	       		<li class="QnASelectL">전체보기</li>
	       		<li class="QnASelectL" value = 1>답변완료</li>
	       		<li class="QnASelectL" value = 2>답변대기</li>
	       	</ul>
	       </div>
		
			<form class="pull-right QnADate">
				<input type="date" id="startDate" name="startDate"/>						   
				<span class="des">&nbsp;&nbsp;~&nbsp;&nbsp;</span>							   
				<input type="date"  id="endDate" name="endDate"/>
				<input type="reset">
				<button type="button" class="btnSearch" style="background-color:#9BCE26; border:0; outline:0;">조회</button>
		
			</form>
		<table id="QnATable"> 
	        <thead>
	            <tr id = "QnAH">
	                <th style="text-align: center;">답변 상태</th>
	                <th style="text-align: center;">번호</th>
	                <th style="text-align: center;">내용</th>
	                <th style="text-align: center;">작성자</th>
	                <th style="text-align: center;">작성일</th>
	                <th style="text-align: center;">삭제</th>
	            </tr>
	        </thead>
	        <tbody id = "QnABody">
	            <c:forEach var="QnAListQboard" items="${QnAListQboard }">
	            		<tr class="moveDetail" data-qno = '<c:out value="${QnAListQboard.qno }"/>'>
	            			<c:choose>
	            				<c:when test="${QnAListQboard.qanswerno == 1 }">
	            					<td style="width: 150px;"><span class="QnAresult" id = "QnAFin">답변완료</span></td>
	            				</c:when>
	            				<c:otherwise>
	            					<td style="width: 150px;"><span class="QnAresult" id = "QnAWait">답변대기</span></td>
	            				</c:otherwise>
	            			</c:choose>
	            			
	            			<td class="QnAQno" style="width: 200px;"><c:out value="${QnAListQboard.qno }"/></td>
	            			
	            			<c:choose>	
								<c:when test="${fn:length(QnAListQboard.qcontent) > 10 }">
									<td class="QnAQcontent" style="width: 350px;"><c:out value="${fn:substring(QnAListQboard.qcontent, 0, 9)}"/>...</td>
								</c:when>
								<c:otherwise>
									<td class="QnAQcontent" style="width: 350px;"><c:out value="${QnAListQboard.qcontent}"/></td>
								</c:otherwise>
							</c:choose>	
	            			
	            			<td class="QnAMid" style="width: 200px;"><c:out value="${QnAListQboard.mid}"/></td>
	            			<td class="QnADate" style="width: 190px;"><fmt:formatDate pattern="yyyy년 MM월 dd일 HH시 mm분" value="${QnAListQboard.qdate }"/></td>
	            			<td class="QnARem" onclick="event.cancelBubble = true;	" style="width: 150px;">삭제</td>
	            		</tr>
	            	
	            </c:forEach>
	        </tbody>
	    </table>
		<div id="buttonload">
					<div id= "pagebutton">
					<div class="text-center">
					  <ul class="pagination pagination-sm pageNum">
					  
					  <c:if test="${QnAboardPagingCreator.prev}">
					    <li class="paginate_button previous">
					      <a href="1">&laquo;</a>
					    </li>					  
					  </c:if>
					  
					  <c:if test="${QnAboardPagingCreator.prev}">
					    <li class="paginate_button previous">
					      <a href="${QnAboardPagingCreator.startPagingNum - 1 }">이전</a>
					    </li>					  
					  </c:if>
					  
					  <c:forEach var="pageNum" begin="${QnAboardPagingCreator.startPagingNum }" end="${QnAboardPagingCreator.endPagingNum }">
					  	<li class='paginate_button ${QnAboardPagingCreator.qnAboardPaging.pageNum == pageNum ? "active" : "" }'>
					  		<a href="${pageNum }">${pageNum }</a>
					  	</li>
					  </c:forEach>
					  
					  <c:if test="${QnAboardPagingCreator.next}">
					    <li class="paginate_button next">
					      <a href = "${QnAboardPagingCreator.endPagingNum + 1 }">다음</a>				      
					    </li>					  
					  </c:if>
					  
					  <c:if test="${QnAboardPagingCreator.next}">
					    <li class="paginate_button next">
					      <a href="${QnAboardPagingCreator.lastPageNum }">&raquo;</a>
					    </li>					  
					  </c:if>
					  </ul>
				</div>
				</div>
				</div> 
				
				<!-- 페이징 목록 변경 -->
				<form id="frmQnAboard">
					<input type='hidden' name='productid' value='${QnAboardPagingCreator.qnAboardPaging.productid }'>
					<input type='hidden' name='pageNum' value='${QnAboardPagingCreator.qnAboardPaging.pageNum }'>
					<input type='hidden' name='rowAmountPerPage' value='${QnAboardPagingCreator.qnAboardPaging.rowAmountPerPage}'>
					<input type='hidden' name='lastPageNum' value='${QnAboardPagingCreator.lastPageNum }'>
					<input type='hidden' name='startDate' value=''>
					<input type='hidden' name='endDate' value=''>
					<input type='hidden' name='scope' value=''>
				</form>
				
				<!-- Q&A 구분 클릭 시 -->
				<form id="frmQnAScope">
					<input type='hidden' name='productid' value='${QnAboardPagingCreator.qnAboardPaging.productid }'>
					<input type='hidden' name='scope' value=''>
				</form>
				
		<!-- Q&A 답변대기 모달 -->
        <div class="modalq hidden">
       		<div class="modal__overlay"></div>
        		<div class="modal-header"></div>
        			<!-- <div class="modal__content"> -->
        	<form id="frmQnAdmin" class="modal__content" name="QnAdmin">
            	<h1 class="ptit">상품 Q&amp;A 답변 </h1>
            	상품번호 : <input type="text" name="productid"  class="QnAPro" value="${QnAboardPagingCreator.qnAboardPaging.productid }"/>
            	작성자 : <input type="text" name="Cmid" class="QnAcmid">
            	글 번호 : <input type="text" name="qrno" class="QnAcqno">

            <div class="reviews-writeQnA">
            	<h4>문의 내용</h4>
                <textarea cols="5" rows="1" name="QnAcqcon" class="QnAcqcon"  readonly="readonly"></textarea>
            </div>
            
             <div class="reviews-writeQnA">
            	<h4>답변 내용</h4>
                <textarea cols="5" rows="1" name="qcontent" class="QnAnswer"  placeholder="답변 내용을 입력해주세요"></textarea>
            </div>
            
            <div class="btnGroup">
                <button id="BQnAC" type="button">취소</button>
                <button id="BQnAE" type="button">답변 등록</button>
            </div>
            
            <!-- 관리자 mid -->
            <input type="hidden" name="mid" class="QnAdmin" value="admin">
            <input type="hidden" name="scope" class="QnaScope" value="">
            <sec:csrfInput />
       	 	</form>
       	 	<!-- </div> -->
    		</div><!-- 모달 끝 -->

</body>
<script type="text/javascript">
		var csrfHeaderName = "${_csrf.headerName}";
		var csrfTokenValue = "${_csrf.token}";
		
		$(document).ajaxSend(function(e, xhr, options){
			xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
		});

		var frmQnAboard = $("#frmQnAboard");
		var frmQnAScope = $("#frmQnAScope");
		var frmQnAdmin = $("#frmQnAdmin");
		
		$(".paginate_button a").on("click", function(e){
			e.preventDefault();
			frmQnAboard.find("input[name='pageNum']").val($(this).attr("href"));
			frmQnAboard.attr("action", "${contextPath}/product/Q&Admin");
			frmQnAboard.attr("method", "get");
			frmQnAboard.submit();
		});
		
		/* 기간 검색 */
		$(".btnSearch").on("click", function(){
			var startDate = $("#startDate").val();
			console.log("startDate : " + startDate);
			frmQnAboard.find("input[name='startDate']").val(startDate);
			
			var endDate = $("#endDate").val();
			console.log("endDate : " + endDate);
			frmQnAboard.find("input[name='endDate']").val(endDate);
			
			var result = new URLSearchParams(location.search);
			var scope= result.get('scope');
			frmQnAboard.find("input[name='scope']").val(scope);
			
			frmQnAboard.attr("action", "${contextPath}/product/Q&Admin");
			frmQnAboard.attr("method", "get");
			frmQnAboard.submit();
		});
		
		$(".QnASelectL").on("click", function(){
			var scope = $(this).val();
			frmQnAScope.find("input[name='scope']").val(scope);
			//alert(frmQnAScope.find("input[name='scope']").val());
			frmQnAScope.attr("action", "${contextPath}/product/Q&Admin");
			frmQnAScope.attr("method", "get");
			frmQnAScope.submit();
		})
		
/* 		$(document).on("click", ".moveDetail", function(){
			$(".modalq").removeClass("hidden");
			var productid = $(".QnAPro").val();
			
			var str = "";
			var tdArray = new Array();
			
			var tr = $(this);
			var td = tr.children();
			 
			var QnAresult = td.eq(0).text();
			console.log("QnAresult : " + QnAresult);
			
			var QnAQno = td.eq(1).text();
			$(".QnAcqno").val(QnAQno);
			console.log("QnAQno : " + QnAQno);
			
			$.ajax({
				type : 'post',
				url : '/allmybeauty/product/selectQboard',
				data : 	{productid : productid,
						qno : QnAQno},
				dataType : 'text',
				success : function(result){
					$(".QnAcqcon").val(result);
					console.log('text : ' + result);
				}
			});
			
			var QnAMid = td.eq(3).text();
			$(".QnAcmid").val(QnAMid);
			console.log("QnAMid : " + QnAMid);
			
			var QnADate = td.eq(4).text();
			console.log("QnADate : " + QnADate);
			
			var result = new URLSearchParams(location.search);
			var scope= result.get('scope');
			console.log("scope :" + scope);
			frmQnAdmin.find("input[name='scope']").val(scope);
		}); */
		
		/* 답변 보기 */
		$(document).on("click", ".moveDetail", function(){
			$(".modalq").removeClass("hidden");
			var productid = $(".QnAPro").val();
			console.log("productid : " + productid);
			
			var str = "";
			var tdArray = new Array();
			
			var tr = $(this);
			var td = tr.children();
			 
			var QnAresult = td.eq(0).text();
			console.log("QnAresult : " + QnAresult);
			
			var QnAQno = td.eq(1).text();
			$(".QnAcqno").val(QnAQno);
			console.log("QnAQno : " + QnAQno);
			
			$.ajax({
				type : 'post',
				url : '/allmybeauty/product/selectQboard',
				data : 	{productid : productid,
						qno : QnAQno},
				dataType : 'text',
				success : function(result){
					$(".QnAcqcon").val(result);
					console.log('text : ' + result);
				}
			});
			
			var QnAMid = td.eq(3).text();
			$(".QnAcmid").val(QnAMid);
			console.log("QnAMid : " + QnAMid);
			
			var QnADate = td.eq(4).text();
			console.log("QnADate : " + QnADate);
			
			$.ajax({
				type : 'post',
				url : '/allmybeauty/product/selectAnswer',
				data : 	{productid : productid,
						qno : QnAQno},
				dataType : 'text',
				success : function(result){
					$(".QnAnswer").attr("placeholder", result);
				}
			});
		});
		
		
		/* 답변 취소 버튼 */
 		$("#BQnAC").on("click", function(){
 			$(".modalq").addClass("hidden");
 			$(".QnAnswer").val("");
 		});
 		
 		/* 답변 등록 버튼 */
 		$("#BQnAE").on("click", function(){
 			frmQnAdmin.attr("action", "${contextPath}/product/AdminInquire");
 			frmQnAdmin.attr("method", "post");
 			frmQnAdmin.submit();
 			
 		});
		
 		/* 관리자 답변 삭제하기 */
 		$(".QnARem").on("click", function(){
 			/* var mid = $(this).parent(".QnARem").siblings(".QnAMid").text(); */
 			var mid = $(this).siblings(".QnAMid").text();
 			var productid = ${QnAboardPagingCreator.qnAboardPaging.productid };
 			console.log("mid : " + mid);
 			console.log("productid : " + productid);
			
 			$.ajax({
 				type : 'post',
 				url : '/allmybeauty/product/deleteAdmin',
 				data : {mid : mid,
 						productid : productid},
 				dataType : 'json',
 				success : function(result){
 					alert(result);
 					if(result == 1){
 						alert("삭제가 완료되었습니다");
 						location.reload();
 					}
 				}
 			});
 		});
 		
/*  		$(document).ready(function(){
 			var result = new URLSearchParams(location.search);
			var scope= result.get('scope');
			if(scope == 2){
				$(".qnaDetails").attr("class", "moveDetail");
			}else{
				$(".moveDetail").attr("class", "qnaDetails");	
			}
			
 		});	 */
</script>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%@ include file="../include/myheader.jsp" %>
<head>
<style type="text/css">
.module {
	padding: 100px 0;
}

</style>
</head>
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
      		<div class="btn-group btn-group-justified" role="group" aria-label="..." >
				  <div class="btn-group" role="group" >
				    <button id="noticeBtn" type="button" class="btn btn-default btn-lg" style="color:#2f4f4e; font-size: 15px;"><strong>공지사항</strong></button>   
				  </div>
				  <div class="btn-group" role="group">
				    <button  id="customerBtn" type="button" class="btn btn-default btn-lg" style="color:#2f4f4e; font-size: 15px;"><strong>고객문의</strong></button> 
				  </div>
			</div>
       <section class="module" data-background="${contextPath}/resources/images/QnA/sarah-dorweiler-9Z1KRIfpBTM-unsplash.jpg" >
       <c:choose>
       	 <c:when test="${divide == 'N'}">
       	 	<h1 style="text-align: center; color: #2f4f4e; margin-top: 50px; margin-bottom: 100px;">공지사항</h1>
       	 </c:when>
       	 <c:otherwise>
       		 <h1 style="text-align: center; color: #2f4f4e; margin-top: 50px; margin-bottom: 100px;">
       		 	<c:out value="${CustomerDetail.mid }"/>님의 게시물 <c:if test="${CustomerDetail.breplyCnt > 0}">[답변완료]</c:if>
       		 </h1>
       	 </c:otherwise>
       </c:choose>
         
          <div class="container">
            <div class="row">
              <div class="col-sm-8 col-sm-offset-2">

              </div>
            </div>
            
          
            <div class="row">
              <div class="col-sm-8 col-sm-offset-2">
              
              <c:choose>
             
              <c:when test="${divide == 'N'}">
              <form role="form" id="frmNModify" name="frmNoticeBoard">
               		<div>
						<label style="margin-right: 10%">No.</label><label style="margin-right: 66%">제목</label><label>작성자</label><br>
						<input class="form-control" name="bno" value='<c:out value="${NoticesDetail.bno}"/>' readonly="readonly" style=" width: 7%;float: left;margin-right: 2%;background: white;border-color: black;"/>
						<input class="form-control" name="btitle" value='<c:out value="${NoticesDetail.btitle}"/>' readonly="readonly" style=" width: 70%;float: left;margin-right: 2%;background: white;border-color: black;"/>
						<input class="form-control" name="mid" value='<c:out value="${NoticesDetail.mid}" />' readonly="readonly" style=" width: 18%;float: left;background: white;border-color: black;">
					</div>
 
					<div class="form-group" >
					<label style="margin-top: 1%;margin-bottom: 1%">내용</label> 

					<div class="form-group fileUploadResult">

					</div>

					<textarea class="form-control" rows="25" name="bcontent" readonly="readonly" style="resize: none; font-size: x-small; background: white;border-color: black;"><c:out value="${NoticesDetail.bcontent}"/></textarea>
					</div>
			
					<div class="form-group" style="float: left;">
						<label>최종수정일</label> [등록일시: <fmt:formatDate pattern="yyyy/MM/dd HH:mm:ss" value="${NoticesDetail.bmoddate}"/>]
					</div>
					<input type='hidden' name='divide' value='N'/>
					
					<button type="button" class="btn btn-default Nbtn" data-oper="Nlist" style="float: right;" ><strong>돌아가기</strong></button>
					<sec:authorize access="isAuthenticated()">
					<sec:authentication property="principal" var="principal"/>
						<c:if test="${principal.username eq 'admin' }">
					<button type="button" class="btn btn-default Nbtn" data-oper="Nmodify" style="float: right; margin-right: 1%"  ><strong>수정</strong></button>
					</c:if>
					</sec:authorize>
					<input type='hidden' name='pagingNum' value='${QnAPagingDTO.pagingNum}'>
					<input type='hidden' name='rowAmountPerPage' value='${QnAPagingDTO.rowAmountPerPage}'>
					 <sec:csrfInput />
                </form>
              </c:when>
              
              <c:when test="${divide == 'C'}">
                 <form role="form" id="frmCModify" name="frmCustomerBoard">
         			<div>
						<label style="margin-right: 10%">No.</label><label style="margin-right: 66%">제목</label><label>작성자</label><br>
						<input class="form-control" name="bno" value='<c:out value="${CustomerDetail.bno}"/>' readonly="readonly" style=" width: 7%;float: left;margin-right: 2%; background: white;border-color: black;"/>
						<input class="form-control" name="btitle" value='<c:out value="${CustomerDetail.btitle}"/>' readonly="readonly" style=" width: 70%;float: left;margin-right: 2%; background: white;border-color: black;"/>
						<input class="form-control" name="mid" value='<c:out value="${CustomerDetail.mid}" />' readonly="readonly" style=" width: 18%;float: left;background: white;border-color: black;">
					</div>
 
					<div class="form-group">
					<label style="margin-top: 1%;margin-bottom: 1%">내용</label> 

					<div class="form-group fileUploadResult">

					</div>
					<textarea class="form-control" rows="25" name="bcontent" readonly="readonly" style="resize: none; font-size: x-small; background: white;border-color: black;"><c:out value="${CustomerDetail.bcontent}"/></textarea>
					</div>
					
					<div class="form-group" style="float: left;">
						<label>최종수정일</label> [등록일시: <fmt:formatDate pattern="yyyy/MM/dd HH:mm:ss" value="${CustomerDetail.bmoddate}"/>]
					</div>
					
				  	  
	<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				<sec:authorize access="isAuthenticated()">
					<sec:authentication property="principal" var="principal"/>
						<c:if test="${principal.username eq 'admin' }">
	                          <span id="replaytotal"></span>
	                        <span>&nbsp;</span>
	                        	<button type="button" id="btnRegCmtButton" class="btn btn-primary btn-sm" style=" float: right">댓글 작성</button>
	                        	<button type="button" id="btnCancelRegCmt" class="btn btn-danger btn-sm" style="display:none; float: right">등록 취소</button>
	                        	<button type="button" id="btnActRegCmt" style="display:none; float: right" class="btn btn-success btn-sm">댓글 등록</button>
                    </c:if>
             	</sec:authorize>
	            </div> <%-- /.panel-heading --%>
	            
	            
				<div class="panel-body" style="border-color: black;" >
					<sec:authorize access="isAuthenticated()">
		                <div class="form-group" style="margin-bottom: 5px; margin-top: 2%">
		                   <div class="alert alert-danger" role="alert" id="cmt_alert" style=" display:none;" style="width:100px; height:100px; ">
                                <strong>작성자/내용을 확인해주세요.</strong>
                           </div>
							 <input type="text" id="mid" style="display:none;padding:5px 0px 0px 5px;"  value='<c:out value="${principal.username  }"/>'>
							 <textarea class="form-control txtBoxCmt" name="ccontent" style="display:none; resize: none; width:40px"
		                               placeholder="댓글작성을 원하시면,&#10;댓글 작성 버튼을 클릭해주세요."></textarea>
		                </div>
		                <hr style="margin-top: 10px; margin-bottom: 10px;">
	                </sec:authorize>
			            <ul class="chat"> 
			        
			           </ul>
			           
			           <div id="showCmtPagingNums" style="float: right; ">
              		 		<%-- 댓글 목록의 페이징 번호 표시 영역 - JavaScript로 내용이 생성되어 표시됩니다.--%>
         			   </div>

				</div>
				 
	 
					  
				</div>
			</div>
		</div>
       
					<input type='hidden' name='divide' value='C'/>
					 					
					<button type="button" class="btn btn-default Cbtn" data-oper="Clist" style="float: right;"><strong>돌아가기</strong></button>
					
					<sec:authorize access="isAuthenticated()">
						<sec:authentication property="principal" var="principal"/>
					<c:if test="${principal.username eq CustomerDetail.mid }">
					<button type="button" class="btn btn-default Cbtn" data-oper="Cmodify" style="float: right; margin-right: 1%;"><strong>수정</strong></button>
					</c:if>
					</sec:authorize>
					
					
					<input type='hidden' name='pagingNum' value='${QnAPagingDTO.pagingNum}'>
					<input type='hidden' name='rowAmountPerPage' value='${QnAPagingDTO.rowAmountPerPage}'>
					 <sec:csrfInput />
                </form>

						
               </c:when>
              </c:choose>

              </div>
            </div>
          </div>
       </section>


<form id="frmSendValue">

</form>

 <form id="frmCmtPagingValue">
	<input type='hidden' name='pageNum' value='' />	
	<input type='hidden' name='rowAmountPerPage' value='' />
</form>


<script type="text/javascript" src="${contextPath}/resources/js/mycomment.js"></script>
<script type="text/javascript">
var loginUser = "";
<sec:authorize access="isAuthenticated()">
   loginUser = '<sec:authentication property="principal.username"/>';
</sec:authorize>

var mid = "${memberVO.mid}"; 

var csrfHeaderName = "${_csrf.headerName}";
var csrfTokenValue = "${_csrf.token}";
$(document).ajaxSend(function(e,xhr,options){
	xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
});

var frmSendValue =$("#frmSendValue");
var frmNModify =$("#frmNModify");
var frmCModify =$("#frmCModify");
var divide = "${divide}";
var nbnoValue ="${NoticesDetail.bno}";
var cbnoValue ="${CustomerDetail.bno}";
var bdelflag ="${CustomerDetail.bdelflag}";


<%-- 버튼 관련 --%>


<%-- 공지사항 수정 돌아가기 버튼--%>
	$(".Nbtn").on("click", function() {
		var operation = $(this).data("oper");
		
		if (operation == "Nmodify") {
			
			frmNModify.attr("action", "${contextPath}/QnABoard/modify");
			frmNModify.attr("method", "get");
	
		}else if (operation == "Nlist") {
			
			if (loginUser == 'admin') {
				frmNModify.attr("action", "${contextPath}/QnABoard/adminNotice");
				frmNModify.attr("method", "get");
			}else {

				frmNModify.attr("action", "${contextPath}/QnABoard/notice");
				frmNModify.attr("method", "get");
			}
		}
		frmNModify.submit();
	});

	
<%-- 고객센터 수정 돌아가기 버튼--%>
	$(".Cbtn").on("click", function() {
		var operation = $(this).data("oper");
		
		if (operation == "Cmodify") {
	
			frmCModify.attr("action", "${contextPath}/QnABoard/modify");
			frmCModify.attr("method", "get");
			
		}else if (operation == "Clist") {
			
			if (loginUser != 'admin') {
				frmCModify.attr("action", "${contextPath}/QnABoard/customer");
				frmCModify.attr("method", "get");		
			}else if(loginUser == 'admin'){
				frmCModify.attr("action", "${contextPath}/QnABoard/adminCustomer");
				frmCModify.attr("method", "get");	
			}
			
		}
		frmCModify.submit();
	});

	
<%-- 공지사항 바로가기 버튼--%>
	$("#noticeBtn").on("click", function () {
	
		frmSendValue.append("<input type='hidden' name='divide' value='N'/>");
		frmSendValue.attr("action", "${contextPath}/QnABoard/notice");
		frmSendValue.attr("method", "get");
		frmSendValue.submit();
	});

	
<%-- 고객문의 바로가기 버튼--%>
	 $("#customerBtn").on("click", function () {
	
		frmSendValue.append("<input type='hidden' name='divide' value='C'/>");
		frmSendValue.attr("action", "${contextPath}/QnABoard/customer");
		frmSendValue.attr("method", "get");
		frmSendValue.submit();
	});


	 
<%-- 첨부파일 표시 --%>
	 function showUploadFile(uploadResult){
	 	
	 	if(!uploadResult || uploadResult.length == 0){
	 		return;
	 	}
	 	
	 	var fileUploadResult = $(".fileUploadResult");
	 	var str = "";
	 	
	 	$(uploadResult).each(function(i,obj){
	 		
	 		var uploadedFilePath = 
	 			encodeURIComponent(obj.repopath+"/"+obj.uploadpath+"/"+obj.uuid+"_"+obj.filename);
	 	
	 		str += " <img src='${contextPath}/QnAThumbnail?filename=" + uploadedFilePath + "'"
	 			+  " 	  alt='No Icon'><br>";
	 	});
	 	
	 	fileUploadResult.append(str);
	 }


 <%--댓글 처리 --%>
 
if (divide == "C" ) {
	

 	var bnoValue = '<c:out value="${CustomerDetail.bno}"/>';
	var commentUL = $(".chat");
	var frmCmtPagingValue = $("#frmCmtPagingValue");
	var loginUser= "";
	
	<sec:authorize access="isAuthenticated()">
		loginUser='<sec:authentication property="principal.username"/>';
	</sec:authorize>
	
<%--댓글 목록 표시 --%>
	function showCmtList(page){
		myCommentClsr.getCmtList(
				{bno: bnoValue, page: page || 1},
				function(bCommentPagingCreator){

 				frmCmtPagingValue.find("input[name='pageNum']").val(bCommentPagingCreator.cntPaging.pageNum);

					var str="";
					
				if( (! bCommentPagingCreator.cmtList) || (bCommentPagingCreator.cmtList.length == 0) ){
					str += '<li class="left clearfix commentLi" '
					+ ' style="text-align: center; background-color: lightgray; '
					+ ' height: 65px;margin-bottom: 0px;padding-bottom:0px;'
					+ ' padding-top:6px;border: 1px solid; ">'
					+ ' <strong>빠른 시일내로 답변드리겠습니다.</strong></li>';
					
					commentUL.html(str);
					
					return;
				}
				  
		for (var i = 0, len = bCommentPagingCreator.cmtList.length || 0; i < len; i++){
			str +='<li class="left clearfix commentLi" data-bno="' +bnoValue
			+'"	data-cno="'+bCommentPagingCreator.cmtList[i].cno+'"style="list-style-type: disc ;">'
			+'        <div>';
			
			
		<%--댓글에 대한 답글 들여쓰기 --%>
		if(bCommentPagingCreator.cmtList[i].lvl ==1){
			str +='		<div>';
		}else if (bCommentPagingCreator.cmtList[i].lvl == 2){
			str +='        <div style="padding-left:25px">';
		}else if (bCommentPagingCreator.cmtList[i].lvl == 3){
			str +='		  <div style="padding-left:50px">';
		}else if (bCommentPagingCreator.cmtList[i].lvl == 4){
			str +='		  <div style="padding-left:75px">';
		}else{
			str +='       <div style="padding-left:100px">';
		}
			str +='          <span class="header info-mid">'
				+ '              <strong class="primary-font">';
		if(bCommentPagingCreator.cmtList[i].lvl > 1){
			str+='<i class="fa fa-reply fa-fw"></i>&nbsp;';
		}
			str+=				bCommentPagingCreator.cmtList[i].mid
			   + '             </strong>';
			   <sec:authorize access="isAuthenticated()" >
			   <sec:authentication property="principal" var="principal"/>
				<c:if test="${principal.username eq 'admin'}">
			str+= '             <small class="modCmtButton">&nbsp; 수정</small>'
			   + '             <small class="btnDelCmt">&nbsp; 삭제</small>'
			   + ' 			<span>';
			   </c:if>
		   str+=  '         <p data-bno=' + bCommentPagingCreator.cmtList[i].bno
			   + '            data-cno=' + bCommentPagingCreator.cmtList[i].cno
			   + '            data-mid=' + bCommentPagingCreator.cmtList[i].mid
			   + '         >' + bCommentPagingCreator.cmtList[i].ccontent + '</p>'
			   + '     </div>';
			   
			   </sec:authorize>
			   + '    </div>'
			   + '</li>';
		}<%--for문 end --%>
		
				commentUL.html(str);
		
				showCmtPagingNums(bCommentPagingCreator.cntPaging.pageNum,
									bCommentPagingCreator.startPagingNum,
									bCommentPagingCreator.endPagingNum,
									bCommentPagingCreator.prev,
									bCommentPagingCreator.next,
									bCommentPagingCreator.lastPageNum);
				}
		)
	}
	
<%--댓글 페이징 버튼--%>
	$("#showCmtPagingNums").on("click","ul li a", function(e){
		
		e.preventDefault();
		
		var targetPageNum = $(this).attr("href");

		showCmtList(targetPageNum);
	
	
	});
	
<%--댓글 페이징 처리 --%>
	function showCmtPagingNums(pageNum, startPagingNum, endPagingNum, prev, next, lastPageNum ){
		
		if(endPagingNum >= lastPageNum){
			endPagingNum = lastPageNum;
		}
		
		var str = "<ul class='pagination pagination-sm'>";
		
		if(prev){
			str +="    <li class='page-item'>"
				+ "        <a class='page-link' href='"+1+"'>"
				+ "            <span aria-hidden='true'>&laquo;</span>"
				+ "    	   </a>"
				+ "    </li>";
		}
		if(prev){
			str +="    <li class='page-item'>"
				+ "        <a class='page-link' href='"+(startPagingNum -1)+"'>이전</a>"
				+ "            <span aria-hidden='true'>&laquo;</span>"
				+ "    </li>";
		}
		for(var i = startPagingNum ; i <= endPagingNum; i++){
			
			var active = ( ( pageNum == i) ? "active" : "");
			
			str +="    <li class='page-item"+ active +"'>"
				+ "        <a class='page-link' href='"+i+"'>"+i+"</a>"
				+ "    </li>";
		}
		if(next){
			str +="    <li class='page-item'>"
				+ "        <a class='page-link' href='"+(endPagingNum +1)+"'>다음</a>"
				+ "    </li>";
		}
		if(next){
			str +="    <li class='page-item'>"
				+ "        <a class='page-link' href='"+(lastPageNum)+"'>&raquo;</a>"
				+ "    </li>";
		}
		
			str +="</ul>";
		$("#showCmtPagingNums").html(str);
	}
	
	
<%-- 댓글작성버튼 초기화 함수--%>
	function chgBeforeCmtBtn(){
		$("#btnRegCmtButton").attr("style", "display:in-block;float:right");
		$("#btnCancelRegCmt").attr("style", "display:none; float:right");
		$("#btnActRegCmt").attr("style", "display:none; float:right");
		$(".txtBoxCmt").attr("style", "display:none");
		$('input#mid').attr("style", "display:none");
	}
	
	
<%-- 댓글작성버튼 클릭--%>
	$("#btnRegCmtButton").on("click", function(){
		chgBeforeCmtRepBtns();
		chgBeforeCmtBtn();
		chgBeforeReplyBtn();
	
		$("#btnRegCmtButton").attr("style", "display:none");
		$("#btnCancelRegCmt").attr("style", "display:in-block;margin-right:2px; float:right");
		$("#btnActRegCmt").attr("style", "display:in-block;margin-right:2px; float:right");
		
		
		$(".txtBoxCmt").attr("style", "display:in-block");
		$('input#mid').attr("style", "display:in-block");
		
	});
	
	
<%-- 댓글등록--%>
	$("#btnActRegCmt").on("click", function(){
		
		$('div#cmt_alert').attr("style", "display:none");
		
		var loginuser = $('input#mid').val();
		var txtBoxCmt = $(".txtBoxCmt").val();
		var comment = { bno: bnoValue,
						ccontent: txtBoxCmt,
						mid: loginuser};
		
		if (loginuser != "" && loginuser != null){
			if(txtBoxCmt != "" && comment != null){
			myCommentClsr.registerCmt(
					comment,
					function(serverResult){
						$(".txtBoxCmt").val("");
						chgBeforeCmtBtn();
						
						alert("댓글이 등록되었습니다");
						
						showCmtList(-1);
					}
			);
			}else{
				$('div#cmt_alert').attr("style", "display:in-block");
				return;
			}
		}else{
			$('div#cmt_alert').attr("style", "display:in-block");
			return;
		chgBeforeCmtBtn();
		$(".txtBoxCmt").attr("style", "display:none");
		$('input#mid').attr("style", "display:none");

		}
	});
	

<%-- 댓글취소 클릭--%>
	$("#btnCancelRegCmt").on("click", function(){
		chgBeforeCmtBtn();
	});

	
<%-- 답글 초기화 함수--%>
	function chgBeforeReplyBtn(){
		$(".btnRegReply").remove();
		$(".btncancelRegReply").remove();
		$(".txtBoxReply").remove();
		$("div#cmt_alert").attr("style", "display:none");
		$("input#creply_mid").attr("style","display:none");
	}
	
	
<%-- 답글 초기화 함수--%>
	$(".chat").on("click", ".commentLi div div .btnCancelRegReply" ,function(){
		chgBeforeCmtBtn();
		chgBeforeReplyBtn();
		chgBeforeCmtRepBtns();
	});
	
	
<%-- 답글 초기화 함수--%>
	$(".chat").on("click", ".commentLi .btnRegReply" ,function(){
		var loginuser =$('input#creply_mid').val();
		var pageNum = frmCmtPagingValue.find("input[name='pageNum']").val();
		var txtBoxReply = $(this).prev().val();	
		var creplyVal = $(this).closest("li").data("cno");
		var reply = { bno: bnoValue,
					  ccontent : txtBoxReply,
					  mid : loginuser,
					  creply : creplyVal};
		
		if (loginuser != "" && loginuser != null){
			if(txtBoxReply != "" && txtBoxReply != null){
			myCommentClsr.registerReply(
					reply,
					function(serverResult){
						$(".txtBoxReply").val("");
						chgBeforeCmtBtn();
						
						alert("답글이 등록되었습니다");
						
						showCmtList(pageNum);
					}
			);
			}else{
				alert("내용을 입력해주세요");
			}
		}else{
			alert("작성자명을 입력해주세요");
		}
	});
	
	
<%--댓글/답글 수정-삭제-취소-입력창 삭제 함수--%>
	function chgBeforeCmtRepBtns(){
		
		$("p").attr("style", "display:in-block;");
		
		$(".btnCancelCmt").remove();
		$(".btnModCmt").remove();
		$(".modTxtBox").remove();

	}
	
	
if (${principal.username eq CustomerDetail.mid} || ${principal.username eq 'admin'} ) {
		
	
<%--댓글 클릭시 답글버튼 표시 --%>
	$(".chat").on("click", ".commentLi p", function(){
		
		$("p").attr("style", "display:in-block;");
		
		chgBeforeCmtBtn();
		chgBeforeReplyBtn();
		chgBeforeCmtRepBtns();
		
		<sec:authorize access="isAuthenticated()">
		var strTxtBoxReply =
			'<input type="text" id="creply_mid" style="display:in-block;padding:3px 0px 0px 4px;"  value="${principal.username }" readonly="readonly">'
		+	"<textarea class='form-control txtBoxReply' name='ccontent' style='margin-bottom:10px;'></textarea>"
		+	"<button type='button' class='btn btn-warning btn-xs btnRegReply'>답글등록</button>"
		+   "<button type='button' class='btn btn-danger btn-xs btnCancelCmt'"
		+   "       style='margin-left:4px;'>취소</button>";
		</sec:authorize>
		
		$(this).after(strTxtBoxReply);
	}) ;
}

<%--답글취소버튼 --%>
	$(".chat").on("click", ".commentLi .btnCancelCmt", function(){
		chgBeforeCmtBtn();
		chgBeforeReplyBtn();
		chgBeforeCmtRepBtns();
		$(".btnDelCmt").attr("style", "display:in-block");
		$(".modCmtButton").attr("style", "display:in-block");
		$("span").attr("style","display:in-block");
		
	});
	
	
<%--답글수정버튼 --%>
	$(".chat").on("click", ".commentLi .modCmtButton", function(){
		

		chgBeforeCmtBtn();
		chgBeforeReplyBtn();
		chgBeforeCmtRepBtns();

		<sec:authorize access="isAuthenticated()" > 
		str=	"<textarea class='form-control modTxtBox' style='margin-bottom:10px;'></textarea>"
			+		"<button type='button' class='btn btn-warning btn-xs btnModCmt'>수정</button>"
			+   	"<button type='button' class='btn btn-danger btn-xs btnCancelCmt'"
			+   "       style='margin-left:4px;'>취소</button>";
		</sec:authorize>
	 	$(this).closest("span").children("span").attr("style","display:none");
		$(this).after(str);
		$(".btnDelCmt").attr("style", "display:none");
		$(".modCmtButton").attr("style", "display:none");
	});
	
	
<%--댓글수정버튼 --%>
	$(".chat").on("click", ".commentLi .btnModCmt", function(){
		

		var cnoVal = $(this).closest("li").data("cno");
		var midVal = $(this).closest("li").data("mid");
		var txtBoxComment = $(this)
		var pageNum = frmCmtPagingValue.find("input[name='pageNum']").val();
		var txtBoxComment = $(this).prev("textarea").val();
		var comment = { bno: bnoValue,
						cno: cnoVal,
						ccontent: txtBoxComment,
						mid: midVal };
		
		myCommentClsr.modifyCmtReply(
				comment,
				function(serverResult){
					alert("수정되었습니다");
					
					showCmtList(pageNum);
				}
			);
	});

<%--댓글삭제버튼 --%>
	$(".chat").on("click", ".commentLi .btnDelCmt", function(){
		
		var delConfirm = confirm("삭제하시겠습니까?");
		
		var cnoVal = $(this).closest("li").data("cno");
	
		var midVal = $(this).closest("li").data("mid");
		
		var myCmt = {bno: bnoValue,
					 cno: cnoVal,
					 mid: midVal};
						
		var pageNum = frmCmtPagingValue.find("input[name='pageNum']").val();
		
		if(!delConfirm){
			alert("취소되었습니다.")
			return;
		}
		
		myCommentClsr.removeCmtReply(
			myCmt,
			function(serverResult){
				alert("삭제되었습니다.");
				
				showCmtList(pageNum);
			}
		);
	});
	
}


 $(document).ready(function(){
	

 <%--첨부파일 불러오기 --%>
	if (divide == "C" ) {
		
		$.ajax({
			type:'get',
			url:'${contextPath}/QnABoard/getCustomerFiles',
			data: {bno: cbnoValue},
			dataType:'json',
			success: function(fileList, status){
			
				showUploadFile(fileList);
			}
		});
		
		
		showCmtList(1);
	}else{
		
		$.ajax({
			type:'get',
			url:'${contextPath}/QnABoard/getNoticFiles',
			data: {bno: nbnoValue},
			dataType:'json',
			success: function(fileList, status){
				
				showUploadFile(fileList);
			}
		});
		
	}
	
	
});
</script>
<%@ include file="../include/myfooter.jsp" %>
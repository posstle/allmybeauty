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

      <section class="module bg-dark-60 faq-page-header" data-background="${contextPath}/resources/images/faq_bg.jpg">
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
       <section class="module">
   
          <div class="container">
	          <div class="row ">
	              <div class="col-sm-8 col-sm-offset-2">
	              </div>
	            </div>
          
            <div class="row ">
              <div class="col-sm-8 col-sm-offset-2">
              
              <c:choose>
              
              <c:when test="${divide == 'N'}">
              
               <form role="form" id="frmNModify" name="frmNoticeBoard" enctype="multipart/form-data" >
               	
					<div>
						<label style="margin-right: 10%">No.</label><label style="margin-right: 66%">제목</label><label>작성자</label><br>
						<input class="form-control" name="bno" value='<c:out value="${NoticesDetail.bno}"/>' readonly="readonly" style=" width: 7%;float: left;margin-right: 2%;background: white; border-color: black;"/>
						<input class="form-control" name="btitle" value='<c:out value="${NoticesDetail.btitle}"/>' style=" width: 70%;float: left;margin-right: 2%;background: white; border-color: black;"/>
						<input class="form-control" name="mid" value='<c:out value="${NoticesDetail.mid}" />' readonly="readonly" style=" width: 19%;float: left;background: white; border-color: black;">
					</div>
                	
					<div class="form-group">
					<label style="margin-top: 2%;">내용</label> 
					<textarea class="form-control" rows="25" name="bcontent" style="resize: none; font-size: medium;border-color: black;" ><c:out value="${NoticesDetail.bcontent}"/></textarea>
					</div>
					<div class="form-group" style="float: right;">
						<label>최종수정일</label> [등록일시: <fmt:formatDate pattern="yyyy/MM/dd HH:mm:ss" value="${NoticesDetail.bmoddate}"/>]
					</div><br>
					
				      <%-- 첨부파일 결과 표시 --%>
					<div class="row">
							<div class="panel panel-default">
								<div class="panel-heading">파일첨부</div>
								<div class="panel-body"><%--id 추가 --%>
									<div class="form-group uploadDiv">
										<input id="inputFile" type="file" name="uploadfiles" multiple="multiple"><br>
									</div>
									<div class="form-group fileUploadResult">
										<ul>
										</ul>
									</div>
								</div><!-- /.panel-body -->
							</div><!-- /.panel -->
					</div><!-- /.row -->
		           <%-- 첨부파일 결과 표시끝 --%>
		          	
		           	<sec:authorize access="hasRole('ROLE_ADMIN')">
							<button type="button" id="BtnList" class="btn btn-default btn float-right noticeBtn" data-oper="Ndetail" style="float: right;;">취소</button>
							<button type="button" id="BtnDelete" class="btn btn-default btn float-right noticeBtn"  data-oper="Ndelete"style="float: right; margin-right: 1%;">삭제</button>
							<button type="button" id="BtnModify" class="btn btn-default btn float-right noticeBtn"  data-oper="Nmodify" style="float: right; margin-right: 1%;">수정</button>
					</sec:authorize>
					<input type='hidden' name='pagingNum' value='${QnAPagingDTO.pagingNum}'>
					<input type='hidden' name='rowAmountPerPage' value='${QnAPagingDTO.rowAmountPerPage}'>
					<sec:csrfInput/>
                </form>
              
              </c:when>
              
              <c:when test="${divide == 'C'}">
     			<form role="form" id="frmCModify" enctype="multipart/form-data" >
               			<div>
						<label style="margin-right: 10%">No.</label><label style="margin-right: 66%">제목</label><label>작성자</label><br>
						<input class="form-control" name="bno" value='<c:out value="${CustomerDetail.bno}"/>' readonly="readonly" style=" width: 7%;float: left;margin-right: 2%;background: white; border-color: black;"/>
						<input class="form-control" name="btitle" value='<c:out value="${CustomerDetail.btitle}"/>' style=" width: 70%;float: left;margin-right: 2%;background: white; border-color: black;"/>
						<input class="form-control" name="mid" value='<c:out value="${CustomerDetail.mid}" />' readonly="readonly" style=" width: 19%;float: left;background: white; border-color: black;">
					</div>
					<div class="form-group">
					<label style="margin-top: 2%;"><strong>내용</strong></label> 
					<textarea class="form-control" rows="15" name="bcontent" style="resize: none; font-size: medium;border-color: black;" ><c:out value="${CustomerDetail.bcontent}"/></textarea>
					</div>
					<div class="form-group" style="float: right;">
						<label>최종수정일</label> [등록일시: <fmt:formatDate pattern="yyyy/MM/dd HH:mm:ss" value="${CustomerDetail.bmoddate}"/>]
					</div><br>
					
					      <%-- 첨부파일 결과 표시 --%>
					<div class="row">
							<div class="panel panel-default">
								<div class="panel-heading">파일첨부</div>
								<div class="panel-body"><%--id 추가 --%>
									<div class="form-group uploadDiv">
										<input id="inputFile" type="file" name="uploadfiles" multiple="multiple"><br>
									</div>
									<div class="form-group fileUploadResult">
										<ul>
										</ul>
									</div>
								</div><!-- /.panel-body -->
							</div><!-- /.panel -->
					</div><!-- /.row -->
		           <%-- 첨부파일 결과 표시끝 --%>
		           	<sec:authorize access="isAuthenticated()">
			           	<sec:authentication property="principal" var="principal"/>
			           	<c:if test="${principal.username eq CustomerDetail.mid}">
							<button type="button" id="BtnList" class="btn btn-default customerBtn" data-oper="Cdetail" style="float: right; ">취소</button>
							<button type="button" id="BtnDelete" class="btn btn-default customerBtn"  data-oper="Cremove" style="float: right; margin-right:1%;">삭제</button>
							<button type="button" id="BtnModify" class="btn btn-default customerBtn"  data-oper="Cmodify" style="float: right; margin-right:1%;">수정</button>
						</c:if>
					</sec:authorize>
					<input type='hidden' name='pagingNum' value='${QnAPagingDTO.pagingNum}'>
					<input type='hidden' name='rowAmountPerPage' value='${QnAPagingDTO.rowAmountPerPage}'>
					<sec:csrfInput/>
                </form>
              
              </c:when>
              </c:choose>
	     			 
	                
              </div>
            </div>
          </div>
       </section>

<script type="text/javascript">
var csrfHeaderName = "${_csrf.headerName}";
var csrfTokenValue = "${_csrf.token}";
$(document).ajaxSend(function(e,xhr,options){
	xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
});

var loginUser = "";

<sec:authorize access="isAuthenticated()">
	loginUser = '<sec:authentication property="principal.username"/>';
</sec:authorize>

var divide ='<c:out value="${divide}"/>';
var nbnoValue ="${NoticesDetail.bno}";
var cbnoValue ="${CustomerDetail.bno}";
var frmCModify = $("#frmCModify");
var frmNModify = $("#frmNModify");

<%-- 첨부파일--%>


<%-- 파일 확장자 확인--%>
 function checkUploadFile(fileName, fileSize){
    
    var maxSizeAllowed = 5242880;
    var regExpForFileExtention = /(.*)\.(gif|jpg|png)$/i   ;
    
    if(fileSize >= maxSizeAllowed){
       alert("업로드파일 크기가 초과되었습니다.");
       return false;
    }
    
    if (!regExpForFileExtention.test(fileName)) {
       alert("이미지 파일만 업로드 가능합니다.");
       return false;
    }
    return true;
 }
 
 
<%-- 업로드 첨부파일 표시--%>
 function showUploadFile(uploadResult){
 	
 	if(!uploadResult || uploadResult.length == 0){
 		return;
 	}
 	
 	var fileUploadResult = $(".fileUploadResult ul");
 	var str = "";
 	
 	$(uploadResult).each(function(i,obj){
 		
 		var thumbnailFilePath = 
 			encodeURIComponent(obj.repopath+"/"+obj.uploadpath+"/thumb_"+obj.uuid+"_"+obj.filename);

 	
 			str += "<li data-repopath='"+obj.repopath +"'"
			+  "	data-uploadpath='"+obj.uploadpath+"'"
			+  "	data-uuid='"+obj.uuid+"'"
			+  "	data-filename='"+obj.filename+"' style='height:25px;'>"
			+  " <img src='${contextPath}/QnAThumbnail?filename=" + thumbnailFilePath + "'"
			+  " 	  alt='No Icon' style='height: 18px; width: 18px;'> &nbsp;&nbsp;"
			+ 		obj.filename
			+ " &nbsp;<button type='button' class='btn btn-xs'"	
			+ " data-filename='" + thumbnailFilePath + "'>X</button>"
			+ "</li>";
 	});
 	
 	fileUploadResult.append(str);
 }

 
 var cloneInputFile = $(".uploadDiv").clone();


 
 <%-- 첨부파일 등록--%>
	 $(".uploadDiv").on("change","input[type='file']", function (e){
	 	   
	   var formData = new FormData();
		
	   var inputFiles = $(this);
	   
	   var files = inputFiles[0].files;
	
	   
	   for(var i=0; i < files.length; i++){
	
		   if (!checkUploadFile(files[i].name, files[i].size)) {
			  
			return false;
			}
		   
	     		formData.append("uploadfiles", files[i]);
	   }
	   	
	   	$.ajax({
			type:'post',
			url:'${contextPath}/QnAfileUpload',
			processData:false,
			contentType:false,
			data:formData,
			dataType:'json',
			success: function(uploadResult, status){
	
				$(".uploadDiv").html(cloneInputFile.html());
	
				showUploadFile(uploadResult);
	
			}
		})
	 	  
	});
	 	
 
 <%-- 첨부파일 수정시 삭제--%>
	 $(".fileUploadResult").on("click","button",function(e){
			if(confirm("이 이미지를 삭제하시겠습니까?")){
				var targetLi =$(this).closest("li");
				targetLi.remove();
				alert("파일이 삭제 되었습니다.");
				
			}else{
				alert("파일 삭제가 취소 되었습니다.");
			}
	});
 	

 <%-- 버튼 클릭--%>

 <%-- 고객문의 버튼  삭제 수정 돌아기기--%>
 $('.customerBtn').on("click", function (e) {
		var operation = $(this).data("oper");
		
		if(operation == "Cmodify"){

			   	 var strinputHidden = "" ;

			   	 $(".fileUploadResult ul li").each(function(i,obj){
			   		 var objLi = $(obj);
			   		 strinputHidden
			   		 	+="<input type='hidden' name='attachFileList["+i+"].uuid' value='"+objLi.data("uuid")+"'>"
			   			+ "<input type='hidden' name='attachFileList["+i+"].uploadpath' value='"+objLi.data("uploadpath")+"'>"
			   			+ "<input type='hidden' name='attachFileList["+i+"].filename' value='"+objLi.data("filename")+"'>"

			   	 });

			frmCModify.append(strinputHidden);
			frmCModify.append("<input type='hidden' name='divide' value='C'/>");
			frmCModify.attr("method", "post");
			frmCModify.attr("action", "${contextPath}/QnABoard/modify");
			
		}else if(operation == "Cremove"){

			frmCModify.attr("method", "post");
			frmCModify.attr("action", "${contextPath}/QnABoard/remove")
			
		}else if(operation == "Cdetail"){
			frmCModify.append("<input type='hidden' name='divide' value='C'/>");
			frmCModify.attr("action", "${contextPath}/QnABoard/detailmod?bno=${CustomerDetail.bno}").attr("method", "get");
		
		}
		
		frmCModify.submit();
		
});


 <%-- 공지사항 버튼  삭제 수정 돌아기기--%>
$('.noticeBtn').on("click", function (e) {
	var operation = $(this).data("oper");
	if(operation == "Nmodify"){
			

		   	 var strinputHidden = "" ;
		   	 
		   	 $(".fileUploadResult ul li").each(function(i,obj){
		   		 var objLi = $(obj);
		   		 strinputHidden
		   		 	+="<input type='hidden' name='attachFileList["+i+"].uuid' value='"+objLi.data("uuid")+"'>"
		   			+ "<input type='hidden' name='attachFileList["+i+"].uploadpath' value='"+objLi.data("uploadpath")+"'>"
		   			+ "<input type='hidden' name='attachFileList["+i+"].filename' value='"+objLi.data("filename")+"'>"
		   		 	
		   	 });

		frmNModify.append(strinputHidden);
		frmNModify.append("<input type='hidden' name='divide' value='N'/>");
		frmNModify.attr("method", "post");
		frmNModify.attr("action", "${contextPath}/QnABoard/modify");
		
	}else if(operation == "Ndelete"){

		frmNModify.attr("method", "post");
		frmNModify.attr("action", "${contextPath}/QnABoard/delete");
		
		
	}else if(operation == "Ndetail"){
		
		frmNModify.append("<input type='hidden' name='divide' value='N'/>");
		frmNModify.attr("action", "${contextPath}/QnABoard/detailmod?bno=${NoticesDetail.bno}").attr("method", "get");
	
	}
	
	frmNModify.submit();
	
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
 
 
	 
 $(document).ready(function(){

 <%-- 첨부파일 불러오기--%> 
	if (divide =="C") {
		
		$.ajax({
			type:'get',
			url:'${contextPath}/QnABoard/getCustomerFiles',
			data: {bno: cbnoValue},
			dataType:'json',
			success: function(fileList, status){
		
				showUploadFile(fileList);
			}
		});

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
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
       
       <section class="module" data-background="${contextPath}/resources/images/QnA/sarah-dorweiler-9Z1KRIfpBTM-unsplash.jpg">
          <div class="container">
            <div class="row mb-60">
                <div class="col-sm-8 col-sm-offset-2">
                    <div class="menu-box">

                    </div>
                </div>
              </div>
          
            <div class="row mb-60">
              <div class="col-sm-8 col-sm-offset-2">
              <c:choose>
              
              <c:when test="${divide == 'N'}">
                 <form role="form" id="frmNregister"  name="frmNotices" enctype="multipart/form-data">
                  <div>
                  		<label style="margin-right: 69%">제목</label ><label >작성자</label><br>
						<input class="form-control" name="btitle"style=" width: 70%;float: left;margin-right: 2%;background: white;border-color: black;"/>
						<input class="form-control" name="mid" value='<sec:authentication property="principal.username"/>' readonly="readonly" 
																style=" width: 28%;float: left;background: white;border-color: black;">
					</div>
                  <div class="form-group">
                     <label style="margin-top: 1%;margin-bottom: 1%;"><strong>내용</strong></label> 
                     <textarea class="form-control" rows="25" name="bcontent" style="resize: none; font-size: x-small;border-color: black;" ></textarea>
                  </div>
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
		           
                  <input type='hidden' name='divide' value='N'/>
                  <button type="button" class="btn btn-default" onclick="location.href='${contextPath}/QnABoard/notice'" style="float: right;">취소</button>
                  <button type="button" class="btn btn-default" id="btnNRegister" style="float: right; margin-right: 1%" >등록</button>&nbsp;
                 <sec:csrfInput />
                   </form>
     
              </c:when>
              <c:when test="${divide == 'C'}">
              	
                  <form role="form" id="frmCregister" name="frmCustomer"  enctype="multipart/form-data">
                    <div>
                   		<label style="margin-right: 69%">제목</label><label>작성자</label><br>
						<input class="form-control" name="btitle"style=" width: 70%;float: left;margin-right: 2%;background: white;border-color: black;"/>
						<input class="form-control" name="mid" value='<sec:authentication property="principal.username"/>'  style=" width: 28%;;float: left;background: white;border-color: black;">
					</div>
                  <div class="form-group">
                     <label style="margin-top: 1%;margin-bottom: 1%;"><strong>내용</strong></label> 
                     <textarea class="form-control" rows="25" name="bcontent" style="resize: none; font-size: x-small;border-color: black;" ></textarea>
                  </div>
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
               
                  <input type='hidden' name='divide' value='C'/>
                  <button type="button" class="btn btn-default" onclick="location.href='${contextPath}/QnABoard/customer'" style="float: right;">취소</button>
                  <button type="button" class="btn btn-default" id="btnCRegister"  style="float: right; margin-right: 1%">등록</button>&nbsp;
                 <sec:csrfInput />
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

var divide = "${divide}";
var frmCregister = $("#frmCregister");
var frmNregister = $("#frmNregister"); 

<%-- 버튼--%>


<%-- 공지사항 null값 체크--%>
	function sendNoticeBoard(){
		var frmNotices=document.frmNotices;
		var btitle=frmNotices.btitle.value;
		var bcontent=frmNotices.bcontent.value;
		var mid=frmNotices.mid.value;
		
		if( (btitle.length==0 ||btitle=="") || (bcontent.length==0 ||bcontent=="") ||
			(mid.length==0 ||mid=="") ){
			return false ;
		} else {
			return true ;
		}
	}


<%-- 고객문의 null값 체크--%>
	function sendCustomerBoard(){
		var frmCustomer=document.frmCustomer;
		var btitle=frmCustomer.btitle.value;
		var bcontent=frmCustomer.bcontent.value;
		var mid=frmCustomer.mid.value;
		
		if( (btitle.length==0 ||btitle=="") || (bcontent.length==0 ||bcontent=="") ||
			(mid.length==0 ||mid=="") ){
			return false ;
		} else {
			return true ;
		}
	}


<%-- 관리자 공지사항 등록버튼--%>
	$("#btnNRegister").on("click", function() {
	
		if (!sendNoticeBoard()){
			alert("글제목/글내용/작성자를 모두 입력해야 합니다.");
			return ;
		}
	
	   	 var strinputHidden = "" ;
	   	 
	   	 $(".fileUploadResult ul li").each(function(i,obj){
	   		 var objLi = $(obj);
	   		 strinputHidden
	   		 	+="<input type='hidden' name='attachFileList["+i+"].uuid' value='"+objLi.data("uuid")+"'>"
	   			+ "<input type='hidden' name='attachFileList["+i+"].uploadpath' value='"+objLi.data("uploadpath")+"'>"
	   			+ "<input type='hidden' name='attachFileList["+i+"].filename' value='"+objLi.data("filename")+"'>"
	   		 	
	   	 });
	        	 
	   			frmNregister.append(strinputHidden);
	       	  	frmNregister.attr("method", "post");
	   			frmNregister.attr("action", "${contextPath}/QnABoard/register");
	   			frmNregister.submit();
	});

<%-- 고객 문의 등록버튼--%>
	$("#btnCRegister").on("click", function() {
	
		if (!sendCustomerBoard()){
			alert("글제목/글내용/작성자를 모두 입력해야 합니다.");
			return ;
		}
	
	   	 var strinputHidden = "" ;
	   	 
	   	 $(".fileUploadResult ul li").each(function(i,obj){
	   		 var objLi = $(obj);
	   		 strinputHidden
	   		 	+="<input type='hidden' name='attachFileList["+i+"].uuid' value='"+objLi.data("uuid")+"'>"
	   			+ "<input type='hidden' name='attachFileList["+i+"].uploadpath' value='"+objLi.data("uploadpath")+"'>"
	   			+ "<input type='hidden' name='attachFileList["+i+"].filename' value='"+objLi.data("filename")+"'>"
	   		 	
	   	 });
	        	 
	   			frmCregister.append(strinputHidden);
	       	  	frmCregister.attr("method", "post");
	   			frmCregister.attr("action", "${contextPath}/QnABoard/register");
		   		frmCregister.submit();
	});


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
		
			str += "<li data-uploadpath='"+obj.uploadpath +"'"
				+  "	data-uuid='"+obj.uuid+"'"
				+  "	data-filename='"+obj.filename+"'>"
				+  " <img src='${contextPath}/QnAThumbnail?filename=" + thumbnailFilePath + "'"
				+  " 	  alt='No Icon' style='height: 18px; width: 18px;'>"
				+ 		obj.filename
				+	"<span data-filename='" +thumbnailFilePath+"'>[삭제]</span>"
				+ "</li>";
		});
		
		fileUploadResult.append(str);
	}

var cloneInputFile = $(".uploadDiv").clone();


<%-- 첨부파일 업로드--%>
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
			beforeSend: function(xhr) {
				 xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				 },
			dataType:'json',

			success: function(uploadResult, status){
				$(".uploadDiv").html(cloneInputFile.html());

				showUploadFile(uploadResult);

			}
		})
		  
	});
	
	
<%-- 첨부삭제--%>
	$(".fileUploadResult").on("click","span",function(e){
		
		var targetFileName = $(this).data("filename");
		
		var parentLi = $(this).parent();
		
		$.ajax({
			type:'post',
			url:'${contextPath}/delQnAUploadFile',
			data: {"filename" : targetFileName},
			dataType:'text',
			success:function(result){
				
				if(result =="SuccessDeletingFile"){
					parentLi.remove();
				}else{
					alert("오류: 삭제실패")
				}
			}
		});
			
	});
	


$(document).ready(function(){

	});


</script>

<%@ include file="../include/myfooter.jsp" %>

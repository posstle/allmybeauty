<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <!-- jstl / c:if... 등 사용 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> <!--  fmt:fomrmatDate.. 형식 사용 -->
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> <!-- 스프링 시큐리티  -->

<%@ include file="../include/myheader.jsp" %>

<c:set var="contextPath" value="${pageContext.request.contextPath }"/>   

<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
  </head>
  
  <style>
    	  .my-hr2 {
	    border: 0;
	    height: 2px;
	    background: #ccc;
	  }
	  
	  .modal {
        text-align: center;
        border-radius:10px;
}
 
@media screen and (min-width: 768px) { 
        .modal:before {
                display: inline-block;
                vertical-align: middle;
                content: " ";
                height: 100%;
        }
        
    .modal-header{
     width:100%;
     background-color:#22D3D6;
     }
	.modal-dialog {
	        display: inline-block;
	        text-align: left;
	        vertical-align: middle;
	        border-radius:10px;
	        bottom:0; 
	        box-shadow: 5px 10px 10px 1px rgba(0,0,0,.3);
	        border-radius:10px;      
	        overflow:hidden;   
	}

	.modal-body{
	           
	  max-width:600px;          
	  border-radius:30px;  
	  vertical-align: middle;    
	  overflow:hidden;         
	  background-color:#f6f6f6; 
	   border-radius:10px;      
	  overflow:hidden;          
	
	}
}
 
	  
  </style>


  

  
            
      <section class="module">
          
          <div class="container" style=text-align:center; >
             <h3 class="font-alt" style="font-size:45px; color:#000000;"><strong>회원탈퇴</strong></h3>
             <h5 class="font-alt" >회원 탈퇴 신청 전 유의 사항을 확인하세요.</h5>
             <hr class="my-hr2">
             <h4 class="font-alt" style="text-align: center;">
                   <strong>회원탈퇴(이용약관 동의철회)시 아래 내용을 확인해주세요.</strong></h4>


		        <button  style="background-color:#EAEAEA;" class="custom-btn btn-10 btn-ico" data-toggle="modal" data-target="#myModal">
		                AllMyBeauty서비스 이용약관 확인
		        </button> 
 

      <hr class="my-hr2">
            <div style="text-align: center;">
	              <form class="form" id="frmMemberDelete" name="frmMemberDelete" style="display: inline-block;">         
	                       
	                
	                 <div class="form-group">
                          <input style="text-align: center; border:1px solid #5D5D5D; text-align:center;" class="form-control" id="mpw" type="password" name="mpw" placeholder="비밀번호를 입력하세요" />
                      </div>
                      
                   <!--  비밀번호가 틀렸을 시 -->
                      <c:if test="${PwCheckResult == 0 }">
                             <div class="form-group" id="PwCheck" style="margin-top : 30px; text-align:center; color : red;">
                                     비밀번호가 틀렸습니다.
                             </div>
                      </c:if> 
	                       
	                <h4><strong>AllMyBeauty 회원탈퇴(이용약관 동의 철회)를 하시겠습니까?</strong></h4>
	                 <button  type="button" id="btnMyPagedelete" class="btn btn-success btn-circle btnDelete" >회원탈퇴</button>
	                 <button type="button" id="btnMyPageDetail" class="btn btn-default btn-circle btnCancel" data-mid='<c:out value="${mypagedelete.mid }"/>'>취소</button>
	                  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> 
	                     	                      
	             </form>
            </div>
      
      <!-- 탈퇴 -->
            <form class="formDelete" id="frmDelete" name="frmDelete">
             <input type="hidden" name="mid" class="delete_mid" value="${mypagedelete.mid }">
               
            </form>
          
           </div>
          
          
                <!-- Modal --> 
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"> 
        <div class="modal-dialog"> 
                <div class="modal-content"> 
                        <div class="modal-header"> 
                        
                                 <button type="button" class="close" data-dismiss="modal" aria-hidden="true" style="float: right;">&times;</button> 
                                <h3 class="modal-title" id="myModalLabel" style="color:#FFFFFF; text-align: center;">AllMyBeauty서비스 이용약관</h3> 
                               
                        </div> 
                        <div class="modal-body"> 
                              <h4 style="color:#000000; text-aling:center;"><strong>*회원 탈퇴 전, 유의사항*</strong></h4>
                             <span style="font-size:13px">- 현재 사용하고 계신 아이디로 탈퇴하실 경우 아이디의 재사용 및 복구가 불가능합니다.</span><br>
                             <span style="font-size:13px">- 거래 정보가 있는 경우, 전자상거래 등에서의 소비자 보호에 관한 법률에 따라 계약 또는 청약 철회 &nbsp;&nbsp;&nbsp;에 관한 기록, 
                                                                           대금결제 및 재화 등의 공급에 관한 기록은 5년간 보존됩니다.</span><br>
                             <span style="font-size:13px">- 보유하셨던 포인트는 탈퇴와 함께 삭제되며 사용이 불가능합니다.</span><br>
                             <span style="font-size:13px">- 탈퇴 후 회원정보 및 서비스 이용기록은 완전시 삭제됩니다.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><br>
                             <span style="font-size:13px">- AllMyBeauty 이용약관 동의를 철회한 후에라도 해당 약관에 다시 동의하시면 서비스를 이용할 &nbsp;&nbsp;&nbsp;수 있습니다.</span>
                        </div> 
                </div> 
        </div> 
</div>    
        </section>
        
      
  
  
 <script type="text/javascript">
 
 var loginUser = "";
 <sec:authorize access="isAuthenticated()">
    loginUser = '<sec:authentication property="principal.username"/>';
 </sec:authorize>
 
 var csrfHeaderName = "${_csrf.headerName}";
 var csrfTokenValue = "${_csrf.token}";
 
 $(document).ajaxSend(function(e, xhr, options){
	    xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
	});
 
var frmMemberDelete = $("#frmMemberDelete"); 
var mid = '<sec:authentication property="principal.username"/>';
var pw = '<c:out value="${mypagemember.mpw}"/>';



//탈퇴
$(".btnDelete").on("click", function(){
	
	 var mpw=$("#mpw").val();
	   
	   if(mpw == ""){
	      alert("비밀번호를 입력해주세요"); 
	   }else{
		   alert("탈퇴 하시겠습니까?");
	      frmMemberDelete.attr("action" , "${contextPath}/mypage/mypagememdelete?mid=" + mid);
	      frmMemberDelete.attr("method", "post");    
	      frmMemberDelete.submit();
	   }
	
});

var frmDelete = $("#frmDelete");

// 취소
$(".btnCancel").on("click", function(){
	
	var mid1 = $(this).data("mid");
	$(".delete_mid").val(mid1);
	
	//alert(mid1);
	
	frmDelete.attr("action" , "${contextPath}/mypage/mypagedetail?mid=" + mid1);
	frmDelete.attr("method","get");
	frmDelete.submit();
});

//엔터키 눌렀을 때 이동하는 key 이벤트 
$("#mpw").keydown(function(e){
	
	var mpw=$("#mpw").val();
	   
	if(e.keyCode == 13){
			alert("탈퇴 하시겠습니까?");
			frmMemberDelete.attr("action" , "${contextPath}/mypage/mypagememdelete?mid=" + mid);
			frmMemberDelete.attr("method","post");
			frmMemberDelete.submit();

	}
})


 </script>
  
  
  
</html>
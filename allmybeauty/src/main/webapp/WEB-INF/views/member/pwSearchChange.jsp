<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/myheader.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
  </head>
  <body data-spy="scroll" data-target=".onpage-navigation" data-offset="60">
    <main>
      <div class="page-loader">
        <div class="loader">Loading...</div>
      </div>
        <div class="container">
      </div>
      <div class="main">
        
        <section class="module">
        	
          <div class="container" style=text-align:center; >
          	<span class="font-alt" style="font-size:25px;"><strong>비밀번호 재설정</strong></span><br>
            <span class="font-alt" style="font-size:18px;"><strong>기존 비밀번호는 암호화 처리되어 안내가 불가능합니다.</strong></span><br>
                <hr class="divider-w mb-10">
                <%-- 로그인 하지 않은 상태 --%>
            <form class="form" id="pwChange_form" style="display: inline-block;">
                  
                  <div class="form-group">
                    <input class="form-control" id="mpw" type="password" name="mpw" placeholder="PASSWORD" required/>
                    	<span class="final_mpw_ck" style="color:blue; display:none;">필수 : 비밀번호를 입력해주세요.</span>
                    <input class="form-control" id="mpwck" type="password" name="mpwck" placeholder="PASSWORD-CHECK" required/>
                  		<span class="final_mpwck_ck" style="color:blue; display:none;">필수 : 비밀번호 확인을 입력해주세요.</span>
                  		<span class="mpwck_input_use" style="color:green; display:none" >비밀번호가 일치합니다.</span>
                		<span class="mpwck_input_notuse" style="color:red; display:none">비밀번호가 일치하지 않습니다.</span>
                  </div>
                  
                  <div class="form-group">
                    <button type="button" class="btn btn-primary btn-circle" id="pwChange_btn">변경</button>
                    <button type="button" class="btn btn-default btn-circle" id="login_btn"
                    		onClick="location.href='${contextPath}/member/myLogin'">취소</button>
                  </div>
                  
                 
                </form>
                <hr class="divider-w mb-10">
            <h5 class="font-alt">주의사항 : (Caps Lock) 대/소문자 확인<br> </h5>
          	<h5 class="font-alt">비밀번호와 비밀번호확인은 동일하게 작성해주시길 바랍니다.<br> </h5>
          </div>
        </section>
        
      </div>
      <div class="scroll-up"><a href="#totop"><i class="fa fa-angle-double-up"></i></a></div>
    </main>
    
<script>

var pwChange = $("#pwChange_form");

var mpwCheck = false;	  	 //비번 
var mpwckCheck = false;   	 //비번 확인 

//비밀번호 확인 일치 유효성 검사 (입력을 할 때마다 실행이 되는 메서드) : 가입 버튼 누른 후 작동
$("#mpwck").on("propertychange change keyup paste input", function(e){

	var mpw = $("#mpw").val(); //비밀번호 값
	var mpwck = $("#mpwck").val(); //비밀번호 확인값 
	//비밀번호 확인입력해주세요 경고를 없애기
	$(".final_mpwck_ck").css("display", "none");

if(mpw == mpwck){
	$(".mpwck_input_use").css("display", "inline-block");
	$(".mpwck_input_notuse").css("display", "none");
	mpwckCorCheck = true;
}else{
	$(".mpwck_input_use").css("display", "none");
	$(".mpwck_input_notuse").css("display", "inline-block");
	mpwckCorCheck = false;
}

});

//변경버튼
$("#pwChange_btn").on("click",function(e){
	
	var mpw = $("#mpw").val();
	var mpwck = $("#mpwck").val();
	
	//비밀번호 유효성 검사
	if(mpw == ""){
		$(".final_mpw_ck").css("display", "inline-block");
		mpwCheck = false;
	}else{
		$(".final_mpw_ck").css("display", "none");
		mpwCheck = true;
	}
	
	//비밀번호 확인 유효성 검사
	if(mpwck == ""){
		$(".final_mpwck_ck").css("display", "inline-block");
		mpwckCheck = false;
	}else{
		$(".final_mpwck_ck").css("display", "none");
		mpwckCheck = true;	
	}
	
	//비밀번호 확인 일치 유효성 검사 (입력을 할 때마다 실행이 되는 메서드) : 가입 버튼 누른 후 작동
	$("#mpwck").on("propertychange change keyup paste input", function(e){
	
		var mpw = $("#mpw").val(); //비밀번호 값
		var mpwck = $("#mpwck").val(); //비밀번호 확인값 
		//비밀번호 확인입력해주세요 경고를 없애기
		$(".final_mpwck_ck").css("display", "none");
	
	if(mpw == mpwck){
		$(".mpwck_input_use").css("display", "inline-block");
		$(".mpwck_input_notuse").css("display", "none");
		mpwckCorCheck = true;
	}else{
		$(".mpwck_input_use").css("display", "none");
		$(".mpwck_input_notuse").css("display", "inline-block");
		mpwckCorCheck = false;
	}
	
	});

	
	//최종 유효성 검사
	if(mpwCheck&&mpwckCheck){
		
		alert("비밀번호 변경이 완료되었습니다.");
		pwChange.attr("action", "${contextPath}/member/pwSearchChange");
		pwChange.attr("method", "POST");
		pwChange.submit(); 	
	}
	
	//단 한개라도 false가 있을 경우 해당 코드를 읽음. (정상 종료 못할 경우를 대비)
	return false; 
	
});




</script>

<%@ include file="../include/myfooter.jsp" %>
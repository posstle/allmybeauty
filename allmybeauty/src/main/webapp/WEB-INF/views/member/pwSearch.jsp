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
          	<span class="font-alt" style="font-size:25px;"><strong>비밀번호 찾기</strong></span><br>
            <span class="font-alt" style="font-size:18px;"><strong>(이메일 인증)</strong></span><br>
                <hr class="divider-w mb-10">
                <%-- 로그인 하지 않은 상태 --%>
            <form class="form" id="pwSearch_form" style="display: inline-block;">
                  
                   <div class="form-group" >
                    <input class="form-control" id="mid" type="text" name="mid" placeholder="ID" required/>
                    	<span class="final_mid_ck" style="color:blue; display:none;">필수 : 아이디를 입력해주세요.</span>
                  </div>
                  
                  <%-- 아이디와 이메일 불일치 시--%>
                  <c:if test = "${pwSearchResult == 0}">
	                  <div class="form-group" id="idSearch_warn" style="text-align: center; color : red;">
	                  	아이디와 이메일을 확인해주세요.
	                  </div>   
                  </c:if>
                  
                  <div class="form-group">	
                    <input class="form-control" id="memail" type="text" name="memail"  placeholder="E-MAIL" required/>
                 	   <span class="final_memail_ck" style="color:blue; display:none;">필수 : 이메일을 입력해주세요.</span>
                 	   <span class="email_input_warn" style="color:red;"></span>
                    <div class="mail_check_input_box" id="mail_check_input_box_false" style="background-color:#ebebe4;">
                    	<input class="form-control" id="mail_check_input" style="text-align: center;" placeholder="인증번호 입력" disabled="disabled"/>
                    </div>
                   	<input class="form-control" style="background-color:#949494; color:white;" id="mail_checkBtn" type="button" value="메일 인증번호 전송"> 
                    <div id="clearfix">
                    	<span id="mail_check_input_box_warn"></span>
                    </div>
                  </div>
                 
                  <div class="form-group">
                    <button type="button" class="btn btn-primary btn-circle" id="pwSearch_btn">찾기</button>
                    <button type="button" class="btn btn-default btn-circle" id="login_btn"
                    		onClick="location.href='${contextPath}/member/myLogin'">취소</button>
                  </div>
                  
                 
                </form>
                <hr class="divider-w mb-10">
            <h5 class="font-alt">E-MAIL 입력하실 때 오타에 주의해주시길 바랍니다.</h5>
            <h5 class="font-alt">인증이 완료되면 비밀번호를 변경하실 수 있습니다.</h5>
          </div>
        </section>
        
      </div>
      <div class="scroll-up"><a href="#totop"><i class="fa fa-angle-double-up"></i></a></div>
    </main>
    
<script>

var pwSearch = $("#pwSearch_form");

var emailCode = ""; //이메일 전송 인증번호 저장코드

//유효성 검사 통과유무 (Check부분에만 카멜)
var midCheck = false;     	 //아이디 
var memailCheck = false;     //메일 
var memailnumCheck = false;  //메일 인증번호 확인

//입력 이메일 형식 유효성 검사 
function emailCheck(memail){
  
	var form = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
   
	return form.test(memail);
}

//찾기 버튼(회원가입 기능작동)
$("#pwSearch_btn").on("click", function(e){
	
	var mid = $("#mid").val();
	var memail = $("#memail").val();
	
	//아이디 유효성 검사
	//id를 입력할 때 아무것도 없으면 span태그가 보이고 Check는 false 
	//입력되어 있으면 span태그는 사라지고 idCheck는 true
	if(mid == ""){
		$(".final_mid_ck").css("display", "inline-block");
		midCheck = false;
	}else{
		$(".final_mid_ck").css("display", "none");
		midCheck = true;
	}
	
	//이메일 유효성검사 (이메일 인증번호 확인 유효성 검사는 blur.function에)
	if(memail == ""){
		$(".final_memail_ck").css("display", "inline-block");
		memailCheck = false;
	}else{
		$(".final_memail_ck").css("display", "none");
		memailCheck = true;
	}

	//최종 유효성 검사
	if(midCheck&&memailCheck&&memailnumCheck){
		
		pwSearch.attr("action", "${contextPath}/member/pwSearch");
		pwSearch.attr("method", "post");
		pwSearch.submit();
		
	}
		
	//단 한개라도 false가 있을 경우 해당 코드를 읽음. (정상 종료 못할 경우를 대비)
	return false; 

	
}); <%-- 찾기 btn 클릭 function - end --%>


//인증번호 이메일 전송 클릭시
$("#mail_checkBtn").on("click", function(e){

	
	var memail = $("#memail").val(); //입력한 이메일
	var emailChNum = $("#mail_check_input"); //인증번호 입력란
	var emailChNumBox = $(".mail_check_input_box"); //인증번호 입력란 박스
	var warnMsg = $(".email_input_warn"); //이메일 입력 경고글

	if(emailCheck(memail)){
		alert("인증번호를 해당 메일로 보내드렸습니다.");
        warnMsg.css("display", "none");
        
        $.ajax({
    		type : "get",
    		url : "${contextPath}/member/mailCheck?memail=" + memail,
    		
    		success : function(data){

    			
    			emailChNum.attr("disabled", false); //성공하면 disabled를 풀어줌.
    			emailChNumBox.attr("id", "mail_check_input_box_true"); //id값 변경(흰색 -> 회색) css파일 맨밑에 있음.
    			emailCode = data;
    			
    			//console.log("emailCode : " + emailCode);
    		} //success -end
    		
    	});
        
	}else{
		warnMsg.html("올바르지 못한 이메일 형식입니다.");
		warnMsg.css("display", "inline-block");
	}
	
	
	
});

//인증번호 비교
//blur 기능 : focus가 다른곳으로 이동시에 작동함. (뒤에 핸드폰번호와 우편번호가 있기때문에 확인버튼은 따로만들지 않음.)
$("#mail_check_input").blur(function(){
	
	var inputEmailCode = $("#mail_check_input").val();
	var checkResult = $("#mail_check_input_box_warn");
	
	if(inputEmailCode == emailCode){
		checkResult.html("인증에 성공하셨습니다.");
		checkResult.css("color", "green");
		memailnumCheck = true; //인증번호 유효성검사
		
	}else{
		checkResult.html("인증번호를 다시 확인해주세요.");
		checkResult.css("color", "red");
		memailnumCheck = false; //인증번호 유효성검사
	}
	
	
});



</script>

<%@ include file="../include/myfooter.jsp" %>
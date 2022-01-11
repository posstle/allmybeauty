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
          	<span class="font-alt" style="font-size:25px;"><strong>로그인</strong></span><br>
            <span class="font-alt" style="font-size:15px;">ALL MY BEAUTY의 다양한 서비스를 누리세요</span><br>
                <hr class="divider-w mb-10">
                
            <form class="form" id="login_form" style="display: inline-block;">
                  <div class="form-group">
                    <input class="form-control" id="username" type="text" name="username" placeholder="ID" required/>
                  </div>
                  <div class="form-group">
                    <input class="form-control" id="password" autocomplete="password" type="password" name="password" placeholder="PASSWORD" required/>
                  </div>
                  
                  <%-- 오류에 의한 호출 시 오류 메세지 표시 --%>
                  <div class="form-group" style="text-align:center; color:red;">
                    <c:out value="${error}"/>
                  </div>
                  
                  <%-- 스프링 시큐리티 이후 테스트 해봐야함. : 안됨 --%>
                  <%-- 로그인 실패 시--%>
                  <c:if test = "${loginResult == 0}">
	                  <div class="form-group" id="login_warn" style="text-align: center; color : red;">
	                  	사용자 ID 또는 비밀번호를 잘못 입력하셨습니다.
	                  </div>   
                  </c:if>
                  
                  <div class="form-group">
                    <button type="button" class="btn btn-primary btn-circle" id="login_btn">로그인</button>
                    <button type="button" class="btn btn-default btn-circle" id="login_join"
                    		onClick="location.href='${contextPath}/member/join'">회원가입</button><br>
                  </div>
                  
                  <div class="form-group">
                  	<label><input name="remember-me" type="checkbox" />&nbsp;&nbsp;자동로그인 </label>
                  </div>
                  
                  
                  
                  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                  
                </form>
                <hr class="divider-w mb-10">
                
                 <div class="form-group">
                  	<a href="${contextPath}/member/idSearch">아이디 찾기</a>&nbsp;&nbsp;/&nbsp;&nbsp;
                  	<a href="${contextPath}/member/pwSearch">비밀번호 찾기</a>
                 </div>
            
          </div>
        </section>
        
      </div>
      <div class="scroll-up"><a href="#totop"><i class="fa fa-angle-double-up"></i></a></div>
    </main>
    
<script>
var login_form = $("#login_form");

//로그인 버튼(회원가입 기능작동)
$("#login_btn").on("click", function(e){
	
	//alert("로그인 버튼 작동"); //작동 되는지 확인(OK)
	
	login_form.attr("action", "${contextPath}/member/myLogin");
	login_form.attr("method", "post");
	login_form.submit();
	
}); <%-- 회원가입 btn 클릭 function - end --%>

//비밀번호 창에서 키를 눌렀을 경우
$("#password").keydown(function(key){
	//엔터키(13번)을 눌렀을 때.
	if(key.keyCode == 13){
		login_form.attr("action", "${contextPath}/member/myLogin");
		login_form.attr("method", "post");
		login_form.submit();
	}
	
});


</script>

  </body>
</html>
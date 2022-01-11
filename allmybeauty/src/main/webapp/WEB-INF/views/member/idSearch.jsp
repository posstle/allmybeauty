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
          	<span class="font-alt" style="font-size:25px;"><strong>아이디 찾기</strong></span><br>
                <hr class="divider-w mb-10">
                <%-- 로그인 하지 않은 상태 --%>
            <form class="form" id="idSearch_form" style="display: inline-block;">
                  <div class="form-group">
                    <input class="form-control" id="mname" type="text" name="mname" placeholder="NAME" required/>
                  </div>
                  <div class="form-group">
                    <input class="form-control" id="memail" type="text" name="memail" placeholder="EMAIL" required/>
                  </div>
                  
                  <%-- 아이디찾기 실패 시--%>
                  <c:if test = "${idSearchResult == 0}">
	                  <div class="form-group" id="idSearch_warn" style="text-align: center; color : red;">
	                  	일치하는 계정이 없습니다.
	                  </div>   
                  </c:if>
                  
                  <div class="form-group">
                    <button type="button" class="btn btn-primary btn-circle" id="idSearch_btn">찾기</button>
                    <button type="button" class="btn btn-default btn-circle" id="login_btn"
                    		onClick="location.href='${contextPath}/member/myLogin'">취소</button>
                  </div>
                  
                 
                </form>
                <hr class="divider-w mb-10">
            <h5 class="font-alt">아이디는 회원가입 시 입력하신 이메일을 통해 찾을 수 있습니다.</h5>
          </div>
        </section>
        
      </div>
      <div class="scroll-up"><a href="#totop"><i class="fa fa-angle-double-up"></i></a></div>
    </main>
    
<script>
var idSearch = $("#idSearch_form");

//찾기 버튼(회원가입 기능작동)
$("#idSearch_btn").on("click", function(e){
	
	//alert("로그인 버튼 작동"); //작동 되는지 확인(OK)
	idSearch.attr("action", "${contextPath}/member/idSearch");
	idSearch.attr("method", "post");
	idSearch.submit();
	
}); <%-- 회원가입 btn 클릭 function - end --%>

//Enter Key 활성화 (작동왜안해)
$("#memail").keydown(function(key){
	//엔터키(13번)을 눌렀을 때.
	if(key.keyCode == 13){
		
		idSearch.attr("action", "${contextPath}/member/idSearch");
		idSearch.attr("method", "post");
		idSearch.submit();
	}
	
});


</script>
<%@ include file="../include/myfooter.jsp" %>
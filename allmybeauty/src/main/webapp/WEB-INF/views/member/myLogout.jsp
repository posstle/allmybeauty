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
        <section class="module" style="height:300px;" data-background="${contextPath}/resources/images/join3.jpg">
          <div class="container">
            <div class="row">
              <div class="col-sm-6 col-sm-offset-3">
                <h1 class="module-title font-alt mb-0"></h1>
              </div>
            </div>
          </div>
        </section>
        <section class="module">
        	
          <div class="container" style=text-align:center; >
          	<span class="font-alt" style="font-size:25px;"><strong>로그아웃 하시겠습니까?</strong></span><br>
                <hr class="divider-w mb-10">
                
            <form class="form" id="logout_form" 
            	  style="display: inline-block;"
            	  action="${contextPath}/logout" method='post'>
                  
                  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                  
                  <div class="form-group">
                    <button type="button" class="btn btn-primary btn-circle" id="logout_btn">로그아웃</button>
                  </div>
                  
                </form>
                
            
          </div>
        </section>
        
      </div>
      <div class="scroll-up"><a href="#totop"><i class="fa fa-angle-double-up"></i></a></div>
    </main>
    
<script>
var logout_form = $("#logout_form");

//로그아웃 버튼
$("#logout_btn").on("click", function(e){
	
	/* var logoutConfirm = confirm("로그아웃 하시겠습니까?");
	
	if(!logoutConfirm){
		
		alert("로그아웃이 취소되었습니다.");
		return;
	
	}else{ */
		
		logout_form.submit();
	/* } */
	
}); <%-- 회원가입 btn 클릭 function - end --%>


</script>
<%@ include file="../include/myfooter.jsp" %>
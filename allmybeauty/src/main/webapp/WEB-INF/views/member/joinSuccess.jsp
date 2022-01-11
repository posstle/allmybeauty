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
          	<span class="font-alt" style="font-size:50px;"><strong>회원가입을 축하드립니다.</strong></span>
                <hr class="divider-w mb-10">
            <form class="form" id="login_form" style="display: inline-block;">
                  
		          
		          <span class="font-alt" style="font-size:20px;"><strong>고객님의 사이트 이용에 불편하지 않도록 노력하겠습니다.</strong></span><br>
                  <span class="font-alt" style="font-size:20px; color:#337AB7;"><strong>로그인</strong></span>
                  <span class="font-alt" style="font-size:20px;"><strong> 후 바로 서비스 이용이 가능합니다. 아래 버튼을 선택해주세요.</strong></span>
                  
                  <hr class="divider-w mb-10">
                  
                  <div class="form-group">
                    <button type="button" class="btn btn-primary btn-circle" id="main_btn"
                    		onClick="location.href='${contextPath}/main'">&nbsp;메인&nbsp;</button>
                    <button type="button" class="btn btn-default btn-circle" id="login_join"
                    		onClick="location.href='${contextPath}/member/myLogin'">로그인</button>
                  </div>
                  
                </form>
          </div>
        </section>
      
      </div>
      <div class="scroll-up"><a href="#totop"><i class="fa fa-angle-double-up"></i></a></div>
    </main>
    

<%@ include file="../include/myfooter.jsp" %>
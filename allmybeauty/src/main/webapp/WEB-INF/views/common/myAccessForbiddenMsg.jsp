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
          	<span class="font-alt" style="font-size:25px;"><strong>접근제한</strong></span><br>
            <span class="font-alt" style="font-size:15px;">회원님은 해당 페이지를 이용하실 수 없습니다.</span><br>
            <span class="font-alt" style="font-size:15px;">
            	<c:out value="${SPRING_SECURITY_403_EXCEPTION.getMessage()}"/>
            </span><br>
            <h1><strong><a href="${contextPath}/main">메인페이지로 돌아가기</a></strong></h1><br>
            
            <hr class="divider-w mb-10">
            	
            <span class="font-alt" style="font-size:15px;">
            	msg : <c:out value="${msg}"/>
            </span><br>
            	
         
                
                
          </div>
        </section>
        
      </div>
     
    </main>

  </body>
</html>
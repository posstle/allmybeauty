<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<c:set var = "contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--  
    Document Title
    =============================================
    -->
    <title>ALL MY BEAUTY</title>
    <!--  
    Favicons
    =============================================
    -->
    <link rel="apple-touch-icon" sizes="57x57" href="${contextPath}/resources/images/favicons/apple-icon-57x57.png">
    <link rel="apple-touch-icon" sizes="60x60" href="${contextPath}/resources/images/favicons/apple-icon-60x60.png">
    <link rel="apple-touch-icon" sizes="72x72" href="${contextPath}/resources/images/favicons/apple-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="76x76" href="${contextPath}/resources/images/favicons/apple-icon-76x76.png">
    <link rel="apple-touch-icon" sizes="114x114" href="${contextPath}/resources/images/favicons/apple-icon-114x114.png">
    <link rel="apple-touch-icon" sizes="120x120" href="${contextPath}/resources/images/favicons/apple-icon-120x120.png">
    <link rel="apple-touch-icon" sizes="144x144" href="${contextPath}/resources/images/favicons/apple-icon-144x144.png">
    <link rel="apple-touch-icon" sizes="152x152" href="${contextPath}/resources/images/favicons/apple-icon-152x152.png">
    <link rel="apple-touch-icon" sizes="180x180" href="${contextPath}/resources/images/favicons/apple-icon-180x180.png">
    <link rel="icon" type="image/png" sizes="192x192" href="${contextPath}/resources/images/favicons/android-icon-192x192.png">
    <link rel="icon" type="image/png" sizes="32x32" href="${contextPath}/resources/images/favicons/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="96x96" href="${contextPath}/resources/images/favicons/favicon-96x96.png">
    <link rel="icon" type="image/png" sizes="16x16" href="${contextPath}/resources/images/favicons/favicon-16x16.png">
    <link rel="manifest" href="${contextPath}/resources/images/favicons/manifest.json">
    
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
    
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="msapplication-TileImage" content="${contextPath}/resources/images/favicons/ms-icon-144x144.png">
    <meta name="theme-color" content="#ffffff">
     <!--  
    JavaScripts
    =============================================
    -->
    <%-- <script src="${contextPath}/resources/lib/jquery/dist/jquery.js"></script> --%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="${contextPath}/resources/lib/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="${contextPath}/resources/lib/wow/dist/wow.js"></script>
    <script src="${contextPath}/resources/lib/jquery.mb.ytplayer/dist/jquery.mb.YTPlayer.js"></script>
    <script src="${contextPath}/resources/lib/isotope/dist/isotope.pkgd.js"></script>
    <script src="${contextPath}/resources/lib/imagesloaded/imagesloaded.pkgd.js"></script>
    <script src="${contextPath}/resources/lib/flexslider/jquery.flexslider.js"></script>
    <script src="${contextPath}/resources/lib/owl.carousel/dist/owl.carousel.min.js"></script>
    <%-- <script src="${contextPath}/resources/lib/smoothscroll.js"></script> --%>
    <script src="${contextPath}/resources/lib/magnific-popup/dist/jquery.magnific-popup.js"></script>
    <script src="${contextPath}/resources/lib/simple-text-rotator/jquery.simple-text-rotator.min.js"></script>
    <script src="${contextPath}/resources/js/plugins.js"></script>
    <script src="${contextPath}/resources/js/main.js"></script>
    <!--  
    Stylesheets
    =============================================
    -->
    <!-- Default stylesheets-->
    <link type="text/css" href="${contextPath}/resources/lib/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Template specific stylesheets-->
    <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed:400,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Volkhov:400i" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet">
    <link href="${contextPath}/resources/lib/animate.css/animate.css" rel="stylesheet">
    <link href="${contextPath}/resources/lib/components-font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/lib/et-line-font/et-line-font.css" rel="stylesheet">
    <link href="${contextPath}/resources/lib/flexslider/flexslider.css" rel="stylesheet">
    <link href="${contextPath}/resources/lib/owl.carousel/dist/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/lib/owl.carousel/dist/assets/owl.theme.default.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/lib/magnific-popup/dist/magnific-popup.css" rel="stylesheet">
    <link href="${contextPath}/resources/lib/simple-text-rotator/simpletextrotator.css" rel="stylesheet">
    <!-- Main stylesheet and color file-->
    <link href="${contextPath}/resources/css/style.css" rel="stylesheet">
    <link id="color-scheme" href="${contextPath}/resources/css/colors/default.css" rel="stylesheet">
  </head>
  <body data-spy="scroll" data-target=".onpage-navigation" data-offset="60">
      <div class="page-loader">
        <div class="loader">Loading...</div>
      </div>
      <!-- <nav class="navbar navbar-custom navbar-fixed-top" role="navigation"> -->
<!--       <nav class="navbar navbar-custom navbar-fixed-top navbar-transparent" role="navigation"> -->
      <nav class="navbar navbar-custom navbar-fixed-top" role="navigation">
        <div class="container">
          <div class="navbar-header">
          <!-- <button class="navbar-toggle" type="button" data-toggle="collapse" data-target="#custom-collapse"><span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button> -->
            <a class="navbar-brand" href="${contextPath}/main">ALL MY BEAUTY</a>
          </div>
          
          <div class="navbar-header" style="margin-top:10px; ">
          	<div class="container-1" style="vertical-align: middle; white-space: nowrap; position: relative;">
          	<%-- 검색박스 --%>
          		<span class="icon" 
          			  style="position: absolute; top: 50%; margin-left: 17px; margin-top: 4px; z-index: 1;">
          	    <i class="fa fa-search" style="color:#3560A5;"></i></span>
          	    <form id="frmSearch" action="${contextPath }/product/productList" method="get">
	          		<input type="search" id="keyword" name="keyword"
	          			   style="background: #white; border: none;
	 									      font-size: 11pt; float: left; color: #63717f; padding-left: 45px; -webkit-border-radius: 5px; 
	 									 	  -moz-border-radius: 5px; border-radius: 40px 80px / 80px 40px;" 
	 					   placeholder="Search . ." value="${pagingCreator.productPaging.keyword }"/>
	 				<input type="hidden" name="pageNum" id="pageNum" value="${pagingCreator.productPaging.pageNum }"/>
          		</form>
          	</div>
          </div>
          
          
          <div class="collapse navbar-collapse" id="custom-collapse">
            <ul class="nav navbar-nav navbar-right">
            
             <%-- 로그인 하지 않은 상태 일 경우 loginController에서 가져오는 변수 --%> 
             <sec:authorize access="isAnonymous()">            
             <%-- <c:if test="${memberVO.mid == null}"> --%>
	              <li><a href="${contextPath}/member/myLogin">로그인</a></li>
	              <li><a href="${contextPath}/member/join">회원가입</a></li>
	              <li><a href="#" onclick="notLoginUser()">장바구니</a></li>
             	  <li><a href="${contextPath}/QnABoard/notice">고객문의</a></li>
	              <li><a href="#" onclick="notLoginUser()">MY PAGE</a></li>
             <%-- </c:if> --%>
             </sec:authorize>

				<%--로그인시 --%>
              <sec:authorize access="isAuthenticated()">
					<sec:authentication property="principal" var="principal"/>
						<c:choose>
							<c:when test="${principal.username eq 'admin' }">
						      <li><a href="#" onclick="return false;"><i class="fa fa-fw"></i> 관리자</a>
				              <li><a href="${contextPath}/member/logout">로그아웃</a></li>
	                          <li><a href="${contextPath}/QnABoard/notice">고객문의</a></li>
				              <li><a href="${contextPath}/admin/main">ADMIN PAGE</a></li>
							</c:when> 
							<c:otherwise>
							  <li><a href="#" onclick="return false;"><i class="fa fa-fw"></i>${principal.username }회원님</a>
				              <li><a href="${contextPath}/member/logout">로그아웃</a></li>
				              <li><a href="${contextPath}/cart/cartlist?mid=${principal.username}">장바구니</a></li>
				              <li><a href="${contextPath}/QnABoard/notice">고객문의</a></li>
				              <li><a href="${contextPath}/mypage/mypagedetail?mid=<c:out value="${principal.username }"/>">MY PAGE</a></li>
							</c:otherwise>
						</c:choose>
			</sec:authorize>
            
            </ul>
          </div>
        </div>
      </nav>
      
<script>

<%-- 로그인 계정을 loginUser 변수에 저장,  --%>


function notLoginUser(){
	

	var loginUser = "";
	
	<sec:authorize access="isAuthenticated()">
	   loginUser = '<sec:authentication property="principal.username"/>';
	</sec:authorize>
	
	if(!loginUser){
	     alert("로그인 후 이용가능합니다.");
	}
}

	//검색 엔터키 이벤트
	$("#keyword").keydown(function(key) {
		if (key.keyCode == 13) {
			if ($("#keyword").val()=="" || $("#keyword").val().length==0) {
				alert("검색어를 입력하세요.");
				return false;
			}
			
			$("#pageNum").val(1);
			$("#frmSearch").submit();
		}
	});

</script>
     
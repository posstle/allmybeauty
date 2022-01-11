<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/myheader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<style type="text/css">
.module, .module-small {
	padding: 80px 60px;
}
	</style>
</head>
<body>

 				
	<section class="module" data-background="${contextPath }/resources/images/watercolor-g227ca2d60_1280.png">
		<div class="aside col-sm-2 col-md-2" id="aside">
	                <div class="widget">
	                    <h5 class="widget-title font-alt">관리자메뉴</h5>
	                    <ul class="icon-list"  >
	                        	<li><a href="${contextPath }/admin/main">메인페이지</a></li>
		                  	<li><a href="${contextPath }/product/addproduct">상품등록</a></li>
		                  	<li><a href="${contextPath }/product/productListForAdmin">상품리스트</a></li>
		                  	<li><a href="${contextPath }/admin/adminmemberlist">회원관리</a></li>
		                  	<li><a href="${contextPath }/QnABoard/adminNotice">고객센터관리</a></li>
	                  	</ul>
	                </div>
               </div> 
	
	    
          <div class="container">
            <div class="row">
              <div class="col-sm-6 col-sm-offset-3">
                <h2 class="module-title font-alt">금일 상품 현황</h2>
                <div class="module-subtitle font-serif"></div>
              </div>
            </div>
            <div class="row multi-columns-row">
              <div class="col-sm-6 col-md-3 col-lg-3">
                <div class="count-item mb-sm-40">
                  <div class="count-icon"><span class="glyphicon glyphicon-arrow-up"></span></div>
                  <h3 class="count-to font-alt" data-countto="${todayOrderCount }"></h3>
                  <h5 class="count-title font-serif">주문량</h5>
                </div>
              </div>
              <div class="col-sm-6 col-md-3 col-lg-3">
                <div class="count-item mb-sm-40">
                  <div class="count-icon"><span class="glyphicon glyphicon-arrow-down"></span></div>
                  <h3 class="count-to font-alt" data-countto="${todayOrderInCount }"></h3>
                  <h5 class="count-title font-serif">입고량</h5>
                </div>
              </div>
              <div class="col-sm-6 col-md-3 col-lg-3">
                <div class="count-item mb-sm-40">
                  <div class="count-icon"><span class="glyphicon glyphicon-shopping-cart"></span></div>
                  <h3 class="count-to font-alt" data-countto="${todayOrderOutCount }"></h3>
                  <h5 class="count-title font-serif">출고량</h5>
                </div>
              </div>
              <div class="col-sm-6 col-md-3 col-lg-3">
                <div class="count-item mb-sm-40">
                  <div class="count-icon"><span class="glyphicon glyphicon-usd"></span></div>
                  <h3 class="count-to font-alt" data-countto="${todaySalesTotalPrice }"></h3>
                  <h5 class="count-title font-serif">매출 금액</h5>
                </div>
              </div>
            </div>
          </div>
        </section>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var = "contextPath" value="${pageContext.request.contextPath }"/>

<%@ include file="include/myheader.jsp" %>
      <section class="home-section home-fade home-full-height" id="home">
        <div class="hero-slider">
          <ul class="slides">
            <li class="bg-dark-30 bg-dark shop-page-header" style="background-image:url(&quot;${contextPath}/resources/images/AllMyBeauty-002.jpg&quot;);">
              <div class="titan-caption">
                <div class="caption-content">
               	  <div class="font-alt mb-30 titan-title-size-1"> ALL MY BEAUTY</div>
                  <div class="font-alt mb-30 titan-title-size-4"> 2022년 새해맞이 한정세일</div>
                  <div class="font-alt mb-40 titan-title-size-1">2022.01.01~2022.01.31</div><a class="btn btn-lg btn-border-w btn-round" href="${contextPath }/product/productList?mid=${principal.username }">상품리스트 보기</a>
                </div>
              </div>
            </li>
            <li class="bg-dark-30 bg-dark shop-page-header" style="background-image:url(&quot;${contextPath}/resources/images/AllMyBeauty-002.jpg&quot;);">
              <div class="titan-caption">
                <div class="caption-content">
                  <div class="font-alt mb-30 titan-title-size-1"> ALL MY BEAUTY</div>
                  <div class="font-alt mb-40 titan-title-size-4">Exclusive products</div><a class="btn btn-border-w btn-round" href="${contextPath }/product/productList?mid=${principal.username }">상품리스트 보기</a>
                </div>
              </div>
            </li>
          </ul>
        </div>
      </section>     
<%@ include file="./include/myfooter.jsp" %>
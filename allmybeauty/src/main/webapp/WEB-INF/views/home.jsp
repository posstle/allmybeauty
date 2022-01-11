<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var = "contextPath" value="${pageContext.request.contextPath }"/>
<%@ include file="include/myheader.jsp" %>
      <section class="home-section home-fade home-full-height" id="home">
        <div class="hero-slider">
          <ul class="slides">
            <li class="bg-dark-30 bg-dark shop-page-header" style="background-image:url(&quot;${contextPath}/resources/images/shop/slider1.png&quot;);">
              <div class="titan-caption">
                <div class="caption-content">
                  <div class="font-alt mb-30 titan-title-size-1">ALL MY BEAUTY 윈터세일</div>
                  <div class="font-alt mb-30 titan-title-size-4"> WINTER 2021</div>
                  <div class="font-alt mb-40 titan-title-size-1">한정세일 2021.12.01~2021.12.25</div><a class="section-scroll btn btn-lg btn-border-w btn-round" href="${contextPath }/product/productList">상품리스트 보기</a>
                </div>
              </div>
            </li>
            <li class="bg-dark-30 bg-dark shop-page-header" style="background-image:url(&quot;${contextPath}/resources/images/shop/slider3.png&quot;);">
              <div class="titan-caption">
                <div class="caption-content">
                  <div class="font-alt mb-30 titan-title-size-1"> ALL MY BEAUTY</div>
                  <div class="font-alt mb-40 titan-title-size-4">Exclusive products</div><a class="section-scroll btn btn-border-w btn-round" href="${contextPath }/product/productList">상품리스트 보기</a>
                </div>
              </div>
            </li>
          </ul>
        </div>
      </section>     
<%@ include file="./include/myfooter.jsp" %>

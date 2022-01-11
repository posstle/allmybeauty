<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="contextPath" value="${pageContext.request.contextPath }" />

               <div class="container bg-white" style="width:100%; margin-top: 3%">

              <div class="col-sm-2" style="margin-left: 10%;margin-right: 5%;">
                <div class="widget">
                  <h5 class="widget-title font-alt">About ALL MY BEAUTY</h5>
                  <p >항상 최상의 제품만 취급하는 <br>ALL MY BEAUTY입니다.</p>
                  <p style="margin-top: 5px">
                  		Phone: +1 234 567 89 10
					 <br>Fax: +1 234 567 89 10
					 <br>Email:<a href="#me">somecompany@allmybeauty.com</a>
					 <br> 
					 <div class="footer-social-links" style="font-size: 15px;">
					 <a href="#me"><i class="fa fa-facebook" style="margin-left: 2%;"></i></a>
					 <a href="#me"><i class="fa fa-twitter"  style="margin-left: 2%;"></i></a>
					 <a href="#me"><i class="fa fa-dribbble"  style="margin-left: 2%;"></i></a>
					 <a href="#"><i class="fa fa-skype"  style="margin-left: 2%;"></i></a>
                	</div>
                </p>
                </div>
              </div>
              <div class="col-sm-2" style="margin-right: 5%;">
                <div class="widget">
                  <h5 class="widget-title font-alt">인기제품</h5>
                  <ul class="icon-list">
                    <li>1. <a href="${contextPath }/product/detail?productid=585">레드락토 콜라겐 클리어</a></li>
                    <li>2. <a href="${contextPath }/product/detail?productid=602">방탄소년단/아모레 슬리핑마스크</a></li>
                    <li>3. <a href="${contextPath }/product/detail?productid=596">트릭세라 뉴트리-플루이드 로션 200ML</a></li>
                    <li>4. <a href="${contextPath }/product/detail?productid=590">김고은 멀티밤</a></li>
                    <li>5. <a href="${contextPath }/product/detail?productid=605">롱웨어 크림 스틱 섀도우</a></li>
                  </ul>
                </div>
              </div>
              <div class="col-sm-2" style="margin-right: 5%;">
                <div class="widget">
                  <h5 class="widget-title font-alt">고객센터 영업시간</h5>
                    <p>평일 09:00 ~ 18:00</p>
                </div>
              </div>
               <div class="col-sm-2"style="margin-right:8%;">
                <div class="widget">
                  <h5 class="widget-title font-alt">찾아오시는 길</h5>
                  <!-- * 카카오맵 - 지도퍼가기 -->
               <div style="font:normal normal 400 12px/normal dotum, sans-serif; width:300px; height:250px; color:#333; position:relative"><div><a href="https://map.kakao.com/?urlX=477468.0&amp;urlY=1106278.0&amp;itemId=160208921&amp;q=%EA%B5%AC%ED%8A%B8%EC%95%84%EC%B9%B4%EB%8D%B0%EB%AF%B8&amp;srcid=160208921&amp;map_type=TYPE_MAP&amp;from=roughmap" target="_blank"><img class="map" src="http://t1.daumcdn.net/roughmap/imgmap/0a7547779cac3c5bd80e5a6c6d40f808c5f04771bea3be0f395d6979ed59f66f" width="638px" height="358px" style="border:1px solid #ccc;"></a></div><div style="overflow: hidden; padding: 7px 11px; border: 1px solid rgba(0, 0, 0, 0.1); border-radius: 0px 0px 2px 2px; background-color: rgb(249, 249, 249);">
                  <a href="https://map.kakao.com" target="_blank" style="float: left;"><img src="//t1.daumcdn.net/localimg/localimages/07/2018/pc/common/logo_kakaomap.png" width="72" height="16" alt="카카오맵" style="display:block;width:72px;height:16px"></a>
                  <div style="float: right; position: relative; top: 1px; font-size: 11px;"><a target="_blank" href="https://map.kakao.com/?from=roughmap&amp;srcid=160208921&amp;confirmid=160208921&amp;q=%EA%B5%AC%ED%8A%B8%EC%95%84%EC%B9%B4%EB%8D%B0%EB%AF%B8&amp;rv=on" style="float:left;height:15px;padding-top:1px;line-height:15px;color:#000;text-decoration: none;">로드뷰</a>
                     <span style="width: 1px;padding: 0;margin: 0 8px 0 9px;height: 11px;vertical-align: top;position: relative;top: 2px;border-left: 1px solid #d0d0d0;float: left;"></span><a target="_blank" href="https://map.kakao.com/?from=roughmap&amp;eName=%EA%B5%AC%ED%8A%B8%EC%95%84%EC%B9%B4%EB%8D%B0%EB%AF%B8&amp;eX=477468.0&amp;eY=1106278.0" style="float:left;height:15px;padding-top:1px;line-height:15px;color:#000;text-decoration: none;">길찾기</a><span style="width: 1px;padding: 0;margin: 0 8px 0 9px;height: 11px;vertical-align: top;position: relative;top: 2px;border-left: 1px solid #d0d0d0;float: left;"></span>
                     <a target="_blank" href="https://map.kakao.com?map_type=TYPE_MAP&amp;from=roughmap&amp;srcid=160208921&amp;itemId=160208921&amp;q=%EA%B5%AC%ED%8A%B8%EC%95%84%EC%B9%B4%EB%8D%B0%EB%AF%B8&amp;urlX=477468.0&amp;urlY=1106278.0" style="float:left;height:15px;padding-top:1px;line-height:15px;color:#000;text-decoration: none;">지도 크게 보기</a>
                     </div>
                  </div>
               </div>
                </div>
            </div>
          </div>
		<hr class="divider-d">
        <footer class="footer bg-white" style="margin-bottom: 3%">
           
          <div class="container">
            <div class="row">
               
     
              <div class="col-sm-6">
               Shared by <i class="fa fa-love"></i><a href="https://bootstrapthemes.co">BootstrapThemes</a>
              </div>

            </div>
          </div>
        </footer>
</body>

</html>

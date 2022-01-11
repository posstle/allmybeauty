<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <!-- jstl / c:if... 등 사용 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> <!--  fmt:fomrmatDate.. 형식 사용 -->
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> <!-- 스프링 시큐리티  -->

<%@ include file="../include/myheader.jsp" %>

<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<c:set var="count" value="1"/>

<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
  </head>
  

	<style>
		ul {
			list-style-type: none;
			margin: 0;
			padding: 0;
		}
		li { display: inline; }
		
		input[type="date"]::-webkit-calendar-picker-indicator
		input[type="date"]::-webkit-inner-spin-button{
         color: rgba(0, 0, 0, 0);
         opacity: 1;
         display: block;
         background: url(https://mywildalberta.ca/images/GFX-MWA-Parks-Reservations.png) no-repeat;
         width: 20px;
         height: 20px;
         border-width: thin;
		}

		  .my-hr2 {
		    border: 0;
		    height: 2px;
		    background: #ccc;
		  }
		  
		  		.pagination > .active > a, 
		.pagination > .active > span, 
		.pagination > .active > a:hover, 
		.pagination > .active > span:hover, 
		.pagination > .active > a:focus, 
		.pagination > .active > span:focus {
		  background: #BDBDBD;
		  border-color: #000000;
		}or: white;
	</style>  
  

            
   
       <section class="module">
          <div class="container">
            <div class="row">
              <div class="col-sm-6 col-sm-offset-3" style=text-align:center; >
                <h3 class="font-alt"><strong>주문내역</strong></h3>
              </div>
            </div>
            
            <div class="container" style="text-align:center">
             <div class="row">
                 <div class="col-12">
                
                <form id="frm_Month">
			         		  
			         	<ul>		
			         	<li>
			         	    <h4 style="text-align: center;">주문내역조회</h4>
			         	 </li>         	
			         	  <li class="on">
			         	      <button  type="button"  class="btn btn-border-d btn-circle btn-frmDate1" value="-1">1개월</button>
			         	  </li>
			         	  
			         	  <li>
			         	      <button type="button" class="btn btn-border-d btn-circle btn-frmDate3" value="-3">3개월</button>
			         	  </li>
			         	  
			         	  <li>
			         	      <button type="button" class="btn btn-border-d btn-circle btn-frmDate6" value="-6">6개월</button>
			         	  </li>
			         	  <li>
			         	      <button type="button" class="btn btn-border-d btn-circle btn-frmDate12" value="-12">12개월</button>
			         	  </li>
			         	  <li>
			         	  
			                   <input type="date" id="currnetDate_start" name="start_date"/>
							   
							   <span class="des">&nbsp;&nbsp;~~&nbsp;&nbsp;</span>
							   
						       <input type="date"  id="currnetDate_end" name="end_date"/>
						        <button type="button" class="btn btn-success btn-round btn-frmSearch" style="background-color:#9BCE26; border :0; outline:0;">조회</button>
			         	  </li>
			         	</ul>						        
			           </form>
			         </div>
			     </div>   
			  </div>
          

           
          <form class="form-inline"  id="frmMyPageOrderValue" action="${contextPath }/mypage/mypageorder" method="get" name="frmMyPageOrderValue">                
         
                <input type='hidden' name='startDate' value="${mypagingCreator.myPagePagingDTO.startDate }"> 
                <input type='hidden' name='endDate' value="${mypagingCreator.myPagePagingDTO.endDate }"> 
                 <input type='hidden' name='mid' value="${mypagingCreator.myPagePagingDTO.mid }">
	             <input type='hidden' name='searchMonth' value="${mypagingCreator.myPagePagingDTO.searchMonth }">    
	             <input type='hidden' name='pageNum' value="${mypagingCreator.myPagePagingDTO.pageNum }">
	             <input type='hidden' name='rowAmountPerPage' value="${mypagingCreator.myPagePagingDTO.rowAmountPerPage }">
	             <input type='hidden' name='lastPageNum' value="${mypagingCreator.lastPageNum }">

           </form>
            
 <hr class="my-hr2">
             <div class="row">  
           <div class="col-sm-2" style="float:left;">
             <ul>
             		<li>
		                <h3><strong><a href="${contextPath }/mypage/mypagedetail?mid=<sec:authentication property="principal.username"/>">마이페이지</a></strong></h3>
		                <hr>
		            </li>
		             <li>
		                <h6><a href="${contextPath }/mypage/mypageorder?mid=<sec:authentication property="principal.username"/>">주문내역</a></h6>
		                 <hr>
		            </li>
		          
		          	<li>
		                <h6><a href="${contextPath }/cart/cartlist?mid=<sec:authentication property="principal.username"/>">장바구니</a></h6>
		            <hr>		            
		            </li> 
		          
		            <li>
		                <h6><a href="${contextPath }/mypage/mypagethumb?mid=<sec:authentication property="principal.username"/>">좋아요</a></h6>
		                 <hr>
		            </li>
		           		   		           
		            <li>
		                <h6><a href="${contextPath }/mypage/mypageqboard?mid=<sec:authentication property="principal.username"/>">상품Q&amp;A내역</a></h6>
		                <hr>	
		            </li>	
		                        
		             <li>
		                <h6><a href="${contextPath }/mypage/mypageboard?mid=<sec:authentication property="principal.username"/>">1:1문의내역</a></h6>
		                <hr>
		            </li>
		            		            		            
		            <li>
		                <h6><a href="${contextPath}/mypage/mypagememmodify?mid=<sec:authentication property="principal.username"/>">회원정보수정</a></h6>
		                <hr>
		            </li>
		            
		            <li>
		                <h6><a href="${contextPath }/mypage/mypagememdelete?mid=<sec:authentication property="principal.username"/>">회원탈퇴</a></h6>
		                <hr>
		            </li>
		            
           </ul>
            </div>
                     
   

              <div class="col-sm-10" style="text-align: center; float:right;">
                <table class="table  checkout-table" >
                  <thead>
                    <tr>
                    <!-- <th scope="col" style="text-align: center; color:#353535;"><strong>No</strong></th> -->
                      <th scope="col" style="text-align: center; color:#353535;"><strong>주문일자</strong></th>
                      <th scope="col" style="text-align: center;  color:#353535;"><strong>주문상품</strong></th>
                      <th scope="col" style="text-align: center;  color:#353535;"><strong>수량</strong></th>
                      <th scope="col" style="text-align: center;  color:#353535;"><strong>상품가격</strong></th>
                      <th scope="col" style="text-align: center;  color:#353535;"><strong>총금액</strong></th>
                      <!-- <th scope="col" style="text-align: center;">상태</th> -->
                    </tr>
                     <tbody>
                    
                    <c:choose>
                      <c:when test="${myPageOrderListSize > 0 }">
                    <c:forEach items="${myPageOrderList}" var="mypageorder">
                       <c:if test="${mypageorder.mid == mypageorder.mid}">                         
			               <tr style="border: 1px solid; black;"> 
 			                 <%-- <td style="width:6%; vertical-align : middle;">${mypageorder.orderno }</td> --%>
			                     <!-- 주문일자 -->		 
			                                    
			                      <td style="width:13%; vertical-align : middle;">
			                          <h5 class="product-title font-alt" style="text-align: center;">
			                               <fmt:formatDate pattern="yyyy-MM-dd" value="${mypageorder.orderdate}"/></h5>
			                      </td>
                     
			                      <!-- 주문상품이름 -->
			                      <td class="hidden-xs" style="width:40%;vertical-align : middle;">
                                 <input type="hidden" name="productImage" value="${mypageorder.repoPath }/${mypageorder.uploadPath }/${mypageorder.uuid }_${mypageorder.fileName }"/>
                                 <img src='' alt="No Image" style="height: 100px; width: 100px;">
                                 

			                     <a class="proDetail"  data-productid='<c:out value="${mypageorder.productid }"/>' style="font-size:15px; cursor:pointer;"> 
			                    ${mypageorder.productname } ${mypageorder.productbrand }<br></a>
			                      </td>
			                      
			                      <!-- 수량-->
			                      <td class="hidden-xs" style="width:8%;vertical-align : middle;">
			                        <h5 class="product-title font-alt">
			                              ${mypageorder.orderamount }
			                          </h5>
			                      </td>
			                      
			                      <!--  상품가격 -->
			                      <td style="width:15%;vertical-align : middle;">
			                        <h5 class="product-title font-alt" style="color:#8C8C8C;"> <%--  ${mypageorder.productprice}원 --%>
			                         <strong><fmt:formatNumber value="${mypageorder.productprice}" pattern="#,### 원"/></strong></h5>
			                      </td>
			                      
			                      
								<c:if test="${count !=mypageorder.orderno }">
										<!--  총 금액 -->
									  <td style="width:15%; vertical-align : middle; " rowspan="${mypageorder.productamount }">
			                          <h5 class="product-title font-alt" style="color:#CC3D3D">
			                          	<strong><fmt:formatNumber value="${mypageorder.OTOTALPRICE}" pattern="#,### 원"/></strong></h5>
			                      	  </td>
			                      	  <c:set var="count" value="${mypageorder.orderno}"/>
								</c:if>
			                 			                      
			                    </tr>
			                    </c:if>  
			                  

                    </c:forEach>                  
                  </c:when>
                  <c:otherwise>
               	          <tr>
                    		<td colspan="6" style="text-align: center;">
                    			<img src="${contextPath}/resources/images/mypage.png" alt="상품Q&A" style="width:300px; height:300px">
                    			<h3>주문목록이 없습니다.</h3>
                    		</td>
                    	</tr>
                  </c:otherwise>
                    
            </c:choose>

        </tbody>
      </table>
 
                
                
              </div>
            </div>
            
            
            <%-- Pagination 시작 --%>                   
                <div class='text-center' >
                    <ul class="pagination pagination-sm">
                    
                        <c:if test="${mypagingCreator.prev }">
                            <li class="paginate_button previous">
                                <a href="1">&laquo;</a>
                             </li>
                        .</c:if>
                        
                        <c:if test="${mypagingCreator.prev}">
                        	<li class="paginate_button previous">
                        	    <a href="${mypagingCreator.startPagingNum - 1 }">이전</a>
                        	 </li>
                        </c:if>
                        
                        <c:forEach var="pageNum" begin="${mypagingCreator.startPagingNum}" end="${mypagingCreator.endPagingNum}">
							<%-- 선택된 숫자의 경우, Bootstrap의 active 클래스 이름 추가 --%>
							<li class='paginate_button ${mypagingCreator.myPagePagingDTO.pageNum == pageNum ? "active":"" }'>
							 		<a href="${pageNum}">${pageNum}</a>
							</li>
							</c:forEach>

                           <c:if test="${mypagingCreator.next }">
                              <li class="paginate_button next">
                                  <a href="${mypagingCreator.endPagingNum + 1 }">다음</a>   
                              </li>
                           </c:if>
                           
                           <c:if test="${mypagingCreator.next }">
                           	    <li class="paginate_button next">
                           	       <a href="${mypagingCreator.lastPageNum}">&raquo;</a>
                           	     </li>
                           </c:if>                                                                        
                       </ul>
                         
                </div> 
                
               <%-- Pagination 끝 --%>
               
                <hr class="my-hr2">
         
          </div>

        </section>
        
  
  
 <script type="text/javascript">
 var loginUser = "";
 <sec:authorize access="isAuthenticated()">
    loginUser = '<sec:authentication property="principal.username"/>';
 </sec:authorize>
 
 
 var csrfHeaderName = "${_csrf.headerName}";
 var csrfTokenValue = "${_csrf.token}";
 
var frmMyPageOrderValue = $("#frmMyPageOrderValue");
var frm_purchaseperiod = $("#frm_purchaseperiod");
var frmMyPageOrderDate = $("#frmMyPageOrderDate");
 
 $("#but-mypage").on("click",function(){
	 location.href='${contextPath}/mypage/mypagedetail?mid=<c:out value="${mypagingCreator.myPagePagingDTO.mid }"/>';
 })

 
 var formproDetail = $("#formproDetail");


<%--상품상세페이지 이동 --%>
$(".proDetail").on("click",function(){
	
	var productid = $(this).data("productid");
	

		location.href = "${contextPath}/product/detail?productid=" + productid;


});

// 페이징
 $(".paginate_button a").on( "click", function(e) {

	 e.preventDefault();
	 frmMyPageOrderValue.find("input[name='pageNum']").val($(this).attr("href"));
	 
	// alert(frmMyPageOrderValue.find("input[name='pageNum']").val());
	 
	 frmMyPageOrderValue.attr("action", "${contextPath}/mypage/mypageorder");
	 
	 frmMyPageOrderValue.attr("method","get");
	 frmMyPageOrderValue.submit();
	
 });
 
 

//1개월 버튼
 $(".btn-frmDate1").on("click", function(e){	 	 
	    e.preventDefault();
	     var date1 = new Date(); 
	     
	     frmMyPageOrderValue.find("input[name='startDate']").val("");
	     frmMyPageOrderValue.find("input[name='endDate']").val("");
	     
	     var searchMonth = $("input[name='searchMonth']").val("-1");
		// alert("1개월");
		// alert(searchMonth);
		 frmMyPageOrderValue.attr("action" , "${contextPath}/mypage/mypageorder");
		 frmMyPageOrderValue.attr("method","get"); 
		 
		 frmMyPageOrderValue.find("input[name='pageNum']").val("1");
		 frmMyPageOrderValue.submit();
		 
		
 });
 //3개월 
 $(".btn-frmDate3").on("click", function(e){	 	 
	    e.preventDefault();
	     frmMyPageOrderValue.find("input[name='startDate']").val("");
	     frmMyPageOrderValue.find("input[name='endDate']").val("");
	     var searchMonth = $("input[name='searchMonth']").val("-3");
		// alert("3개월");
		// alert(searchMonth);
		 frmMyPageOrderValue.attr("action" , "${contextPath}/mypage/mypageorder");
		 frmMyPageOrderValue.attr("method","get"); 
		 frmMyPageOrderValue.find("input[name='pageNum']").val("1");
		 frmMyPageOrderValue.submit();
});
 //6개월
 $(".btn-frmDate6").on("click", function(e){	 	 
	    e.preventDefault();
	     frmMyPageOrderValue.find("input[name='startDate']").val("");
	     frmMyPageOrderValue.find("input[name='endDate']").val("");
	     var searchMonth = $("input[name='searchMonth']").val("-6");
		// alert("6개월");
		// alert(searchMonth);
		 frmMyPageOrderValue.attr("action" , "${contextPath}/mypage/mypageorder");
		 frmMyPageOrderValue.attr("method","get"); 
		 frmMyPageOrderValue.find("input[name='pageNum']").val("1");
		 frmMyPageOrderValue.submit();
});
 //12개월
 $(".btn-frmDate12").on("click", function(e){	 	 
	    e.preventDefault();
	     frmMyPageOrderValue.find("input[name='startDate']").val("");
	     frmMyPageOrderValue.find("input[name='endDate']").val("");
	     var searchMonth = $("input[name='searchMonth']").val("-12");
		 //alert("12개월");
		// alert(searchMonth);
		 frmMyPageOrderValue.attr("action" , "${contextPath}/mypage/mypageorder");
		 frmMyPageOrderValue.attr("method","get"); 
		 frmMyPageOrderValue.find("input[name='pageNum']").val("1");
		 frmMyPageOrderValue.submit();
});

 
 //기간 조회 버튼
 $(".btn-frmSearch").on("click",function(e){
	        e.preventDefault();
	        
	        var newDate = new Date();
			var st_date = $("#currnetDate_start").val();
			var end_date = $("#currnetDate_end").val();
			
			
			 $("input[name='startDate']").val(st_date);
			 $("input[name='endDate']").val(end_date);
			
			 $("input[name='searchMonth']").val(null);
			 
			 // 기간검색 시작일 / 종료일 값 가져오기 
			 var startDate =$("input[name='startDate']").val();
			 var endDate= $("input[name='endDate']").val();
			 
			 // '-' 구분자를 연,월,일로 잘라내어 배열로 반환 
			 var startArray = startDate.split('-');
			 var endArray = endDate.split('-');
			 
			 // 배열에 담겨있는 연,월,일을 사용해서 Date 객체 생성 
			 var start_date = new Date(startArray[0], startArray[1], startArray[2]);
			 var end_date = new Date(endArray[0], endArray[1], endArray[2]);
			 
			 
			// alert(start_date.getTime());
			 
			 //날짜를 숫자형태의 날짜 정보로 변환하여 비교 
			if(start_date.getTime() < end_date.getTime() || start_date.getTime() == end_date.getTime()){
				 frmMyPageOrderValue.attr("action" , "${contextPath}/mypage/mypageorder");
				 frmMyPageOrderValue.attr("method","get");
				 frmMyPageOrderValue.find("input[name='pageNum']").val("1");
				 frmMyPageOrderValue.submit();
			}else{
				alert("검색종료일이 검색시작일 이전입니다."); 
				return;
			}

 })
   
   
 // date 기본값 세팅
 window.onload = function() {
 	 today = new Date();
	 today1 = new Date();
	 
	 today = today.toISOString().slice(0,10);
	 	 
	 bir = document.getElementById("currnetDate_start");
	 bir.value = today;
	
	 
	 
	 today1 = today1.toISOString().slice(0,10);
	 
	 bir1 = document.getElementById("currnetDate_end");
	 bir1.value = today1; 
 }
 

 $(document).ready(function(){
		var thumbnailFilePath;
			
		$("input[name='productImage']").each(function(i) {
			thumbnailFilePath=encodeURIComponent($(this).val());
					
	    	//console.log(thumbnailFilePath);
	    	$("img").eq(i).attr("src", "${contextPath}/displayThumbnailFile?fileName=" + thumbnailFilePath);
		});
	});
 
 </script>
  
  
  
</html>
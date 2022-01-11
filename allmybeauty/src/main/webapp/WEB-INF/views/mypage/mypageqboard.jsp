<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <!-- jstl / c:if... 등 사용 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> <!--  fmt:fomrmatDate.. 형식 사용 -->
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> <!-- 스프링 시큐리티  -->

<%@ include file="../include/myheader.jsp" %>

<c:set var="contextPath" value="${pageContext.request.contextPath }"/>   

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
              <div class="col-sm-6 col-sm-offset-3"  style=text-align:center;>
                <h3 class="font-alt"><strong>상품Q&amp;A내역</strong></h3>
              </div>
            </div>
            

             <div class="container"style="text-align: center;">
             <div class="row">
                 <div class="col-12">
                
                 <form id="frm_Month">			         		  
			        <ul>	
			       
			         	<li>
			         	    <h5 class="font-alt" style="text-align: center;">상품Q&amp;A내역조회</h5>
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
          

           
          <form class="form-inline"  id="frmMyPageQboardValue" action="${contextPath }/mypage/mypageqboard" method="get" name="frmMyPageQboardValue">                
         
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
          

             <div class="col-sm-10" style="float:right;">
                <table class="table table-striped table-border checkout-table">
                <thead>
                  <tr>
                     <th scope="col" style="text-align: center; "><strong>No</strong></th>
                      <th scope="col" style="text-align: center;"><strong>상품</strong></th>
                      <th scope="col" style="text-align: center;"><strong>문의내용</strong></th>
                      <th scope="col" style="text-align: center;"><strong>관리</strong></th>
                      <th scope="col" style="text-align: center;"><strong>상태</strong></th>
                    </tr>
               </thead>    
   
               <tbody>                   
               <c:choose>
                  <c:when test="${myPageQboardListSize > 0  }">
                    <c:forEach items="${myPageQboardList}" var="mypageqboard">
                       <c:if test="${mypageqboard.mid eq myPagePagingDTO.mid}"> 
                         <tr>
          				  <td style="width:6%"><c:out value="${mypageqboard.qno }"/></td>
			          	                      	         		                      
			                       <!-- 문의상품이름-->
			                      <td class="hidden-xs" style="width:30%;">
			                        <input type="hidden" name="productImage" value="${mypageqboard.repoPath }/${mypageqboard.uploadPath }/${mypageqboard.uuid }_${mypageqboard.fileName }"/>
                                     <img src='' alt="No Image" style="height: 100px; width: 100px;"/>		
                                     
                                               
			                               <a class="proDetail" data-productid='<c:out value="${mypageqboard.productid }"/>' style="font-size:15px; cursor:pointer;">${mypageqboard.productbrand } ${ mypageqboard.productname}<br>
                                             </a>
			                      </td>
			                      
			                    <!-- 문의 내용 -->			     		                   
				                <td style="width:35;">   
				                    <div >
				                        <small>[문의날짜: <strong><fmt:formatDate pattern="yyyy-MM-dd" value="${mypageqboard.qdate}"/></strong>]</small>
				                        <h5>${mypageqboard.qcontent }</h5>
				                     		                     	      
			                       <!-- 관리자 댓글 -->
									<c:forEach items="${myPageQboardList}" var="mypageqboard2">	
										<c:if test="${mypageqboard.qno == mypageqboard2.qrno }">										
								        <a class="a_open" id="open" style="dispaly:block;" ><i class="fa fa-angle-down fa-2x"></i></a>
										<a class="a_close" id="close" style="display:none"  ><i class="fa fa-angle-up fa-2x"></i></a>  										
										<hr>															 										  										  										
										   <div  class= "admin_div" style="display:none"> 
    			                                   <strong>답변 : 관리자</strong>&nbsp;&nbsp;
    			                                   <small>[답변날짜: <strong><fmt:formatDate pattern="yyyy-MM-dd" value="${mypageqboard.qdate}"/></strong>]</small><br>
    			                                        <span>${mypageqboard2.qcontent }</span>
    			                             </div>
    			                           </c:if>
    			                     </c:forEach>
				           
			                     </div>	                           
				               </td>	                      	   	
                     				                  				                     				                    			                    		                 			                      	
			                      <!-- 관리(삭제) -->		         		                             
			                       <td style="width:13%; text-align: center;">
			                         <div> 
										<!-- <button type="button" class="btn_qamodify">수정</button> -->
										<button type="button" class="btn btn-default btn-circle btn-xs btn_qadelete" data-qboard="${mypageqboard.qno }">삭제</button>
							         </div>
			                       </td>
			                 
	
			                 <!--  답변상태-->		
			                   <td style="width:10%; text-align: center;">
			                         <c:if test="${mypageqboard.qanswerno == false }">
			                           <button class="btn btn-d btn-circle btn-xs" type="button" style="background-color:#888888; color:write;" disabled="disabled">답변대기</button>
			                         </c:if>  
			                         <c:if test="${mypageqboard.qanswerno == true }">
			                             <button class="btn btn-d btn-circle btn-xs" type="button" style="background-color:#9BCE26; color:write;" disabled="disabled">답변완료</button>
			                         </c:if>    
			                     </td> 	     
			                 						  					          	                               
			        </tr>
 		               
 		           </c:if> 

                    </c:forEach>    
                  </c:when>
                <c:otherwise>
               	         <tr>
                   		   <td colspan="6" style="text-align: center;">
                  		    	<img src="${contextPath}/resources/images/mypage.png" alt="상품Q&A" style="width:300px; height:300px">
                   			    <h3>상품Q&amp;A내역이 없습니다.</h3>
                   		  </td>
                   	   </tr>
                </c:otherwise>
        	 </c:choose>
           </tbody>
        </table>
   										
 				<!--  삭제 form -->
                <form class="qboard_delete_form" id="frmqboard" name="frmqboard">
                   <input type="hidden" name="qno" class="remove_qboard">
                   <input type="hidden" name="mid" value="<sec:authentication property="principal.username"/>">
                   <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>     
                </form>
                
                
              </div>
              <hr class="my-hr2">
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
 
var frmMyPageQboardValue = $("#frmMyPageQboardValue");
var frm_purchaseperiod = $("#frm_purchaseperiod");
var frmqboard = $("#frmqboard");
 
var qrnoValue = '<c:out value="${mypageqboard.qrno}"/>';
 
var formproDetail = $("#formproDetail");


<%--상품상세페이지 이동 --%>
$(".proDetail").on("click",function(){
	
	var productid = $(this).data("productid");
	
	//alert(productid);
	
    location.href = "${contextPath}/product/detail?productid=" + productid;

});
 
 
 // 답변열기
$(".a_open").on( "click", function(e) {
	 e.preventDefault();
    qno = $(this).val();
  //  console.log(qno);
  

           $(this).siblings(".admin_div").attr("style", "display: in-block");
          $(this).attr("style", "display:none");
          $(this).siblings(".a_close").attr("style", "display:in-block");

 });
 //답변 닫기
 $(".a_close").on( "click", function(e) {
	 e.preventDefault();
    qno = $(this).val();
   // console.log(qno);

       $(this).siblings(".admin_div").attr("style", "display: none");
       $(this).attr("style", "display:none");
       $(this).siblings(".a_open").attr("style", "display:in-block");
      
 });


  
 //삭제버튼
 $(".btn_qadelete").on( "click", function(e) {
	 e.preventDefault();
	 qno = $(this).data("qboard");
	 //console.log(qno);
	 $(".remove_qboard").val(qno);
	 
	 frmqboard.attr("action", "${contextPath}/mypage/mypageqboardremove");
	 frmqboard.attr("method" , "post");
	 frmqboard.submit();
 });
 

// 페이징
 $(".paginate_button a").on( "click", function(e) {

	 e.preventDefault();
	 frmMyPageQboardValue.find("input[name='pageNum']").val($(this).attr("href"));
	 
	// alert(frmMyPageOrderValue.find("input[name='pageNum']").val());
	 
	 frmMyPageQboardValue.attr("action", "${contextPath}/mypage/mypageqboard");
	 
	 frmMyPageQboardValue.attr("method","get");
	 frmMyPageQboardValue.submit();
	
 });
 
 

//1개월 버튼
 $(".btn-frmDate1").on("click", function(e){	 	 
	    e.preventDefault();
	     
	     frmMyPageQboardValue.find("input[name='startDate']").val("");
	     frmMyPageQboardValue.find("input[name='endDate']").val("");
	     
	     var searchMonth = $("input[name='searchMonth']").val("-1");
		 //alert("1개월");

		 frmMyPageQboardValue.attr("action" , "${contextPath}/mypage/mypageqboard");
		 frmMyPageQboardValue.attr("method","get"); 
		 
		 frmMyPageQboardValue.find("input[name='pageNum']").val("1");
		 frmMyPageQboardValue.submit();
		 
		
 });
 $(".btn-frmDate3").on("click", function(e){	 	 
	    e.preventDefault();
	    
	     frmMyPageQboardValue.find("input[name='startDate']").val("");
	     frmMyPageQboardValue.find("input[name='endDate']").val("");
	    
	     var searchMonth = $("input[name='searchMonth']").val("-3");
		// alert("3개월");

		 frmMyPageQboardValue.attr("action" , "${contextPath}/mypage/mypageqboard");
		 frmMyPageQboardValue.attr("method","get"); 
		 frmMyPageQboardValue.find("input[name='pageNum']").val("1");
		 frmMyPageQboardValue.submit();
});
 $(".btn-frmDate6").on("click", function(e){	 	 
	    e.preventDefault();
	    
	     frmMyPageQboardValue.find("input[name='startDate']").val("");
	     frmMyPageQboardValue.find("input[name='endDate']").val("");
	    
	     var searchMonth = $("input[name='searchMonth']").val("-6");
		// alert("6개월");

		 frmMyPageQboardValue.attr("action" , "${contextPath}/mypage/mypageqboard");
		 frmMyPageQboardValue.attr("method","get"); 
		 frmMyPageQboardValue.find("input[name='pageNum']").val("1");
		 frmMyPageQboardValue.submit();
});

 $(".btn-frmDate12").on("click", function(e){	 	 
	    e.preventDefault();
	    
	     frmMyPageQboardValue.find("input[name='startDate']").val("");
	     frmMyPageQboardValue.find("input[name='endDate']").val("");
	    
	     var searchMonth = $("input[name='searchMonth']").val("-12");
		// alert("12개월");

		 frmMyPageQboardValue.attr("action" , "${contextPath}/mypage/mypageqboard");
		 frmMyPageQboardValue.attr("method","get"); 
		 frmMyPageQboardValue.find("input[name='pageNum']").val("1");
		 frmMyPageQboardValue.submit();
});

 
 //기간 조회 버튼
 $(".btn-frmSearch").on("click",function(e){
	        
	 		e.preventDefault();
	        

	 	    var qdate = $("#test_div").attr("value");
	 	  // console.log(qdate);
			var st_date = $("#currnetDate_start").val();
			
			$("input[name='startDate']").val(st_date);
			
			var end_date = $("#currnetDate_end").val();
			 $("input[name='endDate']").val(end_date);
			 $("input[name='searchMonth']").val(null);
			
			 var startDate = $("input[name='startDate']").val();
			 var endDate = $("input[name='endDate']").val();
			 
			 var startArray = startDate.split('-');
			 var endArray = endDate.split('-');
			 
			 var start_date = new Date(startArray[0], startArray[1], startArray[2]);
			 var end_date = new Date(endArray[0], endArray[1], endArray[2]);
			
		    if(start_date.getTime() < end_date.getTime() || start_date.getTime() == end_date.getTime()){
				   frmMyPageQboardValue.attr("action" , "${contextPath}/mypage/mypageqboard");
				   frmMyPageQboardValue.attr("method","get");
				   frmMyPageQboardValue.find("input[name='pageNum']").val("1");
				   frmMyPageQboardValue.submit();
		    }else{
		    	alert("검색종료일이 검색시작일 이전입니다");
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
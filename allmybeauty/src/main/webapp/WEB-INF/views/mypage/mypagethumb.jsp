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



        .modal:before {
                display: inline-block;
                vertical-align: middle;
                content: " ";
                height: 100%;
        }       
        .model{
         position:absolute;
         widht:50%; 
         height:10%;
         background : rgba(0,0,0,0.8);
         display:none;
        }       
    .modal-header{
     width:100%;
     height:50px;
     background-color:#22D3D6;   
      justify-content:center;
      display:flex

      }    
	.modal-dialog {
	      
	        border-radius:10px;
	        bottom:0; 
	        box-shadow: 5px 10px 10px 1px rgba(0,0,0,.3);
	        border-radius:10px;      
	        overflow:hidden;   
	}
	.modal-body{
	  width:100%;
	  max-width:600px;          
	  vertical-align: middle;  
	  justify-content:center;
	  text-aling:center;
	   border-radius:10px;       
	  overflow:hidden;         
	  background-color:#ffffff; 
	  display:flex
	}
	
	.modal-footer{
     width:100%;
     height:65px;
      justify-content:center;
        vertical-align: middle;  
      display:flex  
	}

 	
	</style>  
  

            
   
       <section class="module">
          <div class="container">
            <div class="row">
              <div class="col-sm-6 col-sm-offset-3"  style=text-align:center; >
                <h3 class="font-alt"><strong>좋아요</strong></h3>
              </div>
            </div>
            
            <!-- 테스트용 -->
                    <!-- <button class="btn btn-default" data-target="#layerpop" data-toggle="modal">모달출력버튼</button><br/>  -->
                       
              <form class="form-inline"  id="frmMyPageThumbValue" action="${contextPath }/mypage/mypagethumb" method="get" name="frmMyPageThumbValue">                       
                 <input type='hidden' name='mid' value="${mypagingCreator.myPagePagingDTO.mid }">
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
                      <th scope="col" style="text-align: center;"><strong>상품</strong></th>
                      <th scope="col" style="text-align: center;"><strong>가격</strong></th>
                      <th scope="col" style="text-align: center;"><strong>관리</strong></th> 
                    </tr>
                  </thead>
                  
                  
                
                   <tbody>
                   
                  <c:choose><c:when test="${myPagethumbListSize > 0 }">
                    <c:forEach items="${myPagethumbList}" var="mypagethumb">     
                        <c:if test="${mypagethumb.mid eq myPagePagingDTO.mid }">     
  
			                    <tr>

			                     <!-- 상품-->
			                    
			                      <td  style="width:45%; text-align: left;vertical-align : middle; cursor:pointer;">
			                      
			                          <input type="hidden" name="productImage" value="${mypagethumb.repoPath }/${mypagethumb.uploadPath }/${mypagethumb.uuid }_${mypagethumb.fileName }"/>
                                      <img src=''  alt="No Image" style="height: 100px; width: 100px;"/>
                                     		<c:forEach items="${thumbList}" var="thumb">	
						                      <c:if test="${thumb.productId== mypagethumb.productid }">
						                      <input type="hidden" class="thumbflag" value="${thumb.thumbflag}"/>
	              
									              
									              <c:choose>
								            			<c:when test="${thumb.thumbflag==1 }">
								          					<button type="button" value="${thumb.productId}" class="thumbActive">
								                				<span><i style="color:red" class="fa fa-heart"></i></span>
								                  			</button>
								                  			<button type="button" value="${thumb.productId}" class="thumbNonActive" style="display:none">
								                  				<span><i style="color:red" class="fa fa-heart-o"></i></span>
								                  			</button>
								            			</c:when>
								              			<c:otherwise>
								              				<button type="button" value="${thumb.productId}" class="thumbNonActive">
									                  			<span><i style="color:red" class="fa fa-heart-o"></i></span>
									                  		</button>
									                  		<button type="button" value="${thumb.productId}" class="thumbActive" style="display:none">
									                  			<span><i style="color:red" class="fa fa-heart"></i></span>
									                  		</button>                 		
									          			</c:otherwise>
										          	  </c:choose>
										          	  
										          	  </c:if>  
								                      </c:forEach>	
                                     
                                     <a class="proDetail" data-productid='<c:out value="${mypagethumb.productid }"/>' style="font-size:15px;">${mypagethumb.productbrand } ${mypagethumb.productname }<br>
                                     </a>
						
		

			                      </td>
			                    
			                      <!-- 가격 -->
			                      <td style="width:15%;text-align: center;vertical-align : middle;">
			                       <h5 class="product-title font-alt" style="color:#8C8C8C;">
			                         <strong><fmt:formatNumber value="${mypagethumb.productprice }" pattern="#,### 원"/></strong></h5>		                         
			                      </td>

			                      <!-- 관리(삭제) -->
			                      <td style="width:5%; text-align: center; vertical-align : middle;">
			                          <button type="button" class="btn btn-default btn-circle btn-xs cart_btn" data-productid="${mypagethumb.productid }" style="color:#9BCE26;">장바구니</button><br><br>
			                      	  <button type="button" class="btn btn-default btn-circle btn-xs delete_btn" data-thumbid="${mypagethumb.thumbid }">삭제</button>
			                      </td> 
			                    </tr>
			               
			                    </c:if>  
 		                 </c:forEach>
 		               </c:when>  
 		               
 		               <c:otherwise>
               	          <tr>
                    		<td colspan="3" style="text-align: center;">
                    			<img src="${contextPath}/resources/images/mypage.png" alt="상품Q&A" style="width:300px; height:300px">
                    			<h3>좋아요 목록이 비었습니다.</h3>
                    		</td>
                    	</tr>
                       </c:otherwise>
                    </c:choose>                            
                  </tbody>
                </table>

                    
                    <!-- 삭제 form -->
                     <form  class="thumb_delete_form" id="myPagethumb">
                        <input type="hidden" name="thumbid" class="remove_thumbid">
                        <input type="hidden" name="mid" value="<sec:authentication property="principal.username"/>"> 
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>                          
                    </form>             
                    
                    <!-- 장바구니 담기 -->
                    <form class="thumb_cart_form" id="myPageThumbCart">
                       <input type="hidden" name="productid" class="cart_productid" value="">
                        <input type="hidden" name="mid" value="<sec:authentication property="principal.username"/>">       
 
                    </form>
              </div>
            </div>
         
         
         <%-- Model --%>
				<div class="modal fade" id="layerpop"  tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					  <div class="modal-dialog">
						    <div class="modal-content">
							      <!-- header -->
							      <div class="modal-header">							       							        
							        	<!-- header title -->
							        	<span class="modal-title" style="font-size:20px; color:#FFFFFF;" >선택완료</span>
							       </div>
							      <!-- body -->
							      <div class="modal-body">
							           <span style="text-align:center; font-size:15px;"><strong>장바구니에 추가 되었습니다.</strong></span>
							      </div>
							      <!-- Footer -->
							      <div class="modal-footer">
							        <button type="button" class="btn btn-warning btn-round thumblist_btn" data-dismiss="modal" style="text-align: center;">쇼핑계속하기</button>
							        <button type="button" class="btn btn-success btn-round cartlist_btn" data-dismiss="modal" style="text-align: center;">장바구니확인</button>
						      </div>
					    </div>
				  </div>
			</div>
<%-- model 끝 --%>            

            
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
                        	    <a href="${pagingCreator.startPagingNum - 1 }">이전</a>
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

 
 var myPagethumb = $("#myPagethumb");
 var myPageThumbCart = $("#myPageThumbCart");
 var frmMyPageThumbValue = $("#frmMyPageThumbValue");
 var mid='<c:out value="${myPagePagingDTO.mid}"/>';
 
//페이징
 $(".paginate_button a").on( "click", function(e) {

	 e.preventDefault();
	 frmMyPageThumbValue.find("input[name='pageNum']").val($(this).attr("href"));
	 
	 
	 frmMyPageThumbValue.attr("action", "${contextPath}/mypage/mypagethumb");
	 
	 frmMyPageThumbValue.attr("method","get");
	 frmMyPageThumbValue.submit();
	
 });
 
 
 
 // 삭제버튼
 $(".delete_btn").on("click", function(e){

	 e.preventDefault();
	 const thumbid = $(this).data("thumbid");
	// console.log(thumbid);
	 $(".remove_thumbid").val(thumbid);
	
	//alert(thumbid);
	
	myPagethumb.attr("action", "${contextPath}/mypage/mypagethumbremove");
	myPagethumb.attr("method", "post");
	myPagethumb.submit(); 
 });
 

 // 장바구니 담기
 $(".cart_btn").on("click", function(){
      
   	
   	myPageThumbCart.find("input[name='mid']").val(mid);
   	
	 const productid = $(this).data("productid");
	$(".cart_productid").val(productid);
	
   //	alert(mid);
   	//alert(productid);
   	
	 $.ajax({
		 url:'${contextPath}/cart/inserttocart',
		 data :{ productId : productid,
			        mid : mid,
			        cartAmount : 1},
	    type:'get',
	    dataType : 'json',
	    success:function(result , status){
	    	if(result == true){
	    		$('div.modal').modal();
	    	}else{
	    		alert("장바구니 담기 실패");
	    	}
	    }		   
	 }); 
 });

 
 // 모달창 장바구니확인 버튼
$(".cartlist_btn").on("click", function(){
	
	location.href="${contextPath}/cart/cartlist?mid=" + mid;
	
});

 
//좋아요 버튼 이벤트
//좋아요 버튼 이벤트
$(".thumbNonActive").on("click", function(e){
		if(mid!="null"){
			var productId=$(this).val();
		var btnThumbNonActive=$(this);
		var btnThumbActive = $(this).siblings(".thumbActive");
		
			$.ajax({
     			url:'${contextPath}/product/plusThumb',
   			data:{productId : productId,
   				  mid : mid},
   			type:'get',
   			dataType:'json',
   			success:function(result, status){
   				btnThumbNonActive.attr("style", "display:none");
   				btnThumbActive.attr("style", "display:in-block");
   			}
     	});
			
	} else {
			alert("로그인 후 이용바랍니다.");
		return false;
	}
});
	
//좋아요 감소 버튼
$(".thumbActive").on("click", function(e){
	if(mid==null || mid==""){
		alert("로그인 후 이용바랍니다.");
		return false;
	} else {
		var productId=$(this).val();
		var btnThumbActive=$(this);
		var btnThumbNonActive = $(this).siblings(".thumbNonActive");

			$.ajax({
     			url:'${contextPath}/product/minusThumb',
   			data:{productId : productId,
 				 	  mid : mid},
   			type:'get',
   			dataType:'json',
   			success:function(result, status){
   				btnThumbActive.attr("style", "display:none");
   				btnThumbNonActive.attr("style", "display:in-block");		
   			}
     	});
	}
});
 
var formproDetail = $("#formproDetail");


<%--상품상세페이지 이동 --%>
$(".proDetail").on("click",function(){
	
    var productid = $(this).data("productid");
    var thumbflag = $(this).siblings("button").attr("class");
    location.href = "${contextPath}/product/detail?productid=" + productid;
	
});
 
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
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

  <style type="text/css">
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
	  
      .thumbtable{
		display:flex;
		display: -webkit-box;
		display: -ms-flexbox;
		overflow-x: auto;
		overflow-y: hidden;
		}

	</style>  

<section class ="module">
          <div class="container" style="text-aling:center;">
            <div class="row" >
	           <div class="alert alert-info" role="alert" style="text-align: center;">
	            	<span style="font-size:29px;">
	            	
	            	<img  src="${contextPath}/resources/images/mypage/my_picture_base.png" style="width:50px; height:50px">
	                   <strong>${mypagemember.mname }님 반갑습니다</strong></span><br>
	                <span style="color:#747474; font-size:15px; vertical-align:middle;"><strong>적립금 :</strong></span>
	                <span style=" font-size:15px; vertical-align:middle;"> ${mypagemember.point }&nbsp;p</span>
	            </div>    
            </div>
             
    
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
          
       <!-- 좋아요 -->
    <div class="col-xs-10" style="text-align: center;">
          <div style="float:left;">
                 <span style="font-size:18px;"><strong>좋아요</strong></span>
          </div>
          <div style="float:right;">    
                  <span style="text-align:right;">
                      <a href="${contextPath }/mypage/mypagethumb?mid=<sec:authentication property="principal.username"/>">더보기></a>
                  </span>
          </div>   
                   
       <hr style="border: 0; height: 1px; background: #000000; width:100%;">   
         
                 <c:choose>
                     <c:when test="${MyPageThumbListSize > 0 }">
                       
                           <c:forEach items="${MyPageThumbList }" var="mypagethumb" varStatus = "status" end="3">                            
                             <c:if test="${mypagethumb.mid == mypagethumb.mid}"> 
                                    <ul> 
                                        <li style="float: left; width:225px; height:190px;">
			                      
			                             <input type="hidden" name="productImage" value="${mypagethumb.repoPath }/${mypagethumb.uploadPath }/${mypagethumb.uuid }_${mypagethumb.fileName }"/>
                                         <img class="images" src='' alt="No Image" style="height: 150px; width: 150px;"/><br>
                                         
                                          <a class="proDetail" style="cursor:pointer;" data-productid='<c:out value="${mypagethumb.productid }"/>' style="font-size:15px;"> ${mypagethumb.productbrand }<br>
                                           ${mypagethumb.productname }</a>

                                           <h5 class="product-title font-alt" style="color:#8C8C8C;">
	                                 <strong><fmt:formatNumber value="${mypagethumb.productprice }" pattern="#,### 원"/></strong></h5>
	                               </li>
	                            </ul>            
                               </c:if> 
                           </c:forEach>                                      
                     </c:when>                      
                     <c:otherwise>
                         <tr >
                            <td colspan="4" style="text-align: center;">
                  			<img  src="${contextPath}/resources/images/mypage.png" alt="좋아요" style="width:150px; height:150px"><br>
                  			<span style="font-size : 15px"><strong>좋아요 목록이 없습니다.</strong></span>                    			
                  		  </td> 
                          </tr>        
                     </c:otherwise>                     
                 </c:choose>
      </div> 
           
         <!-- 상품QnA내역  -->
          <div class="col-xs-5" style="text-align: center; float:left; width:50%   position: absolute;top: 55px; left: 10px;">
              <div style="float:left;">
                     <span style="font-size:18px;"><strong>상품Q&amp;A내역</strong></span>
                </div>
                <div style="float:right;">    
                      <span style="text-align:right;"><a href="${contextPath }/mypage/mypageqboard?mid=<sec:authentication property="principal.username"/>">더보기></a></span>
               </div>          
               <hr style="	border: 0; height: 1px; background: #000000; width:100%;">
              
               <table style=" width: 500px; height:50px;">

                     <tbody>
                    
                    <c:choose>
                      <c:when test="${MyPageQboardListSize > 0 }">
                    <c:forEach items="${MyPageQboardList}" var="mypageqboard" varStatus="status" end ="4">
                       <c:if test="${mypageqboard.mid == mypagemember.mid}"> 
			            <tr class="myPageqno" style="cursor:pointer;" data-qno='<c:out value="${mypageqboard.qno }"/>'>
			                 <!--  답변상태-->
			                <c:if test="${mypageqboard.qanswerno == false }">	
			                        <td style=" width:15%; text-align: center;">
			                           <div>
			                               <button class="btn btn-d btn-circle btn-xs" type="button" style="background-color:#888888; color:write;" disabled="disabled">답변대기</button>
			                           </div> 
			                       </td> 	     
                            </c:if>
                            <c:if test="${mypageqboard.qanswerno == true }">                               
			                        <td style="width:15%; text-align: center;">
			                        <div>
			                            <button class="btn btn-d btn-circle btn-xs" type="button" style="background-color:#9BCE26; color:write;" disabled="disabled">답변완료</button>
			                         </div>
			                        </td>		                          	    
			                </c:if>	
                          		                            
				             <!-- 문의 내용 -->			     		                   
				                <td style="width:25;">   
				                    <div >				          
				                        <h5>${mypageqboard.qcontent }</h5>
		                            </div>
			                     </td>	
			                     
			                  <!-- 문의날짜 -->   	
			                     <td style="width:30%; text-align: center;">
			                           <strong><fmt:formatDate pattern="yyyy-MM-dd" value="${mypageqboard.qdate}"/></strong>
			                     </td>                      			                      
			               </tr>
 		               </c:if>  
                    </c:forEach>                  
                  </c:when>
                  <c:otherwise>
               	          <tr>
                    		<td colspan="3" style="text-align: center; heigth:30px;">
                    			<img src="${contextPath}/resources/images/mypage.png" alt="상품Q&A" style="width:130px; height:130px"><br>                  			
                    			<span style="font-size:15px;"><strong>Q&amp;A내역이 없습니다.</strong></span>
                    		</td>
                    	</tr>
                  </c:otherwise>
                    
            </c:choose>
        </tbody>
      </table>
      
        <form class="formqboard" id="frmqboard" name="frmqboard">  
             <input type="hidden" name="mid" value="<sec:authentication property="principal.username"/>">
        </form>
      
   </div>  
   
    
          
       <!-- 1:1문의 내역  -->
       <div class="col-xs-5" style="text-align: center; float:left; width:50%   position: absolute; top: 55px; left: 10px;">
              <div style="float:left;">
                     <span style="font-size:18px;"><strong>1:1문의내역</strong></span>
                </div>
                <div style="float:right;">    
                      <span style="text-align:right;"><a href="${contextPath }/mypage/mypageboard?mid=<sec:authentication property="principal.username"/>">더보기></a></span>
               </div>          
              <hr style="	border: 0; height: 1px; background: #000000; width:100%;">
              
               <table  style=" width: 500px;height:120px;table-layout: fixed;">

                     <tbody>      
                    <c:choose>
                      <c:when test="${MyPageBoardListSize > 0 }">
                    <c:forEach items="${MyPageBoardList}" var="mypageboard" varStatus="status" end ="2">
                       <c:if test="${mypageboard.mid == mypageboard.mid}"> 
			              <tr class="myPagebno" style="cursor:pointer;" data-bno='<c:out value="${mypageboard.bno }"/>'>	                     		                
			                 <!--  답변상태-->								
								 <c:if test="${mypageboard.breplycnt == 0 }">
			                        <td style=" width:15%; color:black; text-align: center;">
			                           <div>
			                           <button class="btn btn-d btn-circle btn-xs" type="button" style="background-color:#888888; color:write;" disabled="disabled">답변대기</button>
			                           </div> 
			                       </td> 	     
                                </c:if>
                                <c:if test="${mypageboard.breplycnt > 0 }">                               
			                        <td style="width:15%; ">
			                        <div>
			                            <button class="btn btn-d btn-circle btn-xs" type="button" style="background-color:#9BCE26; color:write;" disabled="disabled">답변완료</button>
			                         </div>
			                        </td>		                          	    
			                    </c:if>			                    		 
			                <!-- 문의제목 -->			     			                   
				                <td style="width:25%;">   
				                    <div id="ClickTest" style="display:inline">			                       
				                       <span><strong>${mypageboard.btitle }</strong></span>
				                     </div>    			                       
				               </td>	
				           <!-- 작성날짜 -->		        
			                  <td style="width:30%; text-align: center;">
			                      <div>             			                       
                                        <strong><fmt:formatDate pattern="yyyy-MM-dd" value="${mypageboard.bregdate}"/></strong>			                         
			                      </div>
                              </td>   	                      			                      
			                 </tr>
 		                 </c:if>  
                    </c:forEach>                  
                  </c:when>
                  <c:otherwise>
               	          <tr>
                    		<td colspan="3" style="text-align: center; height:30px;">
                    			<img src="${contextPath}/resources/images/mypage.png" alt="상품Q&A" style="width:130px; height:130px;"><br>
                    			<span style="font-size:15px; "><strong>1:1문의 내역이 없습니다.</strong></span>
                    		</td>
                    	</tr>
                  </c:otherwise>
                    
            </c:choose>
        </tbody>
      </table>
             <form class="board_form" id="frmboard" name="frmboard">
                 <input type="hidden" name="bno" class="board_bno">  
                 <input type="hidden" name="divide" class="board_data">
                 <input type="hidden" name="mid" value="<sec:authentication property="principal.username"/>">
             </form>

      
          </div> 
       </div>     
         <hr class="my-hr2">      
     </div>
</section>
        

 <script type="text/javascript">
 
 <%-- 로그인 계정을 loginUser 변수에 저장,  --%>
 var loginUser = "";
 <sec:authorize access="isAuthenticated()">
    loginUser = '<sec:authentication property="principal.username"/>';
 </sec:authorize>
 
 var csrfHeaderName = "${_csrf.headerName}";
 var csrfTokenValue = "${_csrf.token}";

 $(document).ajaxSend(function(e, xhr, options){
     xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
 });


 var result = '<c:out value="${result}"/>';
 
 function checkModifyOperation(result){
    if(result === '' ||history.state){
       return;
    }else if(result === 'successModify'){
       var myMsg = "회원정보가 수정 되었습니다.";
    }
    
    alert(myMsg);
    myMsg='';
 }



var frmqboard = $("#frmqboard");
var frmboard = $("#frmboard");
var formproDetail = $("#formproDetail");

//qboard (게시글 하나 선택시 이동)
 $(".myPageqno").on( "click", function(e) {
	 e.preventDefault();
	 
	 qno = $(this).data("qno");
	 $(".qboard_qno").val(qno);
	
    //alert(qno);

	 frmqboard.attr("action", "${contextPath}/mypage/mypageqboard");
	 frmqboard.attr("method" , "get");
	 frmqboard.submit();
 });

//board (게시글 선택시 이동)
 $(".myPagebno").on( "click", function(e) {
		// 게시물 번호
		bno = $(this).data("bno");	
		$(".board_bno").val(bno);		
		//게시판 찾아가는 hidden 값 "C"		
		var divide = $(".board_data").val("C");
		
		//alert(bno);
		
		frmboard.attr("action", "${contextPath}/QnABoard/detail");   //게시판 url로 변경해야함
		frmboard.attr("method" , "get");
		frmboard.submit();
 });

<%--상품상세페이지 이동 --%>
$(".proDetail").on("click",function(){
	
	var productid = $(this).data("productid");
	
		location.href = "${contextPath}/product/detail?productid=" + productid;

});


 $(document).ready(function(){
		var thumbnailFilePath;
	
		$("input[name='productImage']").each(function(i) {
			thumbnailFilePath=encodeURIComponent($(this).val());					
	    	//console.log(thumbnailFilePath);	    	
	    	$(".images").eq(i).attr("src", "${contextPath}/displayThumbnailFile?fileName=" + thumbnailFilePath);	    	
		});
});
 
</script> 
  
  
</html>
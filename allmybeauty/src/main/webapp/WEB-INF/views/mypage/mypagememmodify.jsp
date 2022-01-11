<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <!-- jstl / c:if... 등 사용 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> <!--  fmt:fomrmatDate.. 형식 사용 -->
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> <!-- 스프링 시큐리티  -->

<%@ include file="../include/myheader.jsp" %>

<c:set var="contextPath" value="${pageContext.request.contextPath }"/>   



      <section class="module">
           
          <div class="container" style="text-align:center; margin:0 auto;" >
            <div class="row" style="display:inline-block;">
              <div style="text-align: center;" >
             <h3 class="font-alt" style="font-size:45px; color:#000000;"><strong>회원정보 수정</strong></h3>
             <h5 class="font-alt" >회원님의 소중한 정보를 안전하게 관리하세요</h5>
                <hr class="divider-w mb-10" style="border:1px solid #8C8C8C;">
                
               <h4 class="font-alt"><strong>회원정보를 수정하시려면 비밀번호를 입력하셔야 합니다.</strong></h4>
               <h5  class="font-alt">회원님의 개인정보 보호를 위한 본인 확인 절차이오니, <strong>AllMyBeauty</strong> 회원 로그인 시 사용하는 비밀번호를 입력해주세요.</h5> 
            <form class="form" id="frmMemberPw" style="display: inline-block;">
                      <div class="form-group">
                          <input style="text-align: center; border:1px solid #5D5D5D;" class="form-control" id="mpw" type="password" name="mpw" placeholder="비밀번호를 입력하세요" />
                      </div>
                      
                      <!--  비밀번호가 틀렸을 시 -->
                       <c:if test="${PwCheckResult == 0 }">
                             <div class="form-group" id="PwCheck" style="margin-top : 30px; text-align:center; color : red;">
                                     비밀번호가 틀렸습니다.
                             </div>
                      </c:if> 

                  <div class="form-group">
                    <button type="button" id="btnModifyPW" class="btn btn-success btn-circle btnModifyPw" >수정</button>
                    <button type="button" id="btnMyPageDetail" class="btn btn-default btn-circle">취소</button>
                 </div>
                 
                      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>   
                    </form>
                 </div>
              </div>      
          </div>
        </section>
        

 <script type="text/javascript">
 
 var loginUser = "";
 <sec:authorize access="isAuthenticated()">
    loginUser = '<sec:authentication property="principal.username"/>';
 </sec:authorize>
 
 var csrfHeaderName = "${_csrf.headerName}";
 var csrfTokenValue = "${_csrf.token}";

 var pw = '<c:out value="${mypagemember.mpw}"/>';
 var mid = '<sec:authentication property="principal.username"/>';
 
 // 취소버튼
 $("#btnMyPageDetail").on("click", function(){
    location.href="${contextPath}/mypage/mypagedetail?mid=" + mid;
 });
 
 

 
 var frmMemberPw = $("#frmMemberPw");
 
 // 수정버튼
$(".btnModifyPw").on("click",function(){   
	
	 var mpw=$("#mpw").val();
	   
	   if(mpw == ""){
	      alert("비밀번호를 입력해주세요");
	   }else{
	   
		   frmMemberPw.attr("action", "${contextPath}/mypage/mypagememmodify?mid=" + mid);
		   frmMemberPw.attr("method", "post");    
		   frmMemberPw.submit();
	   }
	   

});


// 엔터키 눌렀을 때 이동하는 key 이벤트 
$("#mpw").keydown(function(e){

	if(e.keyCode == 13){
		frmMemberPw.attr("action", "${contextPath}/mypage/mypagememmodify?mid=" + mid);
	    frmMemberPw.attr("method", "post");    
	    frmMemberPw.submit();
	}
})






 </script>
  
  
  
</html>
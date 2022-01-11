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
             <h3 class="font-alt" style="font-size:45px; color:#000000;"><strong>정상적으로 탈퇴 처리 되었습니다.</strong></h3>
             <h5 class="font-alt" > 그동안 AllMyBeauty를 이용해 주셔서 감사합니다.</h5>
                <hr class="divider-w mb-10" style="border:1px solid #8C8C8C;">
                
            <form class="form" id="frmMain" style="display: inline-block;">
            
                  <div class="form-group">
                    <button type="button" id="btnMain" class="btn btn-success btn-circle">확인</button>
                 </div>
                    </form>
                 </div>
              </div>      
          </div>
        </section>
        

 <script type="text/javascript">
 


 var frmMain = $("#frmMain");
 
 // 확인
$("#btnMain").on("click",function(){   
   
	frmMain.attr("action", "${contextPath}/main");
	frmMain.attr("method","get");
	frmMain.submit();
  
});


 </script>
  
  
  
</html>
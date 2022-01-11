<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <!-- jstl / c:if... 등 사용 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> <!--  fmt:fomrmatDate.. 형식 사용 -->
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> <!-- 스프링 시큐리티  -->

<%@ include file="../include/myheader.jsp" %>

<c:set var="contextPath" value="${pageContext.request.contextPath }"/>   
  
  
  
        
        <section class="module">
          <div class="container" style=text-align:center; >
             <h4 class="font-alt">회원관리수정</h4>
                <hr class="divider-w mb-10">
                
            <form class="form-horizontal" role="form" id="myPageModify" method="post">    
                     
                  <div class="form-group">
                    <label class="col-xs-4 control-label">아이디</label>
                  <div class="col-xs-4">
                    <input style="text-align: center;" class="form-control" id="mid" type="text" name="mid" placeholder="Id" 
                              value="${adminmember.mid }" readonly="readonly" />
                  </div>
                </div>
                
  <%--                 <div class="form-group">
                    <label class="col-xs-4 control-label">비밀번호</label>
                    <div class="col-xs-4">
	                    <input style="text-align: center;" class="form-control" id="mpw" type="password" name="mpw" placeholder="Password" 
	                             value="${mypagemember.mpw}" required readonly="readonly"/> 
	                 
                   </div>
                 </div> --%>
                           
                 
                  <c:if test="${adminmember.mgender == 'M' || adminmember.mgender == 'm' }">
                     <div class="form-group">
                      <label class="col-xs-4 control-label">성별</label>
                     <div class="col-xs-4"> 
                      <select class="form-control" id="mgender" name="mgender">
                        <option style="text-align: center;" value="M" selected> male (남성)
                        <option style="text-align: center;" value="F"> female (여성)
                     </select>
                     </div>
                   </div>
                  </c:if>
                  
                   <c:if test="${adminmember.mgender == 'F' || adminmember.mgender == 'f'}">
                     <div class="form-group">
                      <label class="col-xs-4 control-label">성별</label>
                    <div class="col-xs-4">   
                       <select class="form-control" id="mgender" name="mgender">
                        <option style="text-align: center;" value="M"> male (남성)
                        <option style="text-align: center;" value="F" selected> female (여성)
                     </select>
                     </div>
                     
                   </div>  
                  </c:if>

                          
                  <div class="form-group">
                    <label class="col-xs-4 control-label">이메일</label>
                 <div class="col-xs-4">    
                    <input style="text-align: center;" class="form-control" id="memail" type="text" name="memail" placeholder="Eemail" 
                              value="${adminmember.memail}"/>
                     <span class="final_memail_ck" style="color:blue; display:none;">필수 : 이메일을 입력해주세요.</span>
                  </div>
                </div>  
                  
                 <div class="form-group">
                  <label class="col-xs-4 control-label">이름</label>
                 <div class="col-xs-4">  
                    <input style="text-align: center;" class="form-control" id="mname" type="text" name="mname" placeholder="Username" 
                              value="${adminmember.mname}" />
                  </div>
                </div>  
                  
                  <div class="form-group">
                   <label class="col-xs-4 control-label">휴대폰</label>
                 <div class="col-xs-4">   
                    <input style="text-align: center;" class="form-control" id="mphone" type="text" name="mphone" placeholder="PhoneNumber" 
                             value="${adminmember.mphone}"/>
                       <span class="final_mphone_ck" style="color:blue; display:none;">필수 : 번호를 입력해주세요.</span>      
                  </div>
                </div>  
                  
                  
                  <div class="form-group">  
                   <label class="col-xs-4 control-label">주소</label>
                 <div class="col-xs-4">   
                   <input class="form-control" type="button" style="background-color:#949494; color:white;" onclick="execDaumPostcode()" value="주소 검색">
                         <!-- <button style="text-align: center;" type="button" class="address_button" id="postcode" onclick="execDaumPostcode()">우편번호찾기</button> -->
                         
                          <input style="text-align: center;  display:inline;" type="text"  id="postalcode" name="mpostalCode"  placeholder="우편번호" class="form-control"
                                    value="${adminmember.mpostalCode }" readonly="readonly"/>
             
                          <input style="text-align: center;" type="text" id="address" name="maddress" class="form-control" placeholder="주소"
                                   value="${adminmember.maddress}"   readonly="readonly"/>

                          <input style="text-align: center;" class="form-control" id="detailAddress" name="mdetailAddress" type="text" name="maddress" placeholder="상세주소" 
                                value="${adminmember.mdetailAddress}" />
            
                         <span class="final_mdaddr_ck" style="color:blue; display:none;">필수 : 상세주소를 입력해주세요.</span>
                 </div>
               </div>  
                 
                 
             <c:if test="${adminmember.mskinType == 'C' || adminmember.mskinType == 'c'}">
              <div class="form-group">
                   <label class="col-xs-4 control-label">피부타입</label>
                 <div class="col-xs-4">   
                    <select class="form-control" id="mskinType" name="mskinType">
                     <option style="text-align: center;" value="C" selected> Combination Skin (복합성)
                     <option style="text-align: center;" value="O"> Oily Skin (지성)
                     <option style="text-align: center;" value="D"> Dry Skin  (건성)
                  </select>
                  <span class="final_mskintype_ck" style="color:blue; display:none;">필수 : 피부타입을 선택해주세요.</span>
                  </div>
             </div>
             </c:if>
                    
             <c:if test="${adminmember.mskinType == 'O' || adminmember.mskinType == 'o'}">
              <div class="form-group">
                   <label class="col-xs-4 control-label">피부타입</label>
                 <div class="col-xs-4">   
                    <select class="form-control" id="mskinType" name="mskinType">
                     <option style="text-align: center;" value="C"> Combination Skin (복합성)
                     <option style="text-align: center;" value="O" selected> Oily Skin (지성)
                     <option style="text-align: center;" value="D"> Dry Skin  (건성)
                  </select>
                  <span class="final_mskintype_ck" style="color:blue; display:none;">필수 : 피부타입을 선택해주세요.</span>
                  </div>
             </div>
             </c:if>
             
           <c:if test="${adminmember.mskinType =='D' || adminmember.mskinType =='d' }">
              <div class="form-group">
                   <label class="col-xs-4 control-label">피부타입</label>
                 <div class="col-xs-4">   
                    <select class="form-control" id="mskinType" name="mskinType">
                     <option style="text-align: center;" value="C"> Combination Skin (복합성)
                     <option style="text-align: center;" value="O" > Oily Skin (지성)
                     <option style="text-align: center;" value="D" selected> Dry Skin  (건성)
                  </select>
                  <span class="final_mskintype_ck" style="color:blue; display:none;">필수 : 피부타입을 선택해주세요.</span>
                  </div>
             </div>
             </c:if>

                  <div class="form-group">
                    <label class="col-xs-4 control-label">가입일</label>
                  <div class="col-xs-4">   
                    <input style="text-align: center;" class="form-control" id="mregdate" type="text" name="mregdate" placeholder="Regdate" 
                               value= '<fmt:formatDate pattern="yyyy/MM/dd" value="${adminmember.mregDate}"/>' readonly="readonly"/>
                  </div>
               </div>         
               
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                   
            </form>
                   
                  <div class="form-group">
                    <button type="button" id="btnModify" class="btn btn-d btn-circle" data-oper="mypagemodify">수정</button>
                    <button type="button" id="btnReturn" class="btn btn-d btn-circle">취소</button>
                    
                  </div>

          </div>
        </section>
        
        <form class="frmModify" id="frmModify" name="frmModify">
             <input type="hidden" name="mid" class="Modify_mid" value="${adminpagingCreator.adminMemberPagingDTO.mid}">
              <input type="hidden" name="pageNum" value="${adminpagingCreator.adminMemberPagingDTO.pageNum }">
              <input type="hidden" name="rowAmountPerPage" value="${adminpagingCreator.adminMemberPagingDTO.rowAmountPerPage }">
              <input type='hidden' name='scope' value='${adminMemberPagingDTO.scope}'>
              <input type='hidden' name='keyword' value='${adminMemberPagingDTO.keyword}'>    
              
                 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
      



<!--  주소 가져오기 API Daum -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    
                    if(addr !== ''){
                       //주소변수 문자열과 참고항목 문자열 합치기 
                        addr += extraAddr;
                    }
                    
                    
                    // 조합된 참고항목을 해당 필드에 넣는다.
                   // document.getElementById("address").value = extraAddr;
                
                }/*  else {
                    addr += ' '
                }
                 */
                console.log(data.zonecode);
                console.log(addr);
                
                $("[name=mpostalcode]").val(data.zonecode);
                $("[name=maddress]").val(addr);
              
            }
        }).open();
    }
</script>

  
<script type="text/javascript">
 
 
var csrfHeaderName = "${_csrf.headerName}";
var csrfTokenValue = "${_csrf.token}";
 
 var myPageModify = $("#myPageModify");
// 회원 수정 유효성 검사 

var memailCheck = false;  //이메일 
var mphoneCheck = false;    // 휴대폰번호
var mdetailaddCheck = false;  //상세주소
var mskintypeCheck = false;   //스킨타입


// 수정버튼 
$("#btnModify").on("click",function(){
      
      var memail = $("#memail").val();  //이메일
      var mphone = $("#mphone").val();   //번호
      var mdetailaddress = $("#detailAddress").val();  //상세주소
      var mskintype = $("#mskinType option:selected").val();   //스킨타입
      


      //이메일 유효성검사 (이메일 인증번호 확인 유효성 검사는 blur.function에)

         if(memail == ""){
            $(".final_memail_ck").css("display", "inline-block");
            memailCheck = false;
         }else{
            $(".final_memail_ck").css("display", "none");
            memailCheck = true;
         }

     
      //번호 유효성검사 
      if(mphone == ""){
         $(".final_mphone_ck").css("display", "inline-block");
         mphoneCheck = false;
      }else{
         $(".final_mphone_ck").css("display", "none");
         mphoneCheck = true;
      }
     
      //상세주소 유효성 검사
      if(mdetailaddress == ""){
         $(".final_mdaddr_ck").css("display", "inline-block");
         mdetailaddCheck = false;
      }else{
         $(".final_mdaddr_ck").css("display", "none");
         mdetailaddCheck = true;
      }
      
      //스킨타입 유효성검사
      if(mskintype == ""){
         $(".final_mskintype_ck").css("display", "inline-block");
         mskintypeCheck = false;
      }else{
         $(".final_mskintype_ck").css("display", "none");
         mskintypeCheck = true;   
      }
     
      console.log("최종 유효성 검사를 위한 테스트 모두 true여야함")
      console.log("memailCheck : " + memailCheck);
      console.log("mphoneCheck : " + mphoneCheck);
      console.log("mdetailaddCheck : " + mdetailaddCheck);
      console.log("mskintypeCheck : " + mskintypeCheck);
      
      
      if(memail&&mphone&&mdetailaddress&&mskintype){
         
         if(!confirm("수정하시겠습니까?")){ 
               return;
          }         

         myPageModify.attr("action" , "${contextPath}/admin/adminmodify");
         myPageModify.attr("method", "post");

         myPageModify.submit();
      }
      
      return false;

});
   


var frmModify = $("#frmModify");
 //취소
$("#btnReturn").on("click", function(){
	

	myPageModify.attr("action" , "${contextPath}/admin/adminmemberlist");
	myPageModify.attr("method","post");

	myPageModify.submit();
})

</script>

</html>
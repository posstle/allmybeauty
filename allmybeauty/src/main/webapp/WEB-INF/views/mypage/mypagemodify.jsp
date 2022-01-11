<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <!-- jstl / c:if... 등 사용 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> <!--  fmt:fomrmatDate.. 형식 사용 -->
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> <!-- 스프링 시큐리티  -->

<%@ include file="../include/myheader.jsp" %>

<c:set var="contextPath" value="${pageContext.request.contextPath }"/>   
  
  
  <style>
  

  
  </style>
  
        
        <section class="module">
          <div class="container" style=text-align:center; >
             <h4 class="font-alt">회원정보수정</h4>
                <hr class="divider-w mb-10">
                
            <form class="form-horizontal" role="form" id="myPageModify" method="post">             
                  <div class="form-group">
                    <label class="col-xs-4 control-label">아이디</label>
                  <div class="col-xs-4">
                    <input style="text-align: center;" class="form-control" id="mid" type="text" name="mid" placeholder="Id" 
                              value="${mypagemember.mid }" readonly="readonly"/>
                  </div>
                </div>
                
                  <div class="form-group">
                    <label class="col-xs-4 control-label">비밀번호</label>
                    <div class="col-xs-4">
	                    <input style="text-align: center;" class="form-control" id="mpw" type="password" name="mpw" placeholder="Password" 
	                             <%--  value="${mypagemember.mpw}" --%> required/> 
	                    <span class="final_mpw_ck" style="color:blue; display:none;">필수 : 비밀번호를 입력해주세요.</span>
                   </div>
                 </div>
                           
                 <div class="form-group"> 
                     <label class="col-xs-4 control-label">비밀번호재확인</label>
                    <div class="col-xs-4">
                        <input style="text-align: center;" class="form-control" id="mpw2" type="password" name="mpw2" placeholder="Password"  
                              <%-- value="${mypagemember.mpw}" --%> required/> 
                                   <span class="final_mpwck_ck" style="color:blue; display:none;">필수 : 비밀번호 확인을 입력해주세요.</span>
                                    <div class="mpwck_input_use" style="color:green; " id="alert-success">비밀번호가 일치합니다.</div>
                                    <div class="mpwck_input_notuse" style="color:red; " id="alert-danger">비밀번호가 일치하지 않습니다..</div>
                  </div>
                </div>
                 
                  <c:if test="${mypagemember.mgender == 'M'  || mypagemember.mgender == 'm' }">
                     <div class="form-group">
                      <label class="col-xs-4 control-label">성별</label>
                     <div class="col-xs-4"> 
                       <input style="text-align: center;" class="form-control" id="mgender" type="text" name="mgender" placeholder="Gender" 
                                 value="남성" readonly="readonly"/>                                  
                     </div>
                   </div>
                  </c:if>
                  
                   <c:if test="${mypagemember.mgender == 'F' || mypagemember.mgender == 'f' } ">
                     <div class="form-group">
                      <label class="col-xs-4 control-label">성별</label>
                    <div class="col-xs-4">   
                       <input style="text-align: center;" class="form-control" id="mgender" type="text" name="mgender" placeholder="Gender" 
                                 value="여성" readonly="readonly"/>
                     </div>
                   </div>  
                  </c:if>

                          
                  <div class="form-group">
                    <label class="col-xs-4 control-label">이메일</label>
                 <div class="col-xs-4">    
                    <input style="text-align: center;" class="form-control" id="memail" type="text" name="memail" placeholder="Eemail" 
                              value="${mypagemember.memail}"/>
                     <span class="final_memail_ck" style="color:blue; display:none;">필수 : 이메일을 입력해주세요.</span>
                  </div>
                </div>  
                  
                 <div class="form-group">
                  <label class="col-xs-4 control-label">이름</label>
                 <div class="col-xs-4">  
                    <input style="text-align: center;" class="form-control" id="mname" type="text" name="mname" placeholder="Username" 
                              value="${mypagemember.mname}" readonly="readonly"/>
                  </div>
                </div>  
                  
                  <div class="form-group">
                   <label class="col-xs-4 control-label">휴대폰</label>
                 <div class="col-xs-4">   
                    <input style="text-align: center;" class="form-control" id="mphone" type="text" name="mphone" placeholder="PhoneNumber" 
                             value="${mypagemember.mphone}"/>
                       <span class="final_mphone_ck" style="color:blue; display:none;">필수 : 번호를 입력해주세요.</span>      
                  </div>
                </div>  
                  
                  
                  <div class="form-group">  
                   <label class="col-xs-4 control-label">주소</label>
                 <div class="col-xs-4">   
                   <input class="form-control" type="button" style="background-color:#949494; color:white;" onclick="execDaumPostcode()" value="주소 검색">
                         <!-- <button style="text-align: center;" type="button" class="address_button" id="postcode" onclick="execDaumPostcode()">우편번호찾기</button> -->
                         
                          <input style="text-align: center;  display:inline;" type="text"  id="postalcode" name="mpostalCode"  placeholder="우편번호" class="form-control"
                                    value="${mypagemember.mpostalCode }" readonly="readonly"/>
             
                          <input style="text-align: center;" type="text" id="address" name="maddress" class="form-control" placeholder="주소"
                                    value="${mypagemember.maddress }" readonly="readonly"/>

                          <input style="text-align: center;" class="form-control" id="detailAddress" name="mdetailAddress" type="text" name="maddress" placeholder="상세주소" 
                                value="${mypagemember.mdetailAddress}" />
            
                         <span class="final_mdaddr_ck" style="color:blue; display:none;">필수 : 상세주소를 입력해주세요.</span>
                 </div>
               </div>  
                 
                 
         <c:if test="${mypagemember.mskinType == 'C' || mypagemember.mskinType == 'c' }">
              <div class="form-group">
                   <label class="col-xs-4 control-label">피부타입</label>
                 <div class="col-xs-4">   
                    <select class="form-control" id="mskinType" name="mskinType">
                       <option style="text-align: center;"  disabled value="">SKIN TYPE (CHOICE)</option>
                     <option style="text-align: center;" value="C" selected> Combination Skin (복합성)
                     <option style="text-align: center;" value="O"> Oily Skin (지성)
                     <option style="text-align: center;" value="D"> Dry Skin  (건성)
                  </select>
                  <span class="final_mskintype_ck" style="color:blue; display:none;">필수 : 피부타입을 선택해주세요.</span>
                  </div>
             </div>
             </c:if>
                    
             <c:if test="${mypagemember.mskinType == 'O'  || mypagemember.mskinType == 'o'}">
              <div class="form-group">
                   <label class="col-xs-4 control-label">피부타입</label>
                 <div class="col-xs-4">   
                    <select class="form-control" id="mskinType" name="mskinType">
                       <option style="text-align: center;"  disabled value="">SKIN TYPE (CHOICE)</option>
                     <option style="text-align: center;" value="C"> Combination Skin (복합성)
                     <option style="text-align: center;" value="O" selected> Oily Skin (지성)
                     <option style="text-align: center;" value="D"> Dry Skin  (건성)
                  </select>
                  <span class="final_mskintype_ck" style="color:blue; display:none;">필수 : 피부타입을 선택해주세요.</span>
                  </div>
             </div>
             </c:if>
             
           <c:if test="${mypagemember.mskinType == 'D' || mypagemember.mskinType == 'd'}">
              <div class="form-group">
                   <label class="col-xs-4 control-label">피부타입</label>
                 <div class="col-xs-4">   
                    <select class="form-control" id="mskinType" name="mskinType">
                       <option style="text-align: center;"  disabled value="">SKIN TYPE (CHOICE)</option>
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
                    <input style="text-align: center;" class="form-control" id="mregDate" type="text" name="mregDate" placeholder="Regdate" 
                               value= '<fmt:formatDate pattern="yyyy/MM/dd" value="${mypagemember.mregDate}"/>' disabled="disabled"/>
                  </div>
               </div>      
                
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>                     
            </form>
                   
                  <div class="form-group">
                    <button type="button" id="btnModify" class="btn btn-d btn-circle" data-oper="mypagemodify">수정</button>
               <button type="button" id="btnDelete" class="btn btn-d btn-circle" data-mid='<c:out value="${mypagemember.mid }"/>'>탈퇴</button>
                    <button type="button" id="btnReturn" class="btn btn-d btn-circle" data-mid='<c:out value="${mypagemember.mid }"/>'>취소</button>
                  </div>
          </div>
        </section>
        
        <%-- 취소버튼 --%>
        <form class="frmModify" id="frmModify" name="frmModify">
             <input type="hidden" name="mid" class="Modify_mid" value= '<sec:authentication property="principal.username"/>'>
        </form>
        
         <%-- 탈퇴버튼 --%>
        <form class="frmdelete" id="frmdelete" name="frmdelete">
             <input type="hidden" name="mid" class="delete_mid" value= '<sec:authentication property="principal.username"/>'>
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
                //console.log(data.zonecode);
                //console.log(addr);
                
                $("[name=mpostalCode]").val(data.zonecode);
                $("[name=maddress]").val(addr);
              
            }
        }).open();
    }
</script>

  
<script type="text/javascript">

var csrfHeaderName = "${_csrf.headerName}";
var csrfTokenValue = "${_csrf.token}";

$(document).ajaxSend(function(e, xhr, options){
    xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
});

$(function(){ 
   $("#alert-success").hide();
   $("#alert-danger").hide();
   $("input").keyup(function(){
      var mpw=$("#mpw").val();
      var mpw2=$("#mpw2").val();
      if(mpw != "" || mpw2 != ""){
         if(mpw == mpw2){ 
            $("#alert-success").show();
            $("#alert-danger").hide(); 
            $("#submit").removeAttr("disabled"); 
         }else{
            $("#alert-success").hide();
            $("#alert-danger").show(); 
            $("#submit").attr("disabled", "disabled");
         }
      }
   });
});

 
 var myPageModify = $("#myPageModify");
// 회원 수정 유효성 검사 
var mpwCheck = false;         //비번 
var mpwckCheck = false;       //비번 확인 
var mpwckCorCheck = false;    //비번 일치 확인
var memailCheck = false;  //이메일 
var mphoneCheck = false;    // 휴대폰번호
var mdetailaddCheck = false;  //상세주소
var mskintypeCheck = false;   //스킨타입



//비밀번호 확인 일치 유효성 검사 (입력을 할 때마다 실행이 되는 메서드) : 가입버튼 누르지않아도 일치여부 알아야하기 때문에
$("#mpw").on("propertychange change keyup paste input", function(e){

   var mpw = $("#mpw").val(); //비밀번호 값
   var mpwck = $("#mpwck").val(); //비밀번호 확인값 

   if(mpw != ""){ //비밀번호가 입력된 상태
      if(mpw == mpwck){
         $(".mpwck_input_use").css("display", "inline-block");
         $(".mpwck_input_notuse").css("display", "none");
         $(".final_mpw_ck").css("display", "none");
         $(".final_mpwck_ck").css("display", "none");
         mpwckCorCheck = true;
      }else{
         $(".mpwck_input_use").css("display", "none");
         $(".mpwck_input_notuse").css("display", "inline-block");
         $(".final_mpw_ck").css("display", "none");
         $(".final_mpwck_ck").css("display", "none");
         mpwckCorCheck = false;
      }
   }else{ //비밀번호 입력안된상태
      $(".mpwck_input_use").css("display", "none");
      $(".mpwck_input_notuse").css("display", "none");
      $(".final_mpw_ck").css("display", "inline-block");
      mpwckCorCheck = false;
   }

});


// 수정버튼 
$("#btnModify").on("click",function(){
         
      var mpw=$("#mpw").val();    //비밀번호
      var mpw2=$("#mpw2").val();   //비밀번호 재확인
      var memail = $("#memail").val();  //이메일
      var mphone = $("#mphone").val();   //번호
      var mdetailAddress = $("#detailAddress").val();  //상세주소
      var mskintype = $("#mskinType option:selected").val();   //스킨타입
      
      
/*    
      
      //비밀번호 확인 일치 유효성 검사 (입력을 할 때마다 실행이 되는 메서드) : 가입 버튼 누른 후 작동
      $("#mpwck").on("propertychange change keyup paste input", function(e){
      
         var mpw = $("#mpw").val(); //비밀번호 값
         var mpwck = $("#mpwck").val(); //비밀번호 확인값 
         //비밀번호 확인입력해주세요 경고를 없애기
         $(".final_mpwck_ck").css("display", "none");
      
      if(mpw == mpwck){
         $(".mpwck_input_use").css("display", "inline-block");
         $(".mpwck_input_notuse").css("display", "none");
         mpwckCorCheck = true;
      }else{
         $(".mpwck_input_use").css("display", "none");
         $(".mpwck_input_notuse").css("display", "inline-block");
         mpwckCorCheck = false;
      }
      
      }); */
      
      //비밀번호 유효성 검사
      if(mpw == ""){
         $(".final_mpw_ck").css("display", "inline-block");
         mpwCheck = false;
      }else{
         $(".final_mpw_ck").css("display", "none");
         mpwCheck = true;
      }
      
      //비밀번호 확인 유효성 검사
      if(mpw == ""){
         $(".final_mpwck_ck").css("display", "inline-block");
         mpwckCheck = false;
      }else{
         $(".final_mpwck_ck").css("display", "none");
         mpwckCheck = true;   
      }

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
      if(mdetailAddress == ""){
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
     
/*       console.log("최종 유효성 검사를 위한 테스트 모두 true여야함")
      console.log("mpwCheck : " + mpwCheck);
      console.log("mpwckCheck : " + mpwckCheck);
      console.log("mpwckCorCheck : " + mpwckCorCheck);
      console.log("memailCheck : " + memailCheck);
      console.log("mphoneCheck : " + mphoneCheck);
      console.log("mdetailaddCheck : " + mdetailaddCheck);
      console.log("mskintypeCheck : " + mskintypeCheck); */
      
      
      if(memail&&mphone&&mpwckCheck
            &&mdetailAddress&&mskintype){
         
         alert("수정되었습니다.");    
         myPageModify.attr("action" , "${contextPath}/mypage/mypagemodify");
         myPageModify.attr("method", "post");
         myPageModify.submit();
      }
      
      return false;

});
   
var frmdelete = $("#frmdelete");
//탈퇴
$("#btnDelete").on("click", function(){
	
	
	mid = $(this).data("mid");
	$(".delete_mid").val(mid);
	
	//alert(mid);
	
	frmdelete.attr("action" , "${contextPath}/mypage/mypagememdelete");
	frmdelete.attr("method","get");      
	frmdelete.submit(); 
});


   var frmModify = $("#frmModify");
   //취소
  $("#btnReturn").on("click", function(){
  	
  	mid = $(this).data("mid");
  	$(".Modify_mid").val(mid);
  	
  //	alert(mid);

  	frmModify.attr("action" , "${contextPath}/mypage/mypagedetail");
  	frmModify.attr("method","get");
  	frmModify.submit();
  })

</script>
</html>
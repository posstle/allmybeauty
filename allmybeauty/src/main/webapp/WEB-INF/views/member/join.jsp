<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/myheader.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
  </head>
  <body data-spy="scroll" data-target=".onpage-navigation" data-offset="60">
    <main>
      <div class="page-loader">
        <div class="loader">Loading...</div>
      </div>
        <div class="container">
      </div>
      <div class="main">
        
        <section class="module">
          <div class="container" style=text-align:center; >
          	<span class="font-alt" style="font-size:25px;"><strong>회원가입</strong></span><br>
                <hr class="divider-w mb-10">
                
                <%-- input의 name값은 memberVO에서 정의한 변수 이름의 값을 삽입 --%>
            <form class="form-horizontal" id="join_form">
            
                  <div class="form-group" >
                  	<label class="col-xs-4 control-label">아이디</label>
                    <div class="col-xs-4">
	                    <input style="text-align: center;" class="form-control" id="mid" type="text" name="mid" placeholder="ID" required/>
	                    <span class="id_input_use" style="color:green; display:none">사용 가능한 아이디입니다.</span>
	                    <span class="id_input_exist" style="color:red; display:none" >아이디가 이미 존재합니다.</span>
	                    	<span class="final_mid_ck" style="color:blue; display:none;">필수 : 아이디를 입력해주세요.</span>
                  	</div>
                  </div>
                  
                  <div class="form-group">
                  	<label class="col-xs-4 control-label">비밀번호</label>
                    <div class="col-xs-4">
	                    <input style="text-align: center;" class="form-control" id="mpw" type="password" name="mpw" placeholder="PASSWORD" required/>
	                    	<span class="final_mpw_ck" style="color:blue; display:none;">필수 : 비밀번호를 입력해주세요.</span>
	                    <input style="text-align: center;" class="form-control" id="mpwck" type="password" name="mpwck" placeholder="PASSWORD-CHECK" required/>
	                  		<span class="final_mpwck_ck" style="color:blue; display:none;">필수 : 비밀번호 확인을 입력해주세요.</span>
	                  		<span class="mpwck_input_use" style="color:green; display:none" >비밀번호가 일치합니다.</span>
	                		<span class="mpwck_input_notuse" style="color:red; display:none">비밀번호가 일치하지 않습니다.</span>
                  	</div>
                  </div>
                  
                  <div class="form-group">
                  	<label class="col-xs-4 control-label">이름</label>
                    <div class="col-xs-4">
                    	<input style="text-align: center;" class="form-control" id="mname" type="text" name="mname" placeholder="NAME" required/>
                  			<span class="final_mname_ck" style="color:blue; display:none;">필수 : 이름을 입력해주세요.</span>
                  	</div>
                  </div>
                 
                  <div class="form-group">
                  		<label class="col-xs-4 control-label">성별</label>
                     	<div class="col-xs-4">
					        <select class="form-control" id="mgender" name="mgender">
					        	<option style="text-align: center;" selected disabled value="">GENDER (CHOICE)</option>
								<option style="text-align: center;" value="M"> male (남성)
								<option style="text-align: center;" value="F"> female (여성)
							</select>
							<span class="final_mgender_ck" style="color:blue; display:none;">필수 : 성별을 선택해주세요.</span>
                  		</div>
                  </div>
                  
                  <div class="form-group">
                  	<label class="col-xs-4 control-label">이메일</label>
                  	<div class="col-xs-4"> 
	                    <input style="text-align: center;" class="form-control" id="memail" type="email" name="memail"  placeholder="E-MAIL" required/>
	                 	   <span class="final_memail_ck" style="color:blue; display:none;">필수 : 이메일을 입력해주세요.</span>
	                 	   <span class="email_input_warn" style="color:red;"></span>
	                    <div class="mail_check_input_box" id="mail_check_input_box_false" style="background-color:#ebebe4;">
	                    	<input class="form-control" id="mail_check_input" style="text-align: center;" placeholder="인증번호 입력" disabled="disabled"/>
	                    </div>
	                   	<input class="form-control" style="background-color:#949494; color:white;" id="mail_checkBtn" type="button" value="메일 인증번호 전송"> 
	                    <div id="clearfix">
	                    	<span id="mail_check_input_box_warn"></span>
	                    </div>
                  	</div>
                  </div>
                  
                  <div class="form-group">
                  	<label class="col-xs-4 control-label">번호</label>
                  	<div class="col-xs-4"> 
                    	<input style="text-align: center;" class="form-control" id="mphone" type="text" name="mphone" placeholder="PHONE-NUMBER" required/>
                    		<span class="final_mphone_ck" style="color:blue; display:none;">필수 : 번호를 입력해주세요.</span>
                  	</div>
                  </div>
                
                 <div class="form-group">
					 <label class="col-xs-4 control-label">주소</label>
                  	 <div class="col-xs-4">	                 	
						 <input class="form-control" type="button" style="background-color:#949494; color:white;" onclick="sample2_execDaumPostcode()" value="주소 검색">
						 <input class="form-control" type="text" name="mpostalCode" id="sample2_postcode" style="text-align: center;" placeholder="우편번호" readonly="readonly">
						 	<span class="final_mpost_ck" style="color:blue; display:none;">필수 : 주소검색을 진행해주세요.</span>
						 <input class="form-control" type="text" name="maddress" id="sample2_address" style="text-align: center;" placeholder="주소" readonly="readonly">
						 	<span class="final_maddr_ck" style="color:blue; display:none;">필수 : 주소검색을 진행해주세요.</span>
						 <input class="form-control" type="text" name="mdetailAddress" id="sample2_detailAddress" style="text-align: center;" placeholder="상세주소" >
						 	<span class="final_mdaddr_ck" style="color:blue; display:none;">필수 : 상세주소를 입력해주세요.</span>
				 	 </div>
				 </div>
								
					<!-- iOS에서는 position:fixed 버그가 있음, 적용하는 사이트에 맞게 position:absolute 등을 이용하여 top,left값 조정 필요 -->
					<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
					<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
					</div>	
                         
                  <div class="form-group">
                  		<label class="col-xs-4 control-label">피부타입</label>
                  		<div class="col-xs-4">
					        <select style="text-align: center;" class="form-control" id="mskintype" name="mskinType">
					        	<option style="text-align: center;" selected disabled value="">SKIN TYPE (CHOICE)</option>
								<option style="text-align: center;" value="C"> Combination Skin (복합성)
								<option style="text-align: center;" value="O"> Oily Skin (지성)
								<option style="text-align: center;" value="D"> Dry Skin (건성)
							</select>
							<span class="final_mskintype_ck" style="color:blue; display:none;">필수 : 피부타입을 선택해주세요.</span>
                 		</div>
                  </div>
                 
                  <div class="form-group">
                    <button type="button" class="btn btn-success btn-circle" id="join_btn">가입</button>
                    <button type="button" class="btn btn-default btn-circle" id="join_cancel"
                    		onClick="location.href='${contextPath}/member/myLogin'">취소</button>
                  </div>
                  
                  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                  
                </form>
            
            <hr class="divider-w mb-10">
            <span class="btn btn-g btn-round"><i class="fa fa-cog fa-spin"></i> All My Beauty</span>
        	<h5 class="font-alt">회원가입 입력칸 모두 필수입니다. E-MAIL의 경우 오타에 주의해주세요.</h5>
          	<h5 class="font-alt">개인정보를 제3자에게 양도하거나 이용하도록 하여 불이익이 발생하는 일이 없도록 정보보호에 각별히 유념하여 주시기 바랍니다.</h5>
          </div>
          
              
        </section>
        
        
      </div>
      <div class="scroll-up"><a href="#totop"><i class="fa fa-angle-double-up"></i></a></div>
    </main>
    
<script>

var join_form = $("#join_form");

var emailCode = ""; //이메일 전송 인증번호 저장코드

var csrfHeaderName = "${_csrf.headerName}"; 
var csrfTokenValue = "${_csrf.token}"; //토큰값 저장

// 회원가입 유효성 검사 통과유무 변수 (Check부분에만 카멜방식)
var midCheck = false;     	 //아이디 
var midckCheck = false;	  	 //아이디 중복 검사
var mpwCheck = false;	  	 //비번 
var mpwckCheck = false;   	 //비번 확인 
var mpwckCorCheck = false;	 //비번 일치 확인
var mnameCheck = false;    	 //이름 
var mgenderCheck = false;    //성별 
var memailCheck = false;     //메일 
var memailnumCheck = false;  //메일 인증번호 확인
var mphoneCheck = false;     //번호 
var mpostalCheck = false;    //우편번호
var maddressCheck = false;   //주소
var mdetailaddCheck = false; //상세주소
var mskintypeCheck = false;	 //스킨타입

//아이디 중복검사
//propertychange change keyup paste input : input 변화 감지하는 이벤트 
$("#mid").on("propertychange change keyup paste input", function(e){
	
	var mid = $("#mid").val();    //input에 입력되는 값
	var data = {mid : mid} // 컨트롤에 넘길 이름 : 데이터(input에 입력되는 값)
	   
	   $.ajax({
	      type : "post",
	      url : "${contextPath}/member/memberIdChk",
	      beforeSend: function(xhr) {
			    	  xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			    	  },
	      data : data,
	      success : function(idExistResult){

	         if(mid != ""){ //아이디가 입력된 상태
	            if(idExistResult == "yes"){ // 중복있으면
	               $(".id_input_use").css("display","none");
	               $(".id_input_exist").css("display", "inline-block");
	               $(".final_mid_ck").css("display", "none");
	               midckCheck = false;  
	               
	            }else if(idExistResult == "no"){ // 중복없으면
	               $(".id_input_use").css("display","inline-block");
	               $(".id_input_exist").css("display", "none");
	               $(".final_mid_ck").css("display", "none");
	               midckCheck = true;
	            }
	         }else{ //아무것도 입력되지 않은 상태
	            $(".id_input_use").css("display","none");
	            $(".id_input_exist").css("display", "none");
	            $(".final_mid_ck").css("display", "inline-block");
	            midckCheck = false;
	         }

			
			
		} <%-- success 종료 --%>
	
	}); <%-- ajax - end --%>
	
}); <%-- 중복검사 function - end --%>

//비밀번호 확인 일치 유효성 검사 (입력을 할 때마다 실행이 되는 메서드) : 가입버튼 누르지않아도 일치여부 알아야하기 때문에
$("#mpwck").on("propertychange change keyup paste input", function(e){

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

// 입력 이메일 형식 유효성 검사 
function emailCheck(memail){
  
	var form = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
   
	return form.test(memail);
}

//회원가입 버튼(회원가입 기능작동)
$("#join_btn").on("click",function(e){
	
	//입력값 변수
	var mid = $("#mid").val();
	var mpw = $("#mpw").val();
	var mpwck = $("#mpwck").val();
	var mname = $("#mname").val();
	var mgender = $("#mgender option:selected").val();
	var memail = $("#memail").val();
	var mpost = $("#sample2_postcode").val();
	var maddr = $("#sample2_address").val();
	var mdaddr = $("#sample2_detailAddress").val();
	var mskintype = $("#mskintype option:selected").val();
	
	//아이디 유효성 검사
	//id를 입력할 때 아무것도 없으면 span태그가 보이고 Check는 false 
	//입력되어 있으면 span태그는 사라지고 idCheck는 true
	if(mid == ""){
		$(".final_mid_ck").css("display", "inline-block");
		midCheck = false;
	}else{
		$(".final_mid_ck").css("display", "none");
		midCheck = true;
	}
	
	//비밀번호 유효성 검사
	if(mpw == ""){
		$(".final_mpw_ck").css("display", "inline-block");
		mpwCheck = false;
	}else{
		$(".final_mpw_ck").css("display", "none");
		mpwCheck = true;
	}
	
	//비밀번호 확인 유효성 검사
	if(mpwck == ""){
		$(".final_mpwck_ck").css("display", "inline-block");
		mpwckCheck = false;
	}else{
		$(".final_mpwck_ck").css("display", "none");
		mpwckCheck = true;	
	}
	
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
	
	});
	
	//이름 유효성검사
	if(mname == ""){
		$(".final_mname_ck").css("display", "inline-block");
		mnameCheck = false;
	}else{
		$(".final_mname_ck").css("display", "none");
		mnameCheck = true;	
	}
	
	//성별 유효성검사
	if(mgender == ""){
		$(".final_mgender_ck").css("display", "inline-block");
		mgenderCheck = false;
	}else{
		$(".final_mgender_ck").css("display", "none");
		mgenderCheck = true;	
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
	if(memail == ""){
		$(".final_mphone_ck").css("display", "inline-block");
		mphoneCheck = false;
	}else{
		$(".final_mphone_ck").css("display", "none");
		mphoneCheck = true;
	}
	 
	
	//우편번호 유효성검사
	if(mpost == ""){
		$(".final_mpost_ck").css("display", "inline-block");
		mpostalCheck = false;
	}else{
		$(".final_mpost_ck").css("display", "none");
		mpostalCheck = true;
	}
	
	//주소 유효성 검사
	if(maddr == ""){
		$(".final_maddr_ck").css("display", "inline-block");
		maddressCheck = false;
	}else{
		$(".final_maddr_ck").css("display", "none");
		maddressCheck = true;
	}
	
	//상세주소 유효성 검사
	if(mdaddr == ""){
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

	
 	//최종 유효성 검사
	if(midCheck&&midckCheck&&mpwCheck&&mpwckCheck&&mpwckCorCheck&&mnameCheck&&mgenderCheck&&
			memailCheck&&memailnumCheck&&mphoneCheck&&mpostalCheck&&maddressCheck&&mdetailaddCheck&&mskintypeCheck){
		
		alert("회원가입 완료되었습니다.");
	 	join_form.attr("action", "${contextPath}/member/join");
		join_form.attr("method", "POST");
		join_form.submit(); 	
	}
	
	//단 한개라도 false가 있을 경우 해당 코드를 읽음. (정상 종료 못할 경우를 대비)
	return false; 
	
	
}); <%-- 회원가입 btn 클릭 function - end --%>


//인증번호 이메일 전송 클릭시
$("#mail_checkBtn").on("click", function(e){
    
	//alert("전송버튼작동");
	
	var memail = $("#memail").val(); //입력한 이메일
	var emailChNum = $("#mail_check_input"); //인증번호 입력란
	var emailChNumBox = $(".mail_check_input_box"); //인증번호 입력란 박스
	var warnMsg = $(".email_input_warn"); //이메일 입력 경고글

	if(emailCheck(memail)){
		alert("인증번호를 해당 메일로 보내드렸습니다.");
        warnMsg.css("display", "none");
        
        $.ajax({
    		type : "get",
    		url : "${contextPath}/member/mailCheck?memail=" + memail,
    		
    		success : function(data){
    			
    			emailChNum.attr("disabled", false); //성공하면 disabled를 풀어줌.
    			emailChNumBox.attr("id", "mail_check_input_box_true"); //id값 변경(흰색 -> 회색) css파일 맨밑에 있음.
    			emailCode = data;
    			
    			//console.log("emailCode : " + emailCode);
    		} //success -end
    		
    	});
        
	}else{
		warnMsg.html("올바르지 못한 이메일 형식입니다.");
		warnMsg.css("display", "inline-block");
	}
	
	
	
	
});

//인증번호 비교
//blur 기능 : focus가 다른곳으로 이동시에 작동함. (뒤에 핸드폰번호와 우편번호가 있기때문에 확인버튼은 따로만들지 않음.)
$("#mail_check_input").blur(function(){
	
	var inputEmailCode = $("#mail_check_input").val();
	var checkResult = $("#mail_check_input_box_warn");
	
	if(inputEmailCode == emailCode){
		checkResult.html("인증에 성공하셨습니다.");
		checkResult.css("color", "green");
		memailnumCheck = true; //인증번호 유효성검사
		
	}else{
		checkResult.html("인증번호를 다시 확인해주세요.");
		checkResult.css("color", "red");
		memailnumCheck = false; //인증번호 유효성검사
	}
	
	
});

</script>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    // 우편번호 찾기 화면을 넣을 element
    var element_layer = document.getElementById('layer');

    function closeDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        element_layer.style.display = 'none';
    }

    function sample2_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

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
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample2_address").value = extraAddr;
                
                } else {
                    document.getElementById("sample2_address").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample2_postcode').value = data.zonecode;
                document.getElementById("sample2_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample2_detailAddress").focus();

                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                element_layer.style.display = 'none';
            },
            width : '100%',
            height : '100%',
            maxSuggestItems : 5
        }).embed(element_layer);

        // iframe을 넣은 element를 보이게 한다.
        element_layer.style.display = 'block';

        // iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
        initLayerPosition();
    }

    // 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
    // resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
    // 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
    function initLayerPosition(){
        var width = 300; //우편번호서비스가 들어갈 element의 width
        var height = 400; //우편번호서비스가 들어갈 element의 height
        var borderWidth = 5; //샘플에서 사용하는 border의 두께

        // 위에서 선언한 값들을 실제 element에 넣는다.
        element_layer.style.width = width + 'px';
        element_layer.style.height = height + 'px';
        element_layer.style.border = borderWidth + 'px solid';
        // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
        
        // 기존코드
        // element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
        element_layer.style.right = '400px';
        element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
    }
   
</script>
    
<%@ include file="../include/myfooter.jsp" %>
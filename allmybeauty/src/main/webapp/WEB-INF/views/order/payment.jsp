<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>     

<section class="module">
        <div class="container"> 
        	<div class="col-sm-10 col-sm-offset-1">
                <div class="alert alert-info" style="text-align: center;">
                	<c:if test="${cartCheckList!=null}">
                		<h3>01. ${orderData.MName}님의 장바구니 > <strong>02. 주문/결제</strong> > 03. 주문완료</h3>
                	</c:if>
                	<c:if test="${cartCheckList==null}">
                		<h3>01. ${orderData.orderDataVO.MName}님의 장바구니 > <strong>02. 주문/결제</strong> > 03. 주문완료</h3>
                	</c:if>
                </div>                      
            </div>   	 
            <div class="col-sm-10 col-sm-offset-1">               
              <h4 class="font-alt mb-0">배송지 정보</h4>
              <hr class="divider-w mt-10 mb-20">
              <form class="form" role="form" id="frmOrderData" name="frmOrderData">
              	<c:if test="${cartCheckList!=null}">
              	<div class="form-group"> 
                <h4>받는분</h4>
                <table>
                <tr>
                	<td><input class="form-control" type="text" id="orderName" name="orderName" style="width: 200px; height: 30px; font-size: 15px"  value=""/></td>
                  	<td>
                  		&nbsp;&nbsp;<input type="checkbox" id="copyMember" size="20px"/>               		
                  	</td>  
                  	<td>&nbsp;주문자정보와동일</td>
               	</tr>
                </table>	          		
                </div>
                <div class="form-group">
                  <h4>연락처</h4>
                  <input class="form-control" type="text" id="orderPhone" name="orderPhone" value="" style="width: 400px; height: 30px; font-size: 15px"/>
                </div>
                <div class="form-group">
                  <h4>주소</h4>
                  <input class="form-control" type="text" id="oPostalCode" name="oPostalCode" value="" style="width: 400px; height: 30px; font-size: 15px"/>
                  <input type="button" onclick="findPostCode()" value="우편번호 찾기">
                  <input class="form-control" type="text" id="oAddress" name="oAddress" value="" style="width: 400px;"/>
                  <input class="form-control" type="text" id="oDetailAddress" name="oDetailAddress" value="" style="width: 400px;"/>
                </div>
                <h4>배송 요청사항</h4>
                <select id="selectOption" title="택배배송 메시지를 선택해주세요." style="width:350px">
					<option value="1">배송메시지를 선택해주세요.</option>
					<option value="2">그냥 문 앞에 놓아 주시면 돼요.</option>
					<option value="3">직접 받을게요.(부재 시 문앞)</option>
					<option value="4">벨을 누르지 말아주세요.</option>
					<option value="5">도착 후 전화주시면 직접 받으러 갈게요. </option>
                    <option value="6">직접 입력하기</option>       
				</select><br>
                <input type="text" id="orderRequirement" name="orderRequirement" value="" title="배송메시지를 입력해주세요." style="width: 350px; display: none;">   
                <input type="hidden" id="mName" name="mName" value="${orderData.MName}"/>
				<input type="hidden" id="mPhone" name="mPhone" value="${orderData.MPhone}"/>
				<input type="hidden" id="mPostalCode" name="mPostalCode" value="${orderData.MPostalCode}"/>
				<input type="hidden" id="mAddress" name="mAddress" value="${orderData.MAddress}"/>
				<input type="hidden" id="mDetailAddress" name="mDetailAddress" value="${orderData.MDetailAddress}"/>
				<input type="hidden" id="mid" name="mid" value="${mid}"/>
				<input type="hidden" id="oTotalPrice" name="oTotalPrice" value="${oTotalPrice}"/>
				<input type="hidden" id="TotalPrice" name="TotalPrice" value="${oTotalPrice}"/>
				<input type="hidden" id="cartId" name="cartId" value="${cartCheckList.get(0).cartId}"/>	
				<input type="hidden" id="orderAddress" name="orderAddress" value=""/>
				<input type="hidden" id="orderPoint" name="orderPoint" value="0"/>
              	</c:if>
              
              	<c:if test="${cartCheckList==null}">
                <div class="form-group"> 
                <h4>받는분</h4>
                <table>
                <tr>
                	<td><input class="form-control" type="text" id="orderName" name="orderName" style="width: 200px;" value=""/></td>
                  	<td>
                  		&nbsp;&nbsp;<input type="checkbox" id="copyMember" size="20px"/>               		
                  	</td>  
                  	<td>&nbsp;주문자정보와동일</td>
               	</tr>
                </table>	          		
                </div>
                <div class="form-group">
                  <h4>연락처</h4>
                  <input class="form-control" type="text" id="orderPhone" name="orderPhone" value="" style="width: 400px; height: 30px; font-size: 15px"/>
                </div>
                <div class="form-group">
                  <h4>주소</h4>
                  <input class="form-control" type="text" id="oPostalCode" name="oPostalCode" value="" style="width: 400px; height: 30px; font-size: 15px"/>
                  <input type="button" onclick="findPostCode()" value="우편번호 찾기">
                  <input class="form-control" type="text" id="oAddress" name="oAddress" value="" style="width: 400px;"/>
                  <input class="form-control" type="text" id="oDetailAddress" name="oDetailAddress" value="" style="width: 400px;"/>
                </div>
                <h4>배송 요청사항</h4>
                <select id="selectOption" title="택배배송 메시지를 선택해주세요." style="width:350px">
					<option value="1">배송메시지를 선택해주세요.</option>
					<option value="2">그냥 문 앞에 놓아 주시면 돼요.</option>
					<option value="3">직접 받을게요.(부재 시 문앞)</option>
					<option value="4">벨을 누르지 말아주세요.</option>
					<option value="5">도착 후 전화주시면 직접 받으러 갈게요. </option>
                    <option value="6">직접 입력하기</option>       
				</select>   
                <input type="text" id="orderRequirement" name="orderRequirement" value="" title="배송메시지를 입력해주세요." style="width: 350px; display: none;">   
                <input type="hidden" id="mName" name="mName" value="${orderData.orderDataVO.MName}"/>
				<input type="hidden" id="mPhone" name="mPhone" value="${orderData.orderDataVO.MPhone}"/>
				<input type="hidden" id="mPostalCode" name="mPostalCode" value="${orderData.orderDataVO.MPostalCode}"/>
				<input type="hidden" id="mAddress" name="mAddress" value="${orderData.orderDataVO.MAddress}"/>
				<input type="hidden" id="mDetailAddress" name="mDetailAddress" value="${orderData.orderDataVO.MDetailAddress}"/>
				<input type="hidden" id="mid" name="mid" value="${mid}"/>
				<input type="hidden" id="oTotalPrice" name="oTotalPrice" value="${orderData.cartVO.productPrice*amount}"/>
				<input type="hidden" id="TotalPrice" name="TotalPrice" value="${orderData.cartVO.productPrice*amount}"/>
				<input type="hidden" id="productId" name="productId" value="${orderData.cartVO.productId}"/>	
				<input type="hidden" id="amount" name="amount" value="${amount}"/>			
				<input type="hidden" id="orderAddress" name="orderAddress" value=""/>
				<input type="hidden" id="orderPoint" name="orderPoint" value="0"/>	
				</c:if>	
				<sec:csrfInput />	
              </form>
            </div>
        </div>
      <div class="main">
        <div class="container">
          <div class="row">
            <div class="col-sm-10 col-sm-offset-1">
            <h4>AllMyBeauty 배송 상품</h4>
         	<hr class="divider-w pt-20">
              <table class="table table-striped table-border checkout-table">
                <tbody>
				<tr>
                    <th style="text-align: center">상품</th>
                    <th width="100" style="text-align: center">판매가</th>
                    <th width="50" style="text-align: center">수량</th>
                    <th width="100" style="text-align: center">구매가</th>
                  </tr>
             	</tbody>  
           	 	<tbody class="product"> 
           	 	<c:if test="${cartCheckList!=null}">
        	     <c:forEach items="${cartCheckList}" var="cartCheck">                                              
        	   	 <tr class="cart" style="text-align: center">          	                 
        		   <td style="text-align: left">
          	   			<input type="hidden" name="productImage" value="${cartCheck.repoPath }/${cartCheck.uploadPath }/${cartCheck.uuid }_${cartCheck.fileName }"/>
                		<img src='' alt="No Image" style="height: 80px; width: 80px;"/>
         	    		<c:out value="${cartCheck.productBrand}"/>
                     	<c:out value="${cartCheck.productName}"/>    
  	 	           </td>
    		       <td class="hidden-xs" id="productPrice" style="vertical-align: middle;">
     	 	       		<h5 class="product-title font-alt">￦<fmt:formatNumber value="${cartCheck.productPrice}"/></h5>
  		           </td>
             	   <td style="vertical-align: middle; text-align: center;">
              	   		<fmt:formatNumber value="${cartCheck.cartAmount}"/>                     						
        	       </td>
              	   <td class="sum" style="vertical-align: middle;">
               			<fmt:formatNumber value="${cartCheck.productPriceSum}"/>
              	   </td>                                    
           		</tr>              
           		<input type="hidden" name="productStock" value="${cartCheck.productId}"/>   
           		</c:forEach>
           		</c:if>
           		<c:if test="${cartCheckList==null}">
           		<tr class="cart" style="text-align: center">          	                 
        		   <td style="text-align: left">
          	   			<input type="hidden" name="productImage" value="${orderData.cartVO.repoPath }/${orderData.cartVO.uploadPath }/${orderData.cartVO.uuid }_${orderData.cartVO.fileName }"/>
                		<img src='' alt="No Image" style="height: 80px; width: 80px;"/> 
         	    		<c:out value="${orderData.cartVO.productBrand}"/>
                     	<c:out value="${orderData.cartVO.productName}"/>    
  	 	           </td>
    		       <td class="hidden-xs" id="productPrice" style="vertical-align: middle;">
     	 	       		<h5 class="product-title font-alt">￦<fmt:formatNumber value="${orderData.cartVO.productPrice}"/></h5>
  		           </td>
             	   <td style="vertical-align: middle; text-align: center;">
              	   		<fmt:formatNumber value="${amount}"/>                     						
        	       </td>
              	   <td class="sum" style="vertical-align: middle;">
               			<fmt:formatNumber value="${orderData.cartVO.productPrice*amount}"/>
              	   </td>                                    
           		</tr>
           		<input type="hidden" name="productStock" value="${orderData.cartVO.productId}"/>
           		</c:if>
         	 	</tbody>
        	</table>
        	<hr class="divider-w">
      	  </div>
   		 </div>
    <div class="row mt-70">
      <div class="col-sm-6 col-sm-offset-6">
        <div class="shop-Cart-totalbox">
          <table class="table table-striped table-border checkout-table">
            <tbody>           
              <tr class="shop-Cart">
              	<th>Point</th>
              	<td><input type="text" id="point" value="<fmt:formatNumber value="${point}"/>" style="border:none" readonly="readonly"/><br>
              		<input type="checkbox" id="pointCheck" value="<fmt:formatNumber value="${point}"/>"/>&nbsp;&nbsp;&nbsp;Point 전부 사용하기<br>  
              		<input type="text" id="usedPoint" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" value="" />&nbsp;
              		<button type="button" class="point-btn">Point 사용하기</button>        		
              	</td>
              </tr>        
              <tr class="shop-Cart">
                <th>Total</th>
                <td>
                	<c:if test="${cartCheckList!=null}">
                   ￦<input type="text" id="totalPrice" value="<fmt:formatNumber value="${oTotalPrice}"/>" style="border:none" readonly="readonly"/>
                  	</c:if>
                  	<c:if test="${cartCheckList==null}">
                   ￦<input type="text" id="totalPrice" value="<fmt:formatNumber value="${orderData.cartVO.productPrice*amount}"/>" style="border:none" readonly="readonly"/>
                    </c:if>      
                </td>
              </tr>       
            </tbody>
          </table>    
          <button class="btn btn-lg btn-block btn-round btn-d" id="pay">결제</button>
        </div>
      </div>
    </div>
  </div>  
</div>
</section>   
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

<%--가격 콤마 삽입 제거--%>
function uncomma(str) {
    str = String(str);
    return str.replace(/[^\d]+/g, '');
}

function comma(str) {
    str = String(str);
    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
}

//배송메세지 선택
$("#selectOption").on("change", function(e){
	var target = document.getElementById("selectOption");
    
	if(target.options[target.selectedIndex].value == 6){
		$("#orderRequirement").show();
		$("#orderRequirement").val("");		
	}else{
		$("#orderRequirement").hide();
		$("#orderRequirement").val(target.options[target.selectedIndex].text);
	}
});

//주소 가져오기  
function findPostCode() {
    new daum.Postcode({
        oncomplete: function(data) {
        	
            var addr = ''; // 주소 변수
            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }
            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){  
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }           
            }
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('oPostalCode').value = data.zonecode;
            document.getElementById("oAddress").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("oDetailAddress").focus();
        }
    }).open();
}

//주문자정보 가져오기
$("#copyMember").on("change", function(e){
	
	var check = $("#copyMember").prop("checked");
	
	if(check){
		$("#orderName").val($("#mName").val());
		$("#orderPhone").val($("#mPhone").val());
		$("#oPostalCode").val($("#mPostalCode").val());
		$("#oAddress").val($("#mAddress").val());
		$("#oDetailAddress").val($("#mDetailAddress").val());
	}else{
		$("#orderName").val(null);
		$("#orderPhone").val(null);
		$("#oPostalCode").val(null);
		$("#oAddress").val(null);
		$("#oDetailAddress").val(null);
	}
});    
//윈도우 팝업창 변수
var windowObj;

//결제버튼클릭
$("#pay").on("click", function(e){
	var csrfHeaderName = "${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";
	
	var formObj = $("form[role='form']");
	var mid = $("#mid").val();
	var name = $("#orderName").val();
	var phone = $("#orderPhone").val();
	var postalCode = $("#oPostalCode").val();
	var address = $("#oAddress").val();
	var detailAddress = $("#oDetailAddress").val();
	var target = document.getElementById("selectOption");
	$("#orderAddress").val(postalCode + " " + address + " " + detailAddress);
	
	var result = confirm("결제하시겠습니까?");
	
	if(result){		
		if(phone.length > 11){
			alert("전화번호를 정확히 입력해 주세요");
			return;
		} 

	 	if( (name.length==0 ||name=="") ||
		    (address.length==0 ||address=="") ||
		    (postalCode.length==0 ||postalCode=="") ||
		    (phone.length==0 ||phone=="") ||
		    (address.length==0 ||address=="") ||
		    (detailAddress.length==0 ||detailAddress=="") ){
	 		alert("배송지 정보를 입력해주세요.");
					
		   	return;
		}else if(target.options[target.selectedIndex].value == 6){
			if($("#orderRequirement").val()=="" || $("#orderRequirement").val()==null){
 				alert("배송메시지를 작성해주세요.");
 	 			return;
 			}
		}else if(target.options[target.selectedIndex].value == 1){
 	 			alert("배송메시지를 선택해주세요.");
 	 			return;
 	 	}	 	 	    
 	
	 	formObj = $("form[role='form']").serialize();
	 	
	 	$.ajax({
	 		type : 'post',
            url : '${contextPath}/order/selectStock',
            data : decodeURIComponent(formObj),
            dataType : 'json',
            success : function(data){	
            	  	if(data== false){
            	  		alert("재고가 부족하거나 임시 품절입니다.\n수량을 줄이거나 관리자에게 문의해주세요.");
            	  		return;
            	  	}else if(data == true){
            	  		if (windowObj == null){
            		 		$.ajax({
            		            type : 'post',
            		            url : '${contextPath}/order/kakaopay',
            		            data : decodeURIComponent(formObj),
            		            dataType : 'json',
            		            beforeSend: function(xhr) {
            		   				 xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
            						 },	
            		            success : function(data){	
            		            	windowObj = window.open(data.next_redirect_pc_url,"카카오페이","width=500,height=500,left=600"); 
            	      	
            		            	var closeCheck = setInterval(function () {
            	 	                   
            	        	        	if(!windowObj || windowObj.closed) {
            	        	            	clearInterval(closeCheck);
            	        	            	
            	        	            	$.ajax({
            	        			            type : 'get',
            	        			            url : '${contextPath}/order/kakaopayfail',
            	        			            data : {mid : mid},
            	        			            beforeSend: function(xhr) {
            	            		   				 xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
            	            						 },	
            	        			            success : function(){
            	        			            	alert("결제가 취소되었습니다.");	              	
            	        			            }            
            	        			        });	
            	        	            }
            	        	        }, 100);   	
            		            } 			
            		        }); 	
            		 	}else{
            		 		if(windowObj.closed){
            		 			$.ajax({
            			            type : 'post',
            			            url : '${contextPath}/order/kakaopay',
            			            data : decodeURIComponent(formObj),
            			            dataType : 'json',
            			            beforeSend: function(xhr) {
               		   				 xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
               						 },	
            			            success : function(data){
            			            	windowObj = window.open(data.next_redirect_pc_url,"카카오페이","width=500,height=500,left=600");   
            	            			
            			            	var closeCheck = setInterval(function () {
            		 	                   
            		        	        	if(!windowObj || windowObj.closed) {
            		        	            	clearInterval(closeCheck);
            		        	            	
            		        	            	$.ajax({
            	            			            type : 'get',
            	            			            url : '${contextPath}/order/kakaopayfail',
            	            			            data : {mid : mid},
            	            			            success : function(){
            	            			            	alert("결제가 취소되었습니다.");	              	
            	            			            }            
            	            			        });	
            		        	            }
            		        	        }, 100);  
            			            }
            			        });
            		 		}else{
            		 			alert("이미 결제가 진행 중입니다.\n진행중인 결제창을 닫고 다시 시도해주세요.");
            		 			windowObj.focus();
            		 		}
            		 	}
            	  	}
               }
	 	});	
	}else{
		alert("결제가 취소되었습니다.");
	}
});
//전체 포인트 사용
$("#pointCheck").on("change", function(e){
	var check = $(this).prop("checked");
	var totalPrice = uncomma($("#totalPrice").val());
	var oTotalPrice = $("#oTotalPrice").val();
	var TotalPrice = $("#TotalPrice").val();
	var realPoint = uncomma($(this).val());
	var point = uncomma($("#point").val());
	
	if (!check){
		$("#totalPrice").val(comma(TotalPrice));
		$("#oTotalPrice").val(TotalPrice);
		$("#orderPoint").val(comma(0));
		$("#point").val(comma(realPoint));
	} else{
		$("#totalPrice").val(comma(totalPrice-point));
		$("#oTotalPrice").val(totalPrice-point);
		$("#orderPoint").val(point);
		$("#point").val(comma(0));
	}
});
//포인트 직접 입력 사용 
$(".point-btn").on("click", function(e){
	var usedPoint = $("#usedPoint").val();
	var point = uncomma($("#point").val());
	var totalPrice = uncomma($("#totalPrice").val());
	var orderPoint = $("#orderPoint").val();
	var oTotalPrice = $("#oTotalPrice").val();
	
	if(parseInt(totalPrice)<parseInt(usedPoint)){
		alert("주문가격은 0원 미만으로 되지않습니다.");
		return;
	}else{
		if(parseInt(usedPoint)<parseInt(point)){
	 		$("#totalPrice").val(comma(totalPrice-usedPoint));
			$("#point").val(comma(point-usedPoint));
			$("#orderPoint").val(parseInt(orderPoint)+parseInt(usedPoint));
			$("#oTotalPrice").val(totalPrice-usedPoint);
			$("#usedPoint").val('');			
		}else if(usedPoint <= 0 || usedPoint == null || usedPoint==""){
			alert("포인트를 정확히 입력해주세요.")
			$("#usedPoint").val('');
			return;
		}else if(parseInt(usedPoint)>parseInt(point)){
			alert("포인트가 충분하지 않습니다.");
			$("#usedPoint").val('');
			return;
		}
	}
});


$(document).ready(function(){
	var thumbnailFilePath;
		
	$("input[name='productImage']").each(function(i) {
		thumbnailFilePath=encodeURIComponent($(this).val());
				
    	console.log(thumbnailFilePath);
    	$("img").eq(i).attr("src", "${contextPath}/displayThumbnailFile?fileName=" + thumbnailFilePath);
	});
});

</script>




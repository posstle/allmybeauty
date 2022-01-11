<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>     

<%@ include file="../include/myheader.jsp"%>
        <section class="module">
          <div class="container">
            <div class="alert alert-info" style="text-align: center;">
            <sec:authentication property="principal" var="principal"/>
            	<h3><strong>01. ${principal.username}님의 장바구니</strong> > 02. 주문/결제 > 03. 주문완료</h3>
            </div>          
            <hr class="divider-w pt-20">
            <h4>AllMyBeauty 배송상품</h4>
            <div class="row">
              <div class="col-sm-12" > 
                <table class="table table-striped table-border checkout-table">
                  <tbody>
					<tr>
                      <th class="hidden-xs" style="text-align: center">
                      	<input type="checkbox" class="cartAllCheck" checked="checked" title="배송상품 전체선택"/>
                      </th>
                      <th style="text-align: center">상품</th>
                      <th style="text-align: center">판매가</th>
                      <th style="text-align: center" width="140">수량</th>
                      <th style="text-align: center">구매가</th>
                      <th style="text-align: center">선택</th>
                    </tr>
                  </tbody>  
                  <tbody class="product">
                  	<c:choose><c:when test="${cartListSize > 0}">
                    <c:forEach items="${cartList}" var="cart">                                              
                    <tr class="cart" style="text-align: center">                 
                      <td class="hidden-xs" style="vertical-align: middle;">
                      	<input type="checkbox" class="cartCheck" name="cartCheck" id="cartCheck_${cart.rownum}" value="${cart.cartId}" checked="checked" title="${cart.productName} 선택"/>                     	
                      </td>
                      <td style="text-align: left">
                      	<div class="proDetail">
                      		<input type="hidden" name="productImage" value="${cart.repoPath }/${cart.uploadPath }/${cart.uuid }_${cart.fileName }"/>
                			<img src='' class="image" alt="No Image" style="height: 100px; width: 100px;" />
                      		<span>
                      			<c:out value="${cart.productBrand}"/>
                      			<c:out value="${cart.productName}"/>
                      		</span>
                      	</div>     
                      </td>
                      <td class="hidden-xs" id="productPrice" style="vertical-align: middle;">
                        <h5 class="product-title font-alt">￦<fmt:formatNumber value="${cart.productPrice}"/></h5>
                        <input type="hidden" class="productPrice" value="<c:out value="${cart.productPrice}"/>"/>
                      </td>
                      <td style="vertical-align: middle;">
                      	<input class="cartAmount" type="text" value="<c:out value="${cart.cartAmount}"/>" style="border:none " size="1" readonly="readonly"/>              
                      	<button class="amountPlus_btn" value="${cart.cartId}" style="border:none">
                      		<img src="${contextPath}/resources/images/plus.png" width="20px" height="20px">
                      	</button>
                      	<button class="amountMinus_btn" value="${cart.cartId}" style="border:none">
							<img src="${contextPath}/resources/images/minus.png" width="20px" height="20px">     
						</button>					
                      </td>
                      <td class="sum" style="vertical-align: middle;">
                       	￦<input class="productPriceSum" type="text" value='<fmt:formatNumber value="${cart.productPriceSum}"/>' style="border:none" size="5" readonly="readonly"/>
                      </td>
                      <td class="pr-remove" style="vertical-align: middle;">
                      	<p><button class="btn btn-d btn-circle btn-xs delete_btn" value="${cart.cartId}">삭제</button></p>
                      	<p><button class="btn btn-d btn-circle btn-xs singleOrder_btn" value="${cart.cartId}">바로 구매</button></p>
                      
                      <c:forEach items="${thumbList}" var="thumb">	
                      <c:if test="${thumb.productId==cart.productId}">
                      <input type="hidden" class="thumbflag" value="${thumb.thumbflag}"/>
                      <c:choose>
            			<c:when test="${thumb.thumbflag==1 }">
          					<button type="button" value="${thumb.productId}" id="thumb" class="thumbActive">
                				<span><i style="color:red" class="fa fa-heart"></i></span>
                  			</button>
                  			<button type="button" value="${thumb.productId}" id="thumb2" class="thumbNonActive" style="display:none">
                  				<span><i style="color:red" class="fa fa-heart-o"></i></span>
                  			</button>
            			</c:when>
              			<c:otherwise>
              				<button type="button" value="${thumb.productId}" id="thumb" class="thumbNonActive">
	                  			<span><i class="fa fa-thumbs-o-up"></i></span>
	                  		</button>
	                  		<button type="button" value="${thumb.productId}" id="thumb2" class="thumbActive" style="display:none">
	                  			<span><i class="fa fa-thumbs-up"></i></span>
	                  		</button>                 		
	          			</c:otherwise>
		          	  </c:choose>
		          	  </c:if>  
                      </c:forEach>	
                                   	
                      </td>                                       
                    </tr>                 
                    </c:forEach> 
                    </c:when>
                    <c:otherwise>
                    	<tr>
                    		<td colspan="6" style="text-align: center;">
                    			<img src="${contextPath}/resources/images/cart_img.png" alt="장바구니" style="width:200px; height:200px">
                    			<h3><strong>장바구니에 저장된 상품이 없습니다.</strong></h3>
                    		</td>
                    	</tr>
                    </c:otherwise></c:choose>
                  </tbody>
                </table>
              </div>
            </div>
            <div class="row">
              <div class="col-sm-4">
                <div class="form-group">
                  <a href="${contextPath}/product/productList?mid=${principal.username}">
                  	<button class="btn btn-block btn-round btn-d pull-right" type="submit" >쇼핑 계속하기</button>
                  </a>
                </div>
              </div>
              <div class="col-sm-4">
                <div class="form-group">
                  <button class="btn btn-block btn-round btn-d pull-right cartDeleteAll">장바구니 비우기</button>               
                </div>
              </div>
            </div>        
            <hr class="divider-w">          
            <div class="row mt-70">
              <div class="col-sm-5 col-sm-offset-7">
                <div class="shop-Cart-totalbox">
                  <table class="table table-striped table-border checkout-table">
                    <tbody><!-- 
                      <tr>
                        <th>Cart Subtotal :</th>
                        <td>£40.00</td>
                      </tr> --><!--배송비 영역
                      <tr>
                        <th>Shipping Total :</th>
                        <td>£2.00</td>
                      </tr> -->
                      <tr class="shop-Cart-totalprice">
                        <th>Total</th>
                        <td>
                        	<input type="hidden" class="cartListSize" value='${cartListSize}'>
                        	<input type="hidden" class="totalPrice" value='${totalPrice}'> 
                           ￦<input type="text" id="totalPrice" value='<fmt:formatNumber value="${totalPrice}"/>' readonly="readonly" style="border:none" size="5">        
                        </td>
                      </tr>
                    </tbody>
                  </table>
                  <button class="btn btn-lg btn-block btn-round btn-d" onclick="payment()">선택주문</button>
                  <button class="btn btn-lg btn-block btn-round btn-d" onclick="allPayment()">전체주문</button>    
                </div>
              </div>
            </div>
          </div>
        </section>
        <form id="frmSend">
        	<input type="hidden" name="mid" id="mid" value="${principal.username}"/>
        	 <sec:csrfInput />
        </form>  	
<script type="text/javascript">
var loginUser = "";
<sec:authorize access="isAuthenticated()">
	loginUser = '<sec:authentication property="principal.username"/>';
</sec:authorize>


var csrfHeaderName = "${_csrf.headerName}";
var csrfTokenValue = "${_csrf.token}";

$(document).ajaxSend(function(e, xhr, options){
	xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
}); 


window.onpageshow = function(event) {
    if (event.persisted) {
        document.location.reload();
    }
};

<%--변수 선언--%>
var mid = $("#mid").val();
var frmSend = $("#frmSend");

<%--가격 콤마 삽입 제거--%>
function uncomma(str) {
    str = String(str);
    return str.replace(/[^\d]+/g, '');
}

function comma(str) {
    str = String(str);
    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
}

<%--장바구니 개별 삭제--%>
$(".delete_btn").on("click",  function(e){
	var totalPrice = uncomma($("#totalPrice").val());
	var realTotalPrice = uncomma($(".totalPrice").val());
 	var cartId = $(this).val();
	var productPriceSum = uncomma($(this).closest("td").siblings(".sum").find(".productPriceSum").val());
	
	<%--로그인 하지 않은 경우--%>
	if(!loginUser){
		alert("로그인 후, 삭제 가능합니다.");
		return;
	}	
	
 	if(confirm("해당 상품을 삭제 하시겠습니까?")){
		var targetTr = $(this).closest("tr");
		targetTr.remove();
		
		if($(this).closest("tr").find(".cartCheck").prop("checked")){
			$("#totalPrice").val(comma(totalPrice-productPriceSum));
			$(".totalPrice").val(comma(realTotalPrice-productPriceSum));
		}else{
			$(".totalPrice").val(comma(realTotalPrice-productPriceSum));
		}
		alert("상품이 삭제되었습니다.");	
		
		$.ajax({
			type:"post" ,
			url:"${contextPath}/cart/cartdelete" ,
			data:{cartId : cartId} ,
			success: function(){
			}
		});
	}else{			
		alert("상품 삭제가 취소되었습니다");
	}  
});

<%--장바구니 비우기--%>
$(".cartDeleteAll").on("click", function (e){
	var totalPrice = $("#totalPrice").val();
	
	<%--로그인 하지 않은 경우--%>
	if(!loginUser){
		alert("로그인 후, 사용 가능합니다.");
		return;
	}
	
	if(confirm("상품을 전부 삭제 하시겠습니까?")){
		
		if($(".cartListSize").val() == 0){
	 		alert("장바구니가 비어있습니다.");
	 		return;
	 	}
		
		$("#totalPrice").val(0);
		alert("상품이 전부 삭제되었습니다.");
		
		frmSend.attr("action", "${contextPath}/cart/cartdeleteall");
		frmSend.attr("method", "post");
		frmSend.submit();
	}else{			
		alert("상품 삭제가 취소되었습니다");
	}
});

<%--장바구니 수량 1증가--%>
$(".amountPlus_btn").on("click", function(e){
	var productPriceSum = uncomma($(this).closest("td").next().find(".productPriceSum").val());
	var productPrice = uncomma($(this).closest("td").siblings("#productPrice").find(".productPrice").val());
	var cartAmount = $(this).siblings(".cartAmount").val();
	var cartId = $(this).val();
	var check = $(this).closest("tr").find(".cartCheck").prop("checked");
	var totalPrice = uncomma($("#totalPrice").val());
	var realTotalPrice = uncomma($(".totalPrice").val());
	
	<%--로그인 하지 않은 경우--%>
	if(!loginUser){
		alert("로그인 후, 사용 가능합니다.");
		return;
	}
	
	if(check){
		$(this).closest("td").next().find(".productPriceSum").val(comma(parseInt(productPriceSum)+parseInt(productPrice)));
		$("#totalPrice").val(comma(parseInt(totalPrice)+parseInt(productPrice)));
		$(".totalPrice").val(comma(parseInt(realTotalPrice)+parseInt(productPrice)));
		$(this).siblings(".cartAmount").val(parseInt(cartAmount)+1);
		$.ajax({
			type:"post" ,
			url:"${contextPath}/cart/cartamountplus" ,
			data:{cartId : cartId, cartAmount : cartAmount} ,
			success: function(){									
			}
		});
	}else{
		return;
	}
});

<%--장바구니 수량 1감소--%>
$(".amountMinus_btn").on("click", function(e){	
	var productPriceSum = uncomma($(this).closest("td").next().find(".productPriceSum").val());
	var productPrice = $(this).closest("td").siblings("#productPrice").find(".productPrice").val();
	var cartAmount = $(this).siblings(".cartAmount").val();
	var cartId = $(this).val();
	var check = $(this).closest("tr").find(".cartCheck").prop("checked");
	var totalPrice = uncomma($("#totalPrice").val());
	var realTotalPrice = uncomma($(".totalPrice").val())
	
	<%--로그인 하지 않은 경우--%>
	if(!loginUser){
		alert("로그인 후, 사용 가능합니다.");
		return;
	}
		
 	if(check){
 		if (cartAmount > 1){
			$(this).closest("td").next().find(".productPriceSum").val(comma(productPriceSum-productPrice));
		 	$("#totalPrice").val(comma(totalPrice-productPrice));
		 	$(".totalPrice").val(comma(realTotalPrice-productPrice));
			$(this).siblings(".cartAmount").val(cartAmount-1);		
		 	$.ajax({
				type:"post" ,
				url:"${contextPath}/cart/cartamountminus" ,
				data:{cartId : cartId} ,
				success: function(){									
				}
			});
		} else {
			alert("수량은 0이 될수 없습니다.");
		}
	} else{
		return;	
	}
});

<%--체크박스 개별 선택--%>
$(".cartCheck").on("change", function(e){
	
	var productPriceSum = uncomma($(this).closest("td").siblings(".sum").find(".productPriceSum").val());
	var check = $(this).prop("checked");
	var totalPrice = uncomma($("#totalPrice").val());
	var realTotalPrice = uncomma($(".totalPrice").val());
	
	if (check){
		$("#totalPrice").val(comma(parseInt(totalPrice)+parseInt(productPriceSum)));
	} else{
		$("#totalPrice").val(comma(totalPrice-productPriceSum));
		$(".cartAllCheck").prop("checked", false);
	}	
});

<%--체크박스 전체 선택--%>
$(".cartAllCheck").on("change", function(e){
	
	var allCheck = $(this).prop("checked");
	
	if (allCheck){
		$(".cartCheck").prop("checked", true);
		$("#totalPrice").val(comma($(".totalPrice").val()));
	} else{	
		$(".cartCheck").prop("checked", false);
		$("#totalPrice").val(0);		
	}
});

<%--전체주문 버튼--%>
function allPayment(){	
	var check = $('input[name="cartCheck"]');
	<%--로그인 하지 않은 경우--%>
	if(!loginUser){
		alert("로그인 후, 주문 가능합니다.");
		return;
	}
	
 	var result = confirm("주문하시겠습니까?");
 	
 	if($(".cartListSize").val() == 0){
 		alert("장바구니가 비어있습니다.");
 		return;
 	}
	
	if(result){	
		$.each(check, function(i,ch){
			if(!($(ch).is(":checked"))){
				var cartId = $("#cartCheck_"+(i+1)).val();		
				
				$.ajax({
					type:"post" ,
					url:"${contextPath}/cart/cartcheck" ,
	 				data:{cartId : cartId} ,
					success: function(){
					}
				}); 
			}else{
				var cartId = $("#cartCheck_"+(i+1)).val();
				
				$.ajax({
					type:"post" ,
					url:"${contextPath}/cart/cartcheck" ,
	 				data:{cartId : cartId} ,
					success: function(){
					}
				}); 
			}
		})
	}else{
		alert("취소되었습니다.");
		return;
	}
	frmSend.attr("action", "${contextPath}/order/payment");
	frmSend.attr("method", "post");
	frmSend.submit();
}

<%--선택주문 버튼--%>
function payment(){
	var check = $('input[name="cartCheck"]');	
	var count = 0;	
	<%--로그인 하지 않은 경우--%>
	if(!loginUser){
		alert("로그인 후, 주문 가능합니다.");
		return;
	}
	
 	var result = confirm("주문하시겠습니까?");
 	
 	if($(".cartListSize").val() == 0){
 		alert("장바구니가 비어있습니다.");
 		return;
 	}
	
	if(result){	
		$.each(check, function(i,ch){
			if($(ch).is(":checked")){
				count++;
				var cartId = $("#cartCheck_"+(i+1)).val();		
				
				$.ajax({
					type:"post" ,
					url:"${contextPath}/cart/cartcheck" ,
	 				data:{cartId : cartId} ,
					success: function(){
					}
				}); 
			}else{
				cartId = $("#cartCheck_"+(i+1)).val();
				
				$.ajax({
					type:"post" ,
					url:"${contextPath}/cart/cartuncheck" ,
	 				data:{cartId : cartId} ,
					success: function(){
					}
				});
			}
		})
		if(count == 0){
			alert("주문할 상품을 체크하세요");
			return;
		}
	}else{
		alert("취소되었습니다.");
		return;
	}
	frmSend.attr("action", "${contextPath}/order/payment");
	frmSend.attr("method", "post");
	frmSend.submit();
}

<%--바로구매 버튼--%>
$(".singleOrder_btn").on("click", function(e){
	var check = $('input[name="cartCheck"]');
	
	<%--로그인 하지 않은 경우--%>
	if(!loginUser){
		alert("로그인 후, 구매 가능합니다.");
		return;
	}
	
	var result = confirm("주문하시겠습니까?");
	
	if(result){	
		$.each(check, function(i,ch){
				var cartId = $("#cartCheck_"+(i+1)).val();			
				
				$.ajax({
					type:"post" ,
					url:"${contextPath}/cart/cartuncheck" ,
	 				data:{cartId : cartId} ,
					success: function(){
					}
				});
		})
		cartId = $(this).val();
		
		$.ajax({
			type:"post" ,
			url:"${contextPath}/cart/cartcheck" ,
				data:{cartId : cartId} ,
			success: function(){
			}
		});		
	}else{
		alert("취소되었습니다.");
		return;
	}	
	frmSend.attr("action", "${contextPath}/order/payment");
	frmSend.attr("method", "post");
	frmSend.submit();
});

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
	
<%-- 상품상세 페이지 이동 --%>
$(".proDetail").on("click", function(){
	var thumbflag;
	var productid = $(this).closest("td").siblings(".pr-remove").find("#thumb").val();	
	var thumbflagSelect = $(this).closest("td").siblings(".pr-remove").find(".thumbflag").val();

	if(thumbflagSelect==1){
 		var thumbflag1 = $(this).closest("td").siblings(".pr-remove").find("#thumb").attr("class");
 		var thumbflag2 = $(this).closest("td").siblings(".pr-remove").find("#thumb2").attr("class");
	}else if(thumbflagSelect==0){
		var thumbflag1 = $(this).closest("td").siblings(".pr-remove").find("#thumb2").attr("class");
		var thumbflag2 = $(this).closest("td").siblings(".pr-remove").find("#thumb").attr("class");	
	}
	
	$.ajax({
		type:"post" ,
		url:"${contextPath}/cart/thumbflag" ,
		data:{mid : mid, productId : productid } ,
		success: function(data){
			if(data==1){
				thumbflag = thumbflag1;;
			}else if(data==0){
				thumbflag = thumbflag2 ;			
			}
			location.href = "${contextPath}/product/detail?productid=" + productid + "&thumbflag=" + thumbflag;
		}
	});
});	


$(document).ready(function(){
	var thumbnailFilePath;
		
	$("input[name='productImage']").each(function(i) {
		thumbnailFilePath=encodeURIComponent($(this).val());

    	$(".image").eq(i).attr("src", "${contextPath}/displayThumbnailFile?fileName=" + thumbnailFilePath);
	});
});

</script> 


<%@ include file="../include/myfooter.jsp" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>     


<section class="module">
	<div class="container">
		<div class="row">
			<div class="col-sm-10 col-sm-offset-1">
				<h3 class="alert alert-info" style="text-align: center;">01. ${memberVO.mname}님의 장바구니 > 02. 주문/결제 > 03. <strong>주문완료</strong></h3>
			</div>
			<div class="col-sm-10 col-sm-offset-1">			
				<h4><strong>주문이 성공적으로 완료 되었습니다.</strong></h4>
				<p>자세한 구매내역 확인은 마이페이지에서 확인하실 수 있습니다.</p>
				<pre class="prettyprint lang-basic"> 
결제일시     	<fmt:formatDate value="${info.approved_at}" pattern="yyyy-MM-dd HH:ss"/> 				
주문번호   	${info.partner_order_id}
배송지 정보	${orderData.get(0).OPostalCode} ${orderData.get(0).OAddress} ${orderData.get(0).ODetailAddress}	
배송메세지	${orderData.get(0).orderRequirement} 
상품명     	${info.item_name}
결제금액    	￦<fmt:formatNumber value="${info.amount.total}" />
사용한 포인트  	<fmt:formatNumber value="${orderData.get(0).orderPoint}" /> P
적립된 포인트 	<fmt:formatNumber value="${info.amount.total*0.05+(((info.amount.total*0.05)%1>0.5)?(1-((info.amount.total*0.05)%1))%1:-((info.amount.total*0.05)%1))}" /> P
결제방법      	${info.payment_method_type}
				</pre>
				<div>	
					<a href="${contextPath}/product/productList"><button class="btn btn-d btn-round btn-block" >쇼핑 계속하기</button></a>
				</div>	
				<div>	
					<a href="${contextPath}/cart/cartlist?mid=${memberVO.mid}"><button class="btn btn-d btn-round btn-block" >장바구니</button></a>
				</div>
			</div>	
		</div>
	</div>
</section>
<script type="text/javascript">
	
</script>




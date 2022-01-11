<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>     
<form id="formObj">
	<input type="hidden" id="pg_token" name="pg_token" value="${pg_token}"/>			
	<input type="hidden" id="mid" name="mid" value="${mid}"/>
</form>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	
	var formObj = $("#formObj");
	var parentWindow = window.opener;

 	formObj.attr("action", parentWindow.location.href="${contextPath}/order/completepayment?mid="+$("#mid").val()+"&pg_token="+$("#pg_token").val());
 	alert("결제가 성공되었습니다.");
	window.close();
});
</script>

<%@ include file="../include/myfooter.jsp" %>




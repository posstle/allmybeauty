<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Modify</title>
</head>
<body>
	<form id="qboardfrm" method="post">
		<div>
			<label>내용</label>
			<textarea rows="3" cols="5" name="qcontent">${qboard.qcontent }</textarea>
		</div>
		
		<div>
			<label>작성자</label>
			${qboard.mid }
		</div>
		
		<div>
			<label>상품번호</label>
			<input class="form-control" name="productid" value='<c:out value="${qboard.productid }"/>' readonly="readonly"/>
			<%-- ${qboard.productid } --%>
			<%-- <p name="productid">${qboard.productid }</p> --%>
		</div>
		
		<button type="submit" onclick="sucmodify()">수정</button>
		<button type="button">취소</button>
	</form>
	
<script type="text/javascript">
	var qboardfrm = $("#qboardfrm");
	function sucmodify(){
		qboardfrm.attr("action", "${contextPath }/product/modify");	
	}
	
	
</script>
</body>
</html>
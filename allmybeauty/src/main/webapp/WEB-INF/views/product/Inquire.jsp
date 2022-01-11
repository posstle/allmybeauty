<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Inquire</title>
<link href="${contextPath }/resources/assets/css/form.css" rel="stylesheet">
</head>
<body>
 <button id="open">Open Modal</button>
    <div class="modal hidden">
        <div class="modal__overlay"></div>
        <div class="modal-header">

        </div>
        
        <form class="modal__content" name="frmqna">
            <input type="hidden" name="gdasSeq"  id="gdasSeq" >
            <input type="hidden" name="goodsNo"  id="goodsNo" >
            <h1 class="ptit">상품 Q&amp;A 작성</h1>
    
            <div class="reviews-write">
                <textarea cols="5" rows="1" name="qcontent" onkeyup="counter();" id="qcontent" name="gdasCont" placeholder="문의 내용을 입력해주세요(200자이내)"></textarea>
                    <p>
                        <span id="qconter">0</span>자/200자
                    </p>
            </div>
            <div class="btnGroup">
                <button id="BCancel" type="button" id="BCancel" class="btnGray">취소</button>
                <button id="reg" type="button" class="btnGreen" onclick="btnqna()">등록</button>
            </div>
            <div class="usage-guide">
                <h2 class="stit">이용안내</h2>
                <ul>
                <li>재판매글, 상업성 홍보글, 미풍양속을 해치는 글 등 상품 Q&amp;A의 취지에 어긋나는 글은 삭제될 수 있습니다</li>
                </ul>
            </div>
            <sec:csrfInput />
        </form>
    </div>
	<%-- <form action="${contextPath }/allmybeauty/Inquire" method="post">
		<div>
			<label>내용</label>
			<input name="qcontent"/>
		</div>
		
		<div>
			<label>작성자</label>
			<input name="mid" />
		</div>
		
		<div>
			<input type="hidden" name="productid" value="${productid }"/> 
		</div>
		
		<button type="submit">등록</button>
		<button type="button">취소</button>
	</form> --%>
</body>
</html>
/**
 * 
 */
		//Q&A 버튼 이벤트 페이지 이동
    	
		console.log("=================" + productid);
		
		//문의하기
		function qInquire(){
    		location.href = "${contextPath}/allmybeauty/Inquire?productid=" + productid;
    	}

		//문의 답변(관리자만)
		$(".qAnswer").on("click", function(){
			var qrno = $(this).data("qno");
			location.href = "${contextPath }/allmybeauty/AdminInquire?qrno=" + qrno + "&productid=" + productid;
		})

		// 문의 수정
		$(".qModify").on("click", function(){
			var mid = $(this).data("mid");
			console.log("-[-====-34=20=-432]" + mid);
			location.href = "${contextPath}/allmybeauty/modify?mid=" + mid;
		})		
		
		//문의 삭제
			$(".qDelete").on("click",  function(){
			var frmSendQboardValue = $("#frmSendQboardValue");
			var mid = $(this).data("mid");
			frmSendQboardValue.append("<input type = 'hidden' name='mid' value='" + mid + "'>");
			frmSendQboardValue.append("<input type = 'hidden' name='productid' value='" + productid + "'>");
			frmSendQboardValue.attr("method", "post");
			frmSendQboardValue.attr("action", "${contextPath}/allmybeauty/delete");
			
			frmSendQboardValue.submit();
		});
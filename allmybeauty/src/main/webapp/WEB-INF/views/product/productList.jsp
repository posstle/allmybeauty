<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/myheader.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
		.SortBy ul li {
		    float: left;
		    font-size: 12px;
		    line-height: 16px;
		    position : relative;
		    border: 0px solid #ddd;
		    background: #fff;
		}
		ul {
		    list-style: none;
		}
		.Category {
		    margin: auto;
		    width: auto;
		    margin: 35px auto 0;
		    padding: 0;
		    background: #fff;
		}
		.Category ul {
		    overflow: hidden;
		    width: auto;
		    margin: auto;
		}
		.Category ul li {
		    float: left;
		    width: 188px;
		    height: 40px;
		    border: 0px solid #ddd;
		    font-size: 0;
		    line-height: 0;
		}
		.Category ul li button {
		    width: 188px;
		    height: 40px;
		    padding: 0 12px 3px;
		    background: none;
		    color: #888;
		    font-size: 14px;
		    text-align: left;
		    font-weight: 700;
		}
		.Category ul li.on button {
		    position: relative;
		    margin: -1px;
		    background: #22d3d6;
		    color: #fff;
		    font-weight: 700;
		}
		
		.SelectCategory .on button {
		    position: relative;
		    margin: -1px;
		    color: #86efef;
		    font-weight: 700;
		    border:0;
		}
		
		.subCategory {
		    margin: auto;
		    width: auto;
		    margin: 35px auto 0;
		    padding: 0;
		    background: #fff;
		}
		.subCategory ul {
		    overflow: hidden;
		    width: auto;
		    margin: auto;
		}
		.subCategory ul li {
		    float: left;
		    width: 188px;
		    height: 40px;
		    border: 0px solid #ddd;
		    font-size: 0;
		    line-height: 0;
		}
		.subCategory ul li button {
		    width: 188px;
		    height: 40px;
		    color: #888;
		    font-size: 14px;
		    text-align: left;
		    font-weight: 700;
			float:left; 
			margin:3px 0 3px -1px; 
			padding:0 12px 0 14px;
			no-repeat left 2px;
			white-space:nowrap;
		    background: none;
		   
		}
		.subCategory ul li.on button {
		    position: relative;
		    margin: -1px;
		    background: #22d3d6;
		    color: #fff;
		    font-weight: 700;
		}
		.SkinType {
		    margin: auto;
		    width: auto;
		    margin: 35px auto 0;
		    padding: 0;
		    background: #86efef;
		}
		.SkinType ul {
		    overflow: hidden;
		    width: auto;
		    margin: auto;
		}
		.SkinType ul li {
		    float: left;
		    border: 6px solid #86efef;
			width:105px;
			height:105px;
			border-radius:75px;
			text-align:center;
			margin-right:2%;
			line-height:110px;
			
		}
		.SkinType ul li button {
		   
		   background: none;
		   color: #555;
		   border-radius:75px;
		   text-align: center;
		   margin-top:1%;
		   font-weight: 700;
		   line-height:initial;
		   border:0;
		   outline: 0;
	   }
	   .SkinType ul li.on button {
		    position: relative;
		    margin: -1px;
		    color: #86efef;
		    font-weight: 700;
		    border:0;
		}
		
		.thumbActive, .thumbNonActive {
			background-color: white;
			border : 0;
			outline: 0;
		}
		
    </style>
</head>
<body>
	<div class="main">
        <section class="module-small">
          <div class="container">
            <form class="row" id="frmSendValue" action="${contextPath }/product/productList" method="get">
	            <div class="SkinType">
					<ul style="width: 520px; margin-bottom:3%; float: left;">
						   <li class="selectSkinType" data-skintype="">
								<button type="button" class="selectButton" style="font-size: 30px;"><strong>전체</strong></button>
							</li>
							<li class="selectSkinType" data-skintype="1">
								<button type="button" class="selectButton" style="font-size: 30px;"><strong>지성</strong></button>
							</li>
						 <li class='selectSkinType' data-skintype="2">
								<button type="button" class="selectButton" style="font-size: 30px;"><strong>건성</strong></button>
							</li>
							<li class='selectSkinType' data-skintype="3">
								<button type="button" class="selectButton" style="font-size: 26px;"><strong>복합성</strong></button>
							</li>
					</ul>
						<div class="reset" style="float: left;margin-top: 8%; ">
						  <button type="button" class="btn btn-default btn-sm" onclick="allReset()">조건필터 초기화</button>
						   </div>
				   </div>

              <div class="btn-group btn-group-justified Category" role="group" aria-label="..." >
		 		  <div class="btn-group selectCategory" role="group" >
				    <button id="noticeBtn" type="button" class="btn btn-default btn-lg" style="color:#2f4f4e; font-size: 15px;"data-category=""><strong>전체</strong></button>   
				  </div>
				  <div class="btn-group selectCategory"  role="group">
				    <button  id="customerBtn" type="button" class="btn btn-default btn-lg" style="color:#2f4f4e; font-size: 15px;" data-category="cleansing"><strong>클렌징</strong></button> 
				  </div>
				  <div class="btn-group selectCategory" role="group">
				    <button  id="customerBtn" type="button" class="btn btn-default btn-lg" style="color:#2f4f4e; font-size: 15px;" data-category="skin"><strong>스킨케어</strong></button> 
				  </div>
				  <div class="btn-group selectCategory" role="group">
				    <button  id="customerBtn" type="button" class="btn btn-default btn-lg" style="color:#2f4f4e; font-size: 15px;" data-category="hair"><strong>헤어케어</strong></button> 
				  </div>
				  <div class="btn-group selectCategory" role="group">
				    <button  id="customerBtn" type="button" class="btn btn-default btn-lg" style="color:#2f4f4e; font-size: 15px;" data-category="body"><strong>바디케어</strong></button> 
				  </div>
				  <div class="btn-group selectCategory" role="group">
				    <button  id="customerBtn" type="button" class="btn btn-default btn-lg" style="color:#2f4f4e; font-size: 15px;" data-category="sun"><strong>선케어</strong></button> 
				  </div>
				  
				</div>

				
   				 <div class=" btn-group-justified Category " style="float: left;">
	              <ul id="SubCateCleansing" style="display:none;  width:100%; padding-inline-start:0px">
	              	   <li class="selectSubCategory">
	                  		<button type="button" class="btn btn-default " data-subcategory="cleansingform" style="border: 0; outline: 0;" ><strong>클렌징폼</strong></button>
	               	   </li>
	               	   <li class="selectSubCategory" >
	                  		<button type="button" class="btn btn-default " data-subcategory="cleansinggel" style="border: 0; outline: 0;"><strong>클렌징젤</strong></button>
	               	   </li>
	                   <li class='selectSubCategory'>
	                  		<button type="button" class="btn btn-default " data-subcategory="cleansingwater" style="border: 0; outline: 0;"><strong>클렌징워터</strong></button>
	               	   </li>
	               	   <li class='selectSubCategory'>
	                  		<button type="button" class="btn btn-default" data-subcategory="cleansingoil" style="border: 0; outline: 0;"><strong>클렌징오일</strong></button>
	               	   </li>
	               	   <li class='selectSubCategory' >
	                  		<button type="button" class="btn btn-default" data-subcategory="cleansingtissue" style="border: 0; outline: 0;"><strong>클렌징티슈</strong></button>
	               	   </li>
	              </ul>
	              
	              <ul id="SubCateSkin" style="display:none;  width:100%; padding-inline-start:0px">
	              	   <li class="selectSubCategory">
	                  		<button type="button" class="btn btn-default " data-subcategory="toner" style="border: 0; outline: 0;" ><strong>스킨/토너</strong></button>
	               	   </li>
	               	   <li class="selectSubCategory" >
	                  		<button type="button" class="btn btn-default "data-subcategory="lotion" style="border: 0; outline: 0;"><strong>로션/에멀전</strong></button>
	               	   </li>
	                   <li class='selectSubCategory'>
	                  		<button type="button" class="btn btn-default " data-subcategory="serum" style="border: 0; outline: 0;"><strong>에센스/앰플/세럼</strong></button>
	               	   </li>
	               	   <li class='selectSubCategory'>
	                  		<button type="button" class="btn btn-default" data-subcategory="cream" style="border: 0; outline: 0;"><strong>크림</strong></button>
	               	   </li>
	              </ul>
	              
	               <ul id="SubCateHair" style="display:none;  width:100%; padding-inline-start:0px">
	              	   <li class="selectSubCategory">
	                  		<button type="button" class="btn btn-default " data-subcategory="shampoo" style="border: 0; outline: 0;" ><strong>샴푸</strong></button>
	               	   </li>
	               	   <li class="selectSubCategory" >
	                  		<button type="button" class="btn btn-default " data-subcategory="rinse" style="border: 0; outline: 0;"><strong>린스/트리트먼트</strong></button>
	               	   </li>
	                   <li class='selectSubCategory'>
	                  		<button type="button" class="btn btn-default " data-subcategory="hairessence" style="border: 0; outline: 0;"><strong>헤어에센스</strong></button>
	               	   </li>
	              </ul>
	             
	              <ul id="SubCatebody" style="display:none;  width:100%; padding-inline-start:0px">
	              	   <li class="selectSubCategory">
	                  		<button type="button" class="btn btn-default " data-subcategory="bodywash" style="border: 0; outline: 0;" ><strong>바디워시</strong></button>
	               	   </li>
	               	   <li class="selectSubCategory" >
	                  		<button type="button" class="btn btn-default "data-subcategory="bodylotion" style="border: 0; outline: 0;"><strong>바디로션</strong></button>
	               	   </li>
	                   <li class='selectSubCategory'>
	                  		<button type="button" class="btn btn-default " data-subcategory="bodyoil" style="border: 0; outline: 0;"><strong>바디오일</strong></button>
	               	   </li>
	               	   <li class='selectSubCategory'>
	                  		<button type="button" class="btn btn-default" data-subcategory="handcream" style="border: 0; outline: 0;"><strong>핸드크림/풋크림</strong></button>
	               	   </li>
	              </ul>
	              
                 <ul id="SubCateSun" style="display:none;  width:100%; padding-inline-start:0px">
	              	   <li class="selectSubCategory">
	                  		<button type="button" class="btn btn-default " data-subcategory="suncream" style="border: 0; outline: 0;" ><strong>선크림</strong></button>
	               	   </li>
	               	   <li class="selectSubCategory" >
	                  		<button type="button" class="btn btn-default " data-subcategory="sunstick" style="border: 0; outline: 0;"><strong>선스틱</strong></button>
	               	   </li>
	              </ul>
	             </div>


              <input type="hidden" name="pageNum" value="${pagingCreator.productPaging.pageNum }"/>
              <input type="hidden" name="rowAmountPerPage" value="${pagingCreator.productPaging.rowAmountPerPage }"/>
              <input type="hidden" name="lastPageNum" value="${pagingCreator.lastPageNum }"/>
			  <input type="hidden" name="skintype" value="${pagingCreator.productPaging.skintype }"/>
              <input type="hidden" name="sortBy" value="${pagingCreator.productPaging.sortBy }"/>
              <input type="hidden" name="category" value="${pagingCreator.productPaging.category }"/>
              <input type="hidden" name="subCategory" value="${pagingCreator.productPaging.subCategory }"/>
              <input type="hidden" name="mid" value="${principal.username}"/>
              <input type="hidden" name="delflag" value="${pagingCreator.productPaging.delflag }"/>
            </form>
          </div>
        <hr class="divider-w">
        <div class="SortBy" style="margin-left: 325px;">
             <ul>
           	   <li class="selectSortTab" data-selecttab="sortthumb">
              		<button type="button" class="btn btn-g btn-round"><i class="fa fa-heart"></i>추천순</button>
           	   		&nbsp;&nbsp;&nbsp;
           	   </li>
           	   
               <li class='selectSortTab' data-selecttab="sortprice">
              		<button type="button" class="btn btn-g btn-round"><i class="fa fa-long-arrow-up" ></i>높은 가격순</button>
              		&nbsp;&nbsp;&nbsp;
           	   </li>
           	   <li class='selectSortTab' data-selecttab="sortlowprice">
              		<button type="button" class="btn btn-g btn-round"><i class="fa fa-long-arrow-down" ></i>낮은 가격순</button>
           	   </li>
             </ul>
		</div>
		</section>
        <section class="module-small">
          <div class="container">
            <div class="row multi-columns-row">
            <c:forEach items="${productList }" var="prod">
              <div class="col-sm-6 col-md-4 col-lg-4">
                <div class="shop-item">
                	<div class="shop-item-image">
                		<input type="hidden" name="productImage" value="${prod.attachfilesVO.repoPath }/${prod.attachfilesVO.uploadpath }/${prod.attachfilesVO.uuid }_${prod.attachfilesVO.filename }"/>
                		<img src='' alt="No Image" style="height: 450px; width: 400px;"/>
                		<div class="shop-item-detail"><a data-productid="${prod.productVO.productId }" class="btn btn-round btn-b addtocart"><span class="icon-basket">장바구니 담기</span></a></div>
                  	</div>
	                <h4 class="shop-item-title font-alt">
	                  <a class="proDetail" data-productid="${prod.productVO.productId }" href="#me">${prod.productVO.productName }</a>&nbsp;
	                 <c:choose>
            			<c:when test="${prod.productVO.thumbflag>=1 }">
          					<button type="button" value="${prod.productVO.productId }" class="thumbActive">
                				<span><i style="color:red" class="fa fa-heart"></i>&nbsp;${prod.productVO.productThumb}</span>
                  			</button>
                  			<button type="button" value="${prod.productVO.productId }" class="thumbNonActive" style="display:none">
                  				<span><i style="color:red" class="fa fa-heart-o"></i>&nbsp;${prod.productVO.productThumb-1}</span>
                  			</button>
            			</c:when>
              			<c:otherwise>
              				<button type="button" value="${prod.productVO.productId }" class="thumbNonActive">
	                  			<span><i style="color:red" class="fa fa-heart-o"></i>&nbsp;${prod.productVO.productThumb}</span>
	                  		</button>
	                  		<button type="button" value="${prod.productVO.productId }" class="thumbActive" style="display:none">
	                  			<span><i style="color:red" class="fa fa-heart"></i>&nbsp;${prod.productVO.productThumb+1}</span>
	                  		</button>
	          			</c:otherwise>
		          	 </c:choose>  
		          	 
	                </h4>
	                <fmt:formatNumber value="${prod.productVO.productPrice}" pattern="###,###,###"/>원
                 	
                 	
                </div>
              </div>
            </c:forEach>
            </div>
            <div class="row">
              <div class="col-sm-12 text-center">
                <div class="pagination font-alt">
	                <c:if test="${pagingCreator.prev }">
	                	<li class='paginate_button'>
		                	<a href="1"><i class="fa fa-angle-left"></i></a>
		                </li>
		            </c:if>
		            <c:if test="${pagingCreator.prev }">
		            	<li class='paginate_button'>
		            		<a href="${pagingCreator.startPagingNum-1 }">이전</a>
		            	</li>
		            </c:if>
		            <c:forEach var="pageNum" begin="${pagingCreator.startPagingNum}" end="${pagingCreator.endPagingNum}">
						<%-- 선택된 숫자의 경우, Bootstrap의 active 클래스 이름 추가 --%>
						<li class='paginate_button ${pagingCreator.productPaging.pageNum == pageNum ? "active":"" }'>
							<a href="${pageNum}">${pageNum}</a>
						</li>
					</c:forEach>
					<c:if test="${pagingCreator.next }">
						<li class='paginate_button'>
		            		<a href="${pagingCreator.endPagingNum+1 }">다음</a>
		            	</li>
		            </c:if>
		            <c:if test="${pagingCreator.next }">
		            	<li class='paginate_button'>
		            		<a href="${pagingCreator.lastPageNum }"><i class="fa fa-angle-right"></i></a>
		            	</li>
		            </c:if>
                </div>
              </div>
            </div>
          </div>
        </section>
        
		
      </div>
      <div class="scroll-up"><a href="#totop"><i class="fa fa-angle-double-up"></i></a></div>
      <script>
      	var frmSendValue=$("#frmSendValue");
      	$("input[name='delflag']").val(0);
      	var loginUser= "";
    	
    	<sec:authorize access="isAuthenticated()">
    		loginUser='<sec:authentication property="principal.username"/>';
    	</sec:authorize>
    	
      	//좋아요 버튼 이벤트
    	$(".thumbNonActive").on("click", function(e){
     		if(loginUser==null || loginUser==""){
     			alert("로그인 후 이용바랍니다.");
    			return false;
    		} else {
    			var productId=$(this).val();
        		var btnThumbNonActive=$(this);
        		var btnThumbActive = $(this).siblings(".thumbActive");
        		
       			$.ajax({
             		url:'${contextPath}/product/plusThumb',
           			data:{productId : productId,
           				   mid : loginUser},
           			type:'get',
           			dataType:'json',
           			success:function(result, status){
           				btnThumbNonActive.attr("style", "display:none");
           				btnThumbActive.attr("style", "display:in-block");
           			}
             	});
    		}
    	});
      	
      	//좋아요 감소 버튼
    	$(".thumbActive").on("click", function(e){
    		if(loginUser==null || loginUser==""){
    			alert("로그인 후 이용바랍니다.");
    			return false;
    		} else {
    			var productId=$(this).val();
        		var btnThumbActive=$(this);
        		var btnThumbNonActive = $(this).siblings(".thumbNonActive");

       			$.ajax({
             			url:'${contextPath}/product/minusThumb',
           			data:{productId : productId,
           				  mid : loginUser },
           			type:'get',
           			dataType:'json',
           			success:function(result, status){
           				btnThumbActive.attr("style", "display:none");
           				btnThumbNonActive.attr("style", "display:in-block");
           				
           			}
             	});
    		}
    		
    	});
      	
    	
      	//페이징 코드
    	$(".paginate_button a").on("click", function(e){
    		e.preventDefault();
    		
    		frmSendValue.find("input[name='pageNum']").val($(this).attr("href"));
    		frmSendValue.attr("action", "${contextPath}/product/productList");
    		frmSendValue.attr("method", "get");
    		frmSendValue.submit();
    	});
      	
      	//정렬 버튼 이벤트
    	$(".selectSortTab").on("click", function(e){
            var selectSort=$(this).data("selecttab");
            
            if($(this).hasClass("on")){
            	selectSort="";
            	$(this).removeClass("on");
            }

            frmSendValue.find("input[name='sortBy']").val(selectSort);
            frmSendValue.find("input[name='pageNum']").val(1);
            frmSendValue.submit();
         });
    	
    	//피부타입 버튼 이벤트
    	$(".selectSkinType").on("click", function(e){
            var selectSkintype=$(this).data("skintype");
            
            frmSendValue.find("input[name='skintype']").val(selectSkintype);
            frmSendValue.find("input[name='pageNum']").val(1);
            frmSendValue.submit();
         });
      	
    	//카테고리 버튼 이벤트
    	$(".selectCategory").on("click", function(e){
            var selectCategory=$(this).children("button").data("category");
            
            frmSendValue.find("input[name='subCategory']").val("");
            frmSendValue.find("input[name='category']").val(selectCategory);
            frmSendValue.find("input[name='pageNum']").val(1);
            frmSendValue.submit();
         });
    	
    	//서브 카테고리 버튼 이벤트
    	$(".selectSubCategory").on("click", function(e){
            var subCategory=$(this).children("button").data("subcategory");
            
            frmSendValue.find("input[name='subCategory']").val(subCategory);
            frmSendValue.find("input[name='pageNum']").val(1);
            frmSendValue.submit();
         });
      	
      	//검색 엔터키 이벤트
     	$("#searchInput").keydown(function(key) {
    		if (key.keyCode == 13) {
    			if ((frmSendValue.find("input[name='keyword']").val()=="")) {
					alert("검색어를 입력하세요.");
   				 	return false;
   				}
       		
       		frmSendValue.find("input[name='pageNum']").val(1);
       		frmSendValue.submit();
    		}
      	});
      	
      	//검색 버튼 이벤트
      	$(".search-btn").on("click", function(e){
      		if ((frmSendValue.find("input[name='keyword']").val()=="")) {
      			alert("검색어를 입력하세요.");
				return false;
  			}
     
      		frmSendValue.find("input[name='pageNum']").val(1);
      		frmSendValue.submit();
      	});
      	
      //장바구니 담기
    	$(".addtocart").on("click", function(e){
      		e.preventDefault();
      		
      		if(loginUser==null || loginUser==""){
      			alert("로그인 후 이용바랍니다.");
      			return false;
      		}
      		
      		var productId=$(this).data("productid");
      		
      		$.ajax({
     			url:'${contextPath}/cart/inserttocart',
   				data:{productId : productId,
   					  mid : loginUser,
   					  cartAmount : 1},
   				type:'get',
   				dataType:'json',
   				success:function(result, status){
   					if(result==true){
   						alert("장바구니 담기 완료!");
   					} else {
   						alert("장바구니 담기 실패!");
   					}
   				}
	     	});
     	 });
      	
      	//조건필터 초기화
      	function allReset(){
      		frmSendValue.find("input[name='sortBy']").val("");
      		frmSendValue.find("input[name='skintype']").val("");
      		frmSendValue.find("input[name='keyword']").val("");
      		frmSendValue.find("input[name='category']").val("");
      		frmSendValue.find("input[name='subCategory']").val("");
      		frmSendValue.find("input[name='pageNum']").val(1);
      		frmSendValue.submit();
      	}
      	
      	 <%-- 상품상세 페이지 이동 --%>
         $(".proDetail").on("click", function(){
            var productid = $(this).data("productid");
            var thumbflag = $(this).siblings("button").attr("class");
            location.href = "${contextPath}/product/detail?productid=" + productid;
         });  
      	
      	$(document).ready(function(){
      		var params = new URLSearchParams(location.search);
      		var activeSort= params.get('sortBy');
      		var activeCategory= params.get('category');
      		var activeSubCategory= params.get('subCategory');
      		var activeSkinType= params.get('skintype');

   			switch(activeSort){
   				case "sortthumb" :
					$('.selectSortTab').eq(0).addClass("on");
					break;
   				case "sortprice" :
   					$('.selectSortTab').eq(1).addClass("on");
   					break;
   				case "sortlowprice" :
   					$('.selectSortTab').eq(2).addClass("on");
   					break;
   			}
   			
   			switch(activeSkinType){
				case "1" :
					$('.selectSkinType').eq(1).addClass("on");
					break;
				case "2" :
					$('.selectSkinType').eq(2).addClass("on");
					break;
				case "3" :
					$('.selectSkinType').eq(3).addClass("on");
					break;
				default :
					$('.selectSkinType').eq(0).addClass("on");
			}
   			
   			switch(activeCategory){
   				case "cleansing" :
   					$('.selectCategory').eq(1).addClass("on");
   					$("#SubCateCleansing").css("display", "inline-block");
   					break;
   				case "skin" :
   					$('.selectCategory').eq(2).addClass("on");
   					$("#SubCateSkin").css("display", "inline-block");
   					break;
   				case "hair" :
   					$('.selectCategory').eq(3).addClass("on");
   					$("#SubCateHair").css("display", "inline-block");
   					break;
   				case "body" :
   					$('.selectCategory').eq(4).addClass("on");
   					$("#SubCatebody").css("display", "inline-block");
   					break;
   				case "sun" :
   					$('.selectCategory').eq(5).addClass("on");
   					$("#SubCateSun").css("display", "inline-block");
   					break;
   				default :
   					$('.selectCategory').eq(0).addClass("on");
   			}
   			
   			switch(activeSubCategory){
				case "toner" :
					$('#SubCateSkin .selectSubCategory').eq(0).addClass("on");
					break;
				case "lotion" :
					$('#SubCateSkin .selectSubCategory').eq(1).addClass("on");
					break;
				case "serum" :
					$('#SubCateSkin .selectSubCategory').eq(2).addClass("on");
					break;
				case "cream" :
					$('#SubCateSkin .selectSubCategory').eq(3).addClass("on");
					break;
				case "cleansingform" :
					$('#SubCateCleansing .selectSubCategory').eq(0).addClass("on");
					break;
				case "cleansinggel" :
					$('#SubCateCleansing .selectSubCategory').eq(1).addClass("on");
					break;
				case "cleansingwater" :
					$('#SubCateCleansing .selectSubCategory').eq(2).addClass("on");
					break;
				case "cleansingoil" :
					$('#SubCateCleansing .selectSubCategory').eq(3).addClass("on");
					break;
				case "cleansingtissue" :
					$('#SubCateCleansing .selectSubCategory').eq(4).addClass("on");
					break;
				case "shampoo" :
					$('#SubCateHair .selectSubCategory').eq(0).addClass("on");
					break;
				case "rinse" :
					$('#SubCateHair .selectSubCategory').eq(1).addClass("on");
					break;
				case "hairessence" :
					$('#SubCateHair .selectSubCategory').eq(2).addClass("on");
					break;
				case "bodywash" :
					$('#SubCatebody .selectSubCategory').eq(0).addClass("on");
					break;
				case "bodylotion" :
					$('#SubCatebody .selectSubCategory').eq(1).addClass("on");
					break;
				case "bodyoil" :
					$('#SubCatebody .selectSubCategory').eq(2).addClass("on");
					break;
				case "handcream" :
					$('#SubCatebody .selectSubCategory').eq(3).addClass("on");
					break;
				case "suncream" :
					$('#SubCateSun .selectSubCategory').eq(0).addClass("on");
					break;
				case "sunstick" :
					$('#SubCateSun .selectSubCategory').eq(1).addClass("on");
					break;
			}
     		 
   			var thumbnailFilePath;
   			
   			$("input[name='productImage']").each(function(i) {
   				thumbnailFilePath=encodeURIComponent($(this).val());
   					
   	     		$("img").eq(i).attr("src", "${contextPath}/displayThumbnailFile?fileName=" + thumbnailFilePath);
   			});
      	});

      </script>
<%@ include file="../include/myfooter.jsp" %>
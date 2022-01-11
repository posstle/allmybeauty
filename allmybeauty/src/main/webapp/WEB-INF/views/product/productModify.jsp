<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/myheader.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
		th {text-align: center;}
	</style>
</head>
<body>
  		<div class="aside col-sm-2 col-md-2" id="aside">
              <div class="widget">
                  <h5 class="widget-title font-alt">관리자메뉴</h5>
                  <ul class="icon-list">
                       	<li><a href="${contextPath }/admin/main">메인페이지</a></li>
	                  	<li><a href="${contextPath }/product/addproduct">상품등록</a></li>
	                  	<li><a href="${contextPath }/product/productListForAdmin">상품리스트</a></li>
	                  	<li><a href="${contextPath }/admin/adminmemberlist">회원관리</a></li>
	                  	<li><a href="${contextPath }/QnABoard/adminNotice">고객센터관리</a></li>
                	</ul>
             </div>
        </div> 
             <div class="row" style="padding-top: 100px;">
             <table border="1" style="width:80%; text-align: center;">
		        <tr>
		            <th>상품ID번호</th>
		            <th>상품이미지</th>
		            <th>상품명</th>
		            <th>가격(단위 : 원)</th>
		            <th>카테고리</th>
		            <th>하위 카테고리</th>
		            <th>브랜드</th>
		            <th>재고</th>
		            <th>피부타입</th>
		        </tr>
          			<c:forEach items="${productList }" var="prod">
          				<tr class="listForAdmin">
				            <td class="productIdForShow">
				                ${prod.productVO.productId }
				            </td>
				            <td class="productImageForShow">
				                <input type="hidden" name="productImage" value="${prod.attachfilesVO.repoPath }/${prod.attachfilesVO.uploadpath }/${prod.attachfilesVO.uuid }_${prod.attachfilesVO.filename }"/>
				                <img src="" alt="No Image" width="120ox" height="110px">
				            </td>
				            <td class="productNameForShow">
				                ${prod.productVO.productName}
				            </td>
				            <td class="productPriceForShow">
				                <fmt:formatNumber value="${prod.productVO.productPrice}" pattern="###,###,###"/>
				            </td>
				            <td class="productCategoryForShow">
				                ${prod.productVO.productCategory}
				            </td>
				            <td class="productSubCategoryForShow">
				                ${prod.productVO.productSubCategory}
				            </td>
				            <td class="productBrandForShow">
				                ${prod.productVO.productBrand}
				            </td>
				            <td class="productStockForShow">
				                ${prod.productVO.productStock}
				            </td>
				            <td class="skintypeidForShow">
				            	<c:choose>
				            		<c:when test="${prod.productVO.skintypeid == 1}">지성</c:when>
				            		<c:when test="${prod.productVO.skintypeid == 2}">건성</c:when>
				            		<c:when test="${prod.productVO.skintypeid == 3}">복합성</c:when>
				            	</c:choose>
				            </td>
				        </tr>
           			</c:forEach>
            	</table>
            	
            	<!-- Modal -->
               <div class="modal fade" id="yourModal" tabindex="-1" role="dialog" aria-labelledby="yourModalLabel" aria-hidden="true">
                   <div class="modal-dialog">
                       <div class="modal-content">
                           <div class="modal-header">
                               <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                               상품 수정
                           </div>
                           <div class="modal-body">
                              <input type="hidden" value="" name="productId" readonly/>
                              상품 이름 <input type="text" value="" name="productName"/>&nbsp;
                              상품 가격 <input type="text" value="" name="productPrice"/><br>
                              브랜드 <input type="text" value="" name="productBrand"/><br>
                              재고 <input type="text" value="" name="productStock"/><br>
                              <br> 카테고리 <br>
                              <select class="form-control" id="category" name="productCategory" onchange="selectCategory()">
				              	 <option value="body">바디케어</option>
				              	 <option value="skin">스킨케어</option>
				              	 <option value="cleansing">클렌징</option>
				              	 <option value="hair">헤어케어</option>
				              	 <option value="sun">선케어</option>
			                 </select> 
			                 <br>서브 카테고리 <br>
			                   <select class="form-control subcategory" id="catebody" name="productSubCategory"> 
			                       <option value="bodywash">바디워시</option> 
			                       <option value="bodylotion">바디로션</option> 
			                       <option value="bodyoil">바디오일</option>
			                       <option value="handcream">핸드크림/풋크림</option>
		                       </select>
		                       <select class="form-control subcategory" id="cateskin" name="productSubCategory" style="display:none"> 
			                       <option value="toner">스킨/토너</option> 
			                       <option value="lotion">로션/에멀전</option> 
			                       <option value="serum">에센스/앰플/세럼</option>
			                       <option value="cream">크림</option>
		                       </select>
		                       <select class="form-control subcategory" id="catecleansing" name="productSubCategory" style="display:none"> 
			                       <option value="cleansingform">클렌징폼</option> 
			                       <option value="cleansinggel">클렌징젤</option> 
			                       <option value="cleansingwater">클렌징워터</option>
			                       <option value="cleansingoil">클렌징오일</option>
			                       <option value="cleansingtissue">클렌징티슈</option>
		                       </select>
		                       <select class="form-control subcategory" id="catehair" name="productSubCategory" style="display:none"> 
			                       <option value="shampoo">샴푸</option> 
			                       <option value="rinse">트리트먼트/린스</option> 
			                       <option value="hairessence">헤어에센스</option>
		                       </select>
		                       <select class="form-control subcategory" id="catesun" name="productSubCategory" style="display:none"> 
			                       <option value="suncream">선크림</option> 
			                       <option value="sunstick">선스틱</option> 
		                       </select>
		                       <br>
		                       피부타입 <br>
		                       	<select class="form-control" id="skintypeid" name="skintypeid">
				              	 	<option value="1">지성</option>
				              	 	<option value="2">건성</option>
				              	 	<option value="3">복합성</option>
			                 	</select> 
                           </div>
                           <div class="modal-footer">
                               <button type="button" class="btn btn-default" data-dismiss="modal">계속 쇼핑하기</button>
                               <button type="button" class="btn btn-default" onclick="${contextPath }/cart/cartlist'+${memberVO.mid }'">장바구니 확인하기</button>
                           </div>
                       </div>
                       <!-- /.modal-content -->
                   </div>
                   <!-- /.modal-dialog -->
               </div>
               <!-- /.modal -->
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
            <form id="frmSendValue">
            	<input type="hidden" name="pageNum" value="${pagingCreator.productPaging.pageNum }"/>
	            <input type="hidden" name="rowAmountPerPage" value="${pagingCreator.productPaging.rowAmountPerPage }"/>
	            <input type="hidden" name="lastPageNum" value="${pagingCreator.lastPageNum }"/>
				<input type="hidden" name="skintype" value="${pagingCreator.productPaging.skintype }"/>
	            <input type="hidden" name="sortBy" value="${pagingCreator.productPaging.sortBy }"/>
	            <input type="hidden" name="category" value="${pagingCreator.productPaging.category }"/>
	            <input type="hidden" name="subCategory" value="${pagingCreator.productPaging.subCategory }"/>
            </form>
            
<script>
	var frmSendValue=$("#frmSendValue");
	var ImageID;
	var category=$("#category option:selected").val();
	var subCategory=$("#catebody");
	/* var InputFileCloneForList=$(".uploadDivForList").clone();
	var InputFileCloneForDesc=$(".uploadDivForDesc").clone(); */
	
	
	//이미지 불러오는 코드
	$("input[name='productImage']").each(function(i) {
		thumbnailFilePath=encodeURIComponent($(this).val());
			
		console.log(thumbnailFilePath);
		$("img").eq(i).attr("src", "${contextPath}/displayThumbnailFile?fileName=" + thumbnailFilePath);
	});
	
	//상품 수정 코드
	$(".listForAdmin").on("click", function(e){
		
		$("input[name='productId']").val($(this).children(".productIdForShow").text().trim());
		$("input[name='productName']").val($(this).children(".productNameForShow").text().trim());
		$("input[name='productPrice']").val($(this).children(".productPriceForShow").text().trim().split(',').join(""));
		$("input[name='productBrand']").val($(this).children(".productBrandForShow").text().trim());
		$("input[name='productStock']").val($(this).children(".productStockForShow").text().trim());
		
		console.log($(this).children(".productNameForShow").text());
		
		$("#yourModal").modal("show");
		
	});
	
	
	//카테고리 선택 이벤트
	function selectCategory(){
    	category=$("#category option:selected").val();

    	switch(category){
    		case "skin":
    			$(".subcategory").css("display", "none");
    			$("#cateskin").css("display", "block");
    			subCategory=$("#cateskin");
    			break;
    		case "cleansing":
    			$(".subcategory").css("display", "none");
    			$("#catecleansing").css("display", "block");
    			subCategory=$("#catecleansing");
    			break;
    		case "hair":
    			$(".subcategory").css("display", "none");
    			$("#catehair").css("display", "block");
    			subCategory=$("#catehair");
    			break;
    		case "sun":
    			$(".subcategory").css("display", "none");
    			$("#catesun").css("display", "block");
    			subCategory=$("#catesun");
    			break;
    		default:
    			$(".subcategory").css("display", "none");
    			$("#catebody").css("display", "block");
    			subCategory=$("#catebody");
    			break;
    	}
    }
	
	
</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>     

<%@ include file="../include/myheader.jsp"%>
<style>    
        
            /* Default */
            input[type=text],input[type=password]{font-family:"Malgun Gothic","맑은 고딕",Dotum,"돋움",Arial,sans-serif}
            *{margin:0;padding:0;font-family:"Malgun Gothic","맑은 고딕",Dotum,"돋움",Arial,sans-serif}
            body{font-size:12px;color:#555;background:transparent;-webkit-user-select:none;-moz-user-select:none;-webkit-text-size-adjust:none;-moz-text-size-adjust:none;-ms-text-size-adjust:none}
            ol,ul{list-style:none} 
            table{table-layout:fixed;width:100%;border-collapse:collapse;border-spacing:0}
            caption{overflow:hidden;width:0;height:0;font-size:0;line-height:0;text-indent:-999em}
            img,fieldset{border:0}
            legend{height:0;visibility:hidden}
            em,address{font-style:normal}
            img{border:0 none;vertical-align:middle}
            a{color:#555;text-decoration:none}
            input,select{margin:0;padding:0;vertical-align:middle}
            button{margin:0;padding:0;font-family:inherit;border:0 none;background:transparent;cursor:pointer}
            button::-moz-focus-inner{border:0;padding:0}
            header,footer,aside,nav,section,article{display:block}

            .clearfix{*zoom:1}
            .clearfix:after{content:"";display:block;clear:both;overflow:hidden}

            /* Search */
            .searchBox{border:none}
            .searchBox tbody th{padding:20px 10px 20px 35px;font-size:14px;font-weight:bold;text-align:left;vertical-align:top;border:none;background:#e6e6e6 }
            .searchBox tbody td{padding:12px 10px 12px 25px;border:none;background-color:#efefef}
        
            .searchDate{overflow:hidden;margin-bottom:10px;*zoom:1}
            .searchDate:after{display:block;clear:both;content:''}
            .searchDate li{position:relative;float:left;margin:0 7px 0 0}
            .searchDate li .chkbox2{display:block;text-align:center}
            .searchDate li .chkbox2 input{position:absolute;z-index:-1}
            .searchDate li .chkbox2 label{display:block;width:72px;height:26px;font-size:14px;font-weight:bold;color:#fff;text-align:center;line-height:25px;text-decoration:none;cursor:pointer;background:#a5b0b6}
            .searchDate li .chkbox2.on label{background:#ec6a6a}
        
            .demi{display:inline-block;margin:0 1px;vertical-align:middle}
            .inpType{padding-left:6px;height:24px;line-height:24px;border:1px solid #dbdbdb}
            .btncalendar{display:inline-block;width:22px;height:22px;text-indent:-999em}


        </style>
<section class="module">
	<div class="container">
		<form id="frmSend">      
        <!-- search -->
        <table class="searchBox">
            <caption>조회</caption>
            <colgroup>
                <col width="123px">
                <col width="*">
            </colgroup>
            <tbody>
                <tr>
                    <th>조회기간</th>
                    <td>
                        <ul class="searchDate">
                            <li>
                                <span class="chkbox2">
                                    <input type="radio" name="dateType" id="dateType1" onclick="setSearchDate('0d')"/>
                                    <label for="dateType1">당일</label>
                                </span>
                            </li>
                            <li>
                                <span class="chkbox2">
                                    <input type="radio" name="dateType" id="dateType2" onclick="setSearchDate('3d')"/>
                                    <label for="dateType2">3일</label>
                                </span>
                            </li>
                            <li>
                                <span class="chkbox2">
                                    <input type="radio" name="dateType" id="dateType3" onclick="setSearchDate('1w')"/>
                                    <label for="dateType3">1주</label>
                                </span>
                            </li>
                            <li>
                                <span class="chkbox2">
                                    <input type="radio" name="dateType" id="dateType4" onclick="setSearchDate('2w')"/>
                                    <label for="dateType4">2주</label>
                                </span>
                            </li>
                            <li>
                                <span class="chkbox2">
                                    <input type="radio" name="dateType" id="dateType5" onclick="setSearchDate('1m')"/>
                                    <label for="dateType5">1개월</label>
                                </span>
                            </li>
                            <li>
                                <span class="chkbox2">
                                    <input type="radio" name="dateType" id="dateType6" onclick="setSearchDate('3m')"/>
                                    <label for="dateType6">3개월</label>
                                </span>
                            </li>
                            <li>
                                <span class="chkbox2">
                                    <input type="radio" name="dateType" id="dateType7" onclick="setSearchDate('6m')"/>
                                    <label for="dateType7">6개월</label>
                                </span>
                            </li>                           
                        </ul>
                        <div>
                        	<span class="chkbox2">
                                    <input type="radio" name="orderDateType" id="day" value="day"/>
                                    <label>일별</label>
                            </span>
                            <span class="chkbox2">
                                    <input type="radio" name="orderDateType" id="month" value="month"/>
                                    <label>월별</label>
                            </span>
                            <span class="chkbox2">
                                    <input type="radio" name="orderDateType" id="year" value="year"/>
                                    <label>년별</label>
                            </span>      
                        </div>
                        <div class="clearfix">
                            <!-- 시작일 -->
                            <span class="dset">
                                <input type="text" class="datepicker inpType" name="searchStartDate" id="searchStartDate" >
                                <a href="#none" class="btncalendar dateclick">달력</a>
                            </span>
                            <span class="demi">~</span>
                            <!-- 종료일 -->
                            <span class="dset">
                                <input type="text" class="datepicker inpType" name="searchEndDate" id="searchEndDate" >
                                <a href="#none" class="btncalendar dateclick">달력</a>
                            </span>
                            <span>
                            	<button type="button" class="btn btn-b btn-round" onclick="search()">검색</button>
                            </span>
                        </div>    
                    </td>
                </tr>
            <tbody>
        </table>
        </form>
        <div class="col-sm-12"> 
                <table class="table table-striped table-border checkout-table">
                  <tbody>
					<tr>
                      <th style="text-align: center">주문날짜</th>
                      <th style="text-align: center">매출</th>
                      <th style="text-align: center" width="140">주문수</th>
                    </tr>
                  </tbody>  
                  <tbody>
                  	<c:choose>
                  	<c:when test="${day != null}">
                    <c:forEach items="${day}" var="day">                                              
                    <tr class="day" style="text-align: center">                 
                      <td class="hidden-xs" style="vertical-align: middle;">                  	
                      	<h5 class="product-title font-alt"><fmt:formatDate value="${day.orderDay}" pattern="yyyy-MM-dd"/></h5>
                      </td>
                      <td style="text-align: center">
                      	<h5 class="product-title font-alt">￦<fmt:formatNumber value="${day.sales}"/></h5>
                      </td>
                      <td class="hidden-xs" id="productPrice" style="vertical-align: middle;">
                        <h5 class="product-title font-alt"><fmt:formatNumber value="${day.orderAmount}"/></h5>
                      </td>                                                            
                    </tr>                 
                    </c:forEach> 
                    </c:when>
                    
                    <c:when test="${month != null}">
                    <c:forEach items="${month}" var="month">                                              
                    <tr class="day" style="text-align: center">                 
                      <td class="hidden-xs" style="vertical-align: middle;">                  	
                      	<h5 class="product-title font-alt">${month.orderMonth}</h5>
                      </td>
                      <td style="text-align: center">
                      	<h5 class="product-title font-alt">￦<fmt:formatNumber value="${month.sales}"/></h5>
                      </td>
                      <td class="hidden-xs" id="productPrice" style="vertical-align: middle;">
                        <h5 class="product-title font-alt"><fmt:formatNumber value="${month.orderAmount}"/></h5>
                      </td>                                                            
                    </tr>                 
                    </c:forEach> 
                    </c:when>
                    
                    <c:when test="${year != null}">
                    <c:forEach items="${year}" var="year">                                              
                    <tr class="day" style="text-align: center">                 
                      <td class="hidden-xs" style="vertical-align: middle;">                  	
                      	<h5 class="product-title font-alt">${year.orderYear}</h5>
                      </td>
                      <td style="text-align: center">
                      	<h5 class="product-title font-alt">￦<fmt:formatNumber value="${year.sales}"/></h5>
                      </td>
                      <td class="hidden-xs" id="productPrice" style="vertical-align: middle;">
                        <h5 class="product-title font-alt"><fmt:formatNumber value="${year.orderAmount}"/></h5>
                      </td>                                                            
                    </tr>                 
                    </c:forEach> 
                    </c:when>
                    	
					<c:when test="${daySize==null}">
					<tr class="day" style="text-align: center">                 
                      	<td colspan="3" class="hidden-xs" style="vertical-align: middle;">                  	
                      		<h5 class="product-title font-alt">조회된 내용이 없습니다.</h5>
                     	</td>                                  
                    </tr>
                    </c:when>          
					</c:choose>				
                  </tbody>
                </table>
<%-- Pagination 시작 --%>
<c:if test="${paging.endPagingNum!=null||paging.endPagingNum > 0}">                
<div class='pull-right'>
	<ul class="pagination pagination-sm">
		<c:if test="${paging.prev}">
			<li class="paginate_button previous">
				<a href="1">&laquo;</a><%-- 맨 앞으로 페이지로 이동 --%>
			</li>
		</c:if>
		<c:if test="${paging.prev}">
			<li class="paginate_button previous">
				<a href="${paging.startPagingNum - 1}">이전</a>
			</li>
		</c:if>
		<c:forEach var="pageNum" begin="${paging.startPagingNum}" end="${paging.endPagingNum}">
			<li class='paginate_button ${paging.salesPagingDTO.pageNum == pageNum ? "active":"" }'>
				<a href="${pageNum}">${pageNum}</a>
			</li>
		</c:forEach>
		<c:if test="${paging.next}">
			<li class="paginate_button next">
				<a href="${paging.endPagingNum +1}">다음</a>
			</li>
		</c:if>
		<c:if test="${paging.next}">
			<li class="paginate_button next">
				<a href="${paging.lastPageNum}">&raquo;</a>
			</li>
		</c:if>
	</ul>
</div><%-- Pagination 끝 --%>
</c:if>
          </div>
	</div>	
</section>
<form id="frmSendValue">
	<input type='hidden' name='pageNum' value='${paging.salesPagingDTO.pageNum}'>
	<input type='hidden' name='rowAmountPerPage' value='${paging.salesPagingDTO.rowAmountPerPage}'>
	<input type='hidden' name='lastPageNum' value='${paging.lastPageNum}'>
	<input type='hidden' name='searchStartDate' value='${searchStartDate}'>
	<input type='hidden' name='searchEndDate' value='${searchEndDate}'>
	<input type='hidden' name='orderDateType' value='${orderDateType}'>
</form>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">	        
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script type="text/javascript">
var frmSendValue = $("#frmSendValue");

$(".paginate_button a").on( "click", function(e) {
	e.preventDefault();

	frmSendValue.find("input[name='pageNum']").val($(this).attr("href"));
	frmSendValue.attr("action", "${contextPath}/sales/salesList");
	frmSendValue.attr("method", "get");
	frmSendValue.submit();
});



$(document).ready(function() {
         
    $(".datepicker").datepicker({
        showButtonPanel: true,
        dateFormat: "yy-mm-dd",
        onClose : function ( selectedDate ) {
        
            var eleId = $(this).attr("id");
            var optionName = "";

            if(eleId.indexOf("StartDate") > 0) {
                eleId = eleId.replace("StartDate", "EndDate");
                optionName = "minDate";
            } else {
                eleId = eleId.replace("EndDate", "StartDate");
                optionName = "maxDate";
            }

            $("#"+eleId).datepicker( "option", optionName, selectedDate );        
            $(".searchDate").find(".chkbox2").removeClass("on"); 
        }
    }); 

    $(".dateclick").dateclick();
    $(".searchDate").schDate();
    
});


jQuery.fn.schDate = function(){
    var $obj = $(this);
    var $chk = $obj.find("input[type=radio]");
    $chk.click(function(){                
        $('input:not(:checked)').parent(".chkbox2").removeClass("on");
        $('input:checked').parent(".chkbox2").addClass("on");                    
    });
};

jQuery.fn.dateclick = function(){
    var $obj = $(this);
    $obj.click(function(){
        $(this).parent().find("input").focus();
    });
}    


function setSearchDate(start){

    var num = start.substring(0,1);
    var str = start.substring(1,2);

    var today = new Date();

    //var year = today.getFullYear();
    //var month = today.getMonth() + 1;
    //var day = today.getDate();
    
    var endDate = $.datepicker.formatDate('yy-mm-dd', today);
    $('#searchEndDate').val(endDate);
    
    if(str == 'd'){
        today.setDate(today.getDate() - num);
    }else if (str == 'w'){
        today.setDate(today.getDate() - (num*7));
    }else if (str == 'm'){
        today.setMonth(today.getMonth() - num);
        today.setDate(today.getDate() + 1);
    }

    var startDate = $.datepicker.formatDate('yy-mm-dd', today);
    $('#searchStartDate').val(startDate);
            
    // 종료일은 시작일 이전 날짜 선택하지 못하도록 비활성화
    $("#searchEndDate").datepicker("option", "minDate", startDate);
    
    // 시작일은 종료일 이후 날짜 선택하지 못하도록 비활성화
    $("#searchStartDate").datepicker("option", "maxDate", endDate);

}

var frmSend = $("#frmSend");

function search(){	
	startDate = $("#searchStartDate").val();
	endDate = $("#searchEndDate").val();
	check = $('input:radio[name="orderDateType"]').is(":checked");

	if (startDate == "" || endDate == ""){
		alert("날짜를 입력하세요.");
		return;
	}else if(!check){
		alert("검색 타입을 선택하세요.");
		return;
	}
	
  	frmSend.attr("action", "${contextPath}/sales/salesList");
	frmSend.attr("method", "get");
	frmSend.submit();
}


</script>        
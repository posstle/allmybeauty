<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ include file="../include/myheader.jsp" %>
<c:set var = "contextPath" value="${pageContext.request.contextPath }"/>

<c:set var = "mid" value="${principal.username}"/>


<!DOCTYPE html>
<html lang="ko" dir="ltr">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">



    <!-- Q&A CSS -->
    <%-- <link href="${contextPath }/resources/css/detail.css" rel="stylesheet"> --%>
    <link id="color-scheme" href="${contextPath }/resources/css/qboard.css" rel="stylesheet">
    <link id="color-scheme" href="${contextPath }/resources/css/form.css" rel="stylesheet">
    <link id="color-scheme" href="${contextPath }/resources/css/correction.css" rel="stylesheet">
    <link id="color-scheme" href="${contextPath }/resources/css/main.css" rel="stylesheet">
    <link id="color-scheme" href="${contextPath }/resources/css/review.css" rel="stylesheet">
    
    
  </head>
  <body data-spy="scroll" data-target=".onpage-navigation" data-offset="60">	
    <main>
      <div class="page-loader">
        <div class="loader">Loading...</div>
      </div>
    
      <div class="main">
        <section class="module">
          <div class="container">
            <div class="row">
            <c:forEach var="selectImg" items="${selectImg}">
            	<input type='hidden' name='ImageList' value="${selectImg.repoPath }/${selectImg.uploadpath}/${selectImg.uuid}_${selectImg.filename}"/>
            <c:if test = "${fn:contains(selectImg, 'ImageForList')}">
            	<div class="col-sm-6 mb-sm-40"><img id="ImageForList" src="" alt="Single Product Image"/>
             </c:if>
              </c:forEach>
              
              </div>
              <div class="col-sm-5">
                <div class="row">
                  <div class="col-sm-12">
                    <h1 class="product-title font-alt">${component.productname } </h1>
                    
                  </div>
                </div>
                <div class="row mb-20">
                  <div class="col-sm-12">
                    <div class="price font-alt"><span class="amount">${component.productprice }원</span></div>
                  </div>
                </div>
                <div class="prd_more_info">

                  <div class="proDe">
                    <p class="tit">배송정보</p>
    
                    <ul class="bl_list">
                    <li style="list-style: none;">
                      <span>일반배송</span>
                      <div> 2,500원 ( 20,000 원 이상 무료배송 )
                         <br><em>AllMyBeauty 배송 </em>
                         <em>평균 3일 이내 배송</em>
                      </div>
                    </li>
                    </ul>
                  </div>

                  <div class="proDe">
                    <p class="tit">결제혜택</p>
                    <div class="txt_list">
                        <p>THE CJ 카드 추가 10%할인 <a href="javascript:goods.detail.openCardFullPop();" class="ico_info">카드혜택가 안내 레이어 열기</a></p>

          <!-- 									<li> -->					
                            <p>
                              CJ ONE 포인트 <span class=""></span> 
                              최대  2% 적립 예상  
                              <a href="javascript:goods.detail.openCjonepntPop();" class="ico_info">CJ ONE 포인트 예상적립 레이어 열기</a>
                            </p>
                        
          <!-- 									</li> -->
                            
                      
    <!-- 									<p>THE CJ 카드 추가 10%할인 <a href="javascript:goods.detail.openCardFullPop();" class="ico_info">카드혜택안내 레이어열기</a></p> -->
    <!-- 									<p>CJ ONE 포인트 2% 예상 적립</p> -->
    
                      <!-- 등급별 노출 -->
                      <!-- <p>CJ ONE 포인트 <span class="color-1">GOLD OLIVE</span> 2.0% 적립 예상 <a href="me" class="ico_info">등급혜택 레이어 열기</a></p>
                                        <p>CJ ONE 포인트 <span class="color-2">BLACK OLIVE</span> 2.0% 적립 예상  <a href="me" class="ico_info">등급혜택 레이어 열기</a></p>
                                        <p>CJ ONE 포인트 <span class="color-3">GREEN OLIVE</span> 1.5% 적립 예상  <a href="me" class="ico_info">등급혜택 레이어 열기</a></p>
                                        <p>CJ ONE 포인트 <span class="color-4">BABY OLIVE</span> 1% 적립 예상  <a href="me" class="ico_info">등급혜택 레이어 열기</a></p>-->
                    </div>
                  </div>
                  
    
                </div>  
                
                <!-- <div class="row mb-20">
                  <div class="col-sm-12">
                    <div class="description">
                      <p>The European languages are members of the same family. Their separate existence is a myth. For science, music, sport, etc, Europe uses the same vocabulary. The languages only differ in their grammar, their pronunciation and their most common words.</p>
                    </div>
                  </div>
                </div> -->
				<input type='hidden' id='myId' value='${mid }'/>
                <div class="ordin">
                	<span>구매수량</span>
                  <div class="option">
              		<input type="button" onclick="count('minus')" value="-"/>
                    <input id="procount" type="text" name="" value="1" required="required" readonly="readonly"/>
                    <input type="button" onclick="count('plus')" value=&#43;>
                  </div>
                </div>
						
				<div class="prd_total_price">
					<span class="txt_total_price">상품금액 합계</span>
					<!-- 증가 감소 구현 가격 -->
					<input type='hidden' id = 'productStock' value='${component.productstock }'/>
					<input type='hidden' class="noprice" value="${component.productprice }">
					<span class="tx_cont">
					<span class="total_price"><fmt:formatNumber value="${component.productprice}" pattern="###,###,###"/></span>
					원
					</span>
				</div>
				
				<form id="frmBuy" action="${contextPath }/order/order">
					<input type = 'hidden' name='productId' value='${component.productid }'/>
					<input type = 'hidden' id='amount' name='cartAmount' value='1'/>
					<input type = 'hidden' name='productPrice' value='${component.productprice }'/>
					<input type = 'hidden' name='mid' value='${mid }'/>
					<sec:csrfInput />
				</form>
				
				<div class="btn_bas_buy">
	                <div class="shp_bas">
	                	<button class="btn_bas" data-productid="${component.productid }" onclick="Btncart()">장바구니</button>
	                	<button type="button" class="btn_buy" data-productid="${component.productid }" onclick="Btnorder()">바로구매</button>
	                	

	                	<button class="nthumb" style="background-image: url(${contextPath }/resources/images/ico_zzim_new.png)"></button>
	                	<button class="ythumb" style="background-image: url(${contextPath }/resources/images/ico_zzim_on_new.png)"></button>

	                </div>
				</div>
				
                <div class="row mb-20">
                  <div class="col-sm-12">
                    <div class="product_meta">Categories:${component.productcategory }
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="row mt-70">
              <div class="col-sm-12">
                <ul class="nav nav-tabs font-alt" role="tablist">
                  <li class="active"><a href="#description" data-toggle="tab"><span></span>상품정보</a></li>
                  <!-- <li><a href="#data-sheet" data-toggle="tab"><span class="icon-tools-2"></span></a></li> -->
                  <li id = "review"><a class = "reviewTotal" href="#reviews" data-toggle="tab"><span>리뷰(0)</span></a></li>
                  <%-- <li id = "review"><a class = "reviewTotal" href="#reviews" data-toggle="tab"><span class="icon-tools-2"></span>리뷰 총 개수 값</a></li> --%>
                  <li id="qboardPage"><a href="#data-sheet" data-toggle="tab"><span></span>Q&amp;A(${qboardPaging.rowAmountTotal })</a></li>
                </ul>
                <div class="tab-content">
                  <div class="tab-pane active" id="description">
                   <table class="table table-striped ds-table table-responsive">
                      <tbody>
                       <%--  <tr>
                          <th>Title</th>
                          <th>${component.comname }</th>
                        </tr> --%>
                        <tr>
                          <td>상품성분</td>
                        </tr>
                        <tr>
                        	<td>${component.comname }</td>
                        </tr>
                        <tr >
	                        <td style="text-align: center;">
	            				<img id="ImageForDesc" src="" alt="Single Product Image"/>
	            			</td>
	            		</tr>
                      </tbody>
                    </table>
                </div>
                
                <!-- 후기 -->
                <div class="tab-pane" id="reviews">
                   <div class="comment-form mt-20">
                      <h4 class="comment-form-title font-alt">
                      		<button type="button" id="RegRev" data-mid= '${mid }'>리뷰 작성</button>
                      </h4>
                      
                      
        		<!-- 리뷰 모달 -->
        <div class="modalr hidden">
       		<div class="modal__overlay"></div>
        		<div class="modal-header"></div>
        
        	<!-- <form id="frmreview" class="modal__content" name="frmreview" method="post"> -->
            	<div class="modal__content">
            	<input type="hidden" name="productid"  id="gdasSeq" value='${component.productid}'>
            	<input type="hidden" name="mid" value="${mid }" class="reviewmid">
            	<h1 class="ptit">리뷰 작성</h1>
    
            <div class="reviews-write">
                <textarea cols="5" rows="1" name="rcontent" onkeyup="revcounters();" id="rcontentreg" name="gdasCont" placeholder="문의 내용을 입력해주세요(200자이내)"></textarea>
                    <p>
                        <span id="revqconter">0</span>자/500자
                    </p>
                    <div class="form-group panelFileBody">
                        <div class="form-group">
							<form method="post" enctype="multipart/form-data" class="uploadDiv">
										<!-- <input id="inputFilefi" type="file" name="files" multiple="multiple" style="margin-left: 50px;"> -->
								<label class="inputFileButton" for="input-file">
									 업로드
								</label>
								<input type="file" id="input-file" style="display:none" multiple="multiple"/>
							</form>
												
							  <form id="fileform">
							  
							  </form>								
									<!-- <button id = "btnFileUpload">File Upload With Ajax</button> -->
						</div>
					</div>
					
					<div class="form-group fileUploadResult">
						<ul class="imgsh">
							<!-- 업로드 후 처리결과가 표시될 영역 -->
						</ul>
			  		</div>
              </div> 
              
              	
            	
            <div class="btnGroup">
                <button id="CancleRv" type="button"  class="btnGray">취소</button>
                <button id="BReview"  type="button" onclick="BtnRev()" class="btnGreen">등록</button>
            </div>
            
            <div class="usage-guide">
                	<h2 class="stit">이용안내</h2>
                <ul>
                	<li>재판매글, 상업성 홍보글, 미풍양속을 해치는 글 등 상품리뷰 취지에 어긋나는 글은 삭제될 수 있습니다</li>
                </ul>
            </div>
       	 	<!-- </form> -->
       	 	</div>
    		</div><!-- 모달 끝 -->
    		
    		
   		<!-- 리뷰 수정 모달 -->
        <div class="modalc hidden">
       		<div class="modal__overlay"></div>
        		<div class="modal-header"></div>
        
        	<!-- <form id="frmreviewcor" class="modal__content" name="frmreviewcor" method="post"> -->
        	<div class="modal__content">
            	<input type="hidden" name="productid"  id="reviewMdPro" value='${component.productid}'>
            	<input type="hidden" name="mid" id="reviewMdMid" value="${mid }" class="reviewmid">
            	<input type="hidden" name="rno" id="reviewMdRno" value="" id="revrno"/>
            	<h1 class="ptit">리뷰 수정</h1>
    
            <div class="reviews-write">
                <textarea cols="5" rows="1" name="rcontentc" onkeyup="revcounter();" id="rcontentcor" name="gdasCont" ></textarea>
                    <p>
                        <span id="revqconters">0</span>자/500자
                    </p>
                    <div class="panelFileBodys">
                    <div class="form-group">
                    	<form method="post" enctype="multipart/form-data" class="uploadDiv">
							<label class="inputFileButton" for="input-files">
							  업로드
							</label>
							<input type="file" id="input-files" style="display:none" multiple="multiple"/>
						</form>
						<form id="fileform">
							  
						</form>
						<!-- <button id = "btnFileUpload">File Upload With Ajax</button> -->
					 </div>
            </div>
            	<div class="form-group fileUploadResults">
					<ul class="imgsh">
						<!-- <li class="imgshli" style="list-style:none">
						</li> -->
					</ul>
				</div>	 
            </div>
            <div class="btnGroup">
                <button id="CancleRvC" type="button"  class="btnGray">취소</button>
                <button id="BReviewC"  type="button" onclick="BtnRevC()" class="btnGreen">수정</button>
            </div>
            
            <div class="usage-guide">
                	<h2 class="stit">이용안내</h2>
                <ul>
                	<li>재판매글, 상업성 홍보글, 미풍양속을 해치는 글 등 상품리뷰의 취지에 어긋나는 글은 삭제될 수 있습니다</li>
                </ul>
            </div>
       	 	</div>
    		</div><!-- 모달 끝 -->
                      <!-- <form method="post"> -->
<%--                         <div class="row">
                          <div class="col-sm-12">
                            <div class="form-group">
                              <!-- <label class="sr-only" for="name">ID</label>
                              <input class="form-control" id="name" type="text" name="name" placeholder="Name"/> -->
                              <!-- <form role="form"> -->
                              	<div class="form-group">
                            	  <!-- <textarea class="form-control " name= "rcontent" style="margin-bottom:10px" placeholder="후기 작성을 원하시면,&#10;버튼을 누르세요" readonly></textarea> -->
                            	</div>
                            <!-- </form> -->
                            </div>
                          </div>
                          <div class="col-sm-4">

                          </div>
                          <div class="col-sm-12">

                          </div>
                          <div class="col-sm-12">
                           <div class="form-group" id="panelFileBody">
                               <!-- <label class="sr-only" for="email">파일 첨부</label> -->
                              <div class="form-group">
                              		<form method="post" enctype="multipart/form-data" class="uploadDiv">
										<!-- <input id="inputFile" type="file" name="files" multiple="multiple"> -->
									</form>
									<!-- <button id = "btnFileUpload">File Upload With Ajax</button> -->
							  </div>
							  <form id="fileform">
							  
							  </form>
							<div class="form-group fileUploadResult">
								<ul>
									업로드 후 처리결과가 표시될 영역
								</ul>
							</div>				
                            </div>
                          </div>
                          <div class="col-sm-12">
                            <!-- <button type = "button" id="btnreview" class="btn btn-info btn-sm">리뷰 등록하기</button>
                            <button type="button" id="btnRegCmt" class="btn btn-warning btn-sm" >댓글 등록</button>
                            <button type = "button" id="btnCancelRegCmt" class="btn btn-warning btn-sm" type="submit">취소</button> -->
                          </div>
                        </div> --%>
                      <!-- </form> -->
                    </div>
                          
                    <div class="comments reviews">
                    	<ul class="chat">
                    		<%--후기 목록 표시 --%>
                    	</ul>
                    </div>
                    
                    <div class="panel-footer text-center" id="showCmtPagingNums">
                    	<%--후기 목록 페이징 번호 표시 --%>	
                    </div>
                    <!-- 후기 페이징 데이터 저장 -->
                    <form id = "frmCmtPagingValue">
                    	<input type='hidden' name='pageNum' value=''/>
                    </form>
                  </div>
                
                <!-- 상품문의 -->
                 <div class="tab-pane" id="data-sheet">
                  	<div class="queans">
                  		<p> 상품 문의사항이 아닌 반품/교환관련 문의는 고객센터 1:1 문의를 이용해주세요</p>
                  		<button id="open" class="qbutton" data-mid = "${mid }">상품문의</button>
                  	</div>
                  	
        <!-- 상품문의 모달 -->
        <div class="modal hidden">
       		<div class="modal__overlay"></div>
        		<div class="modal-header"></div>
        
        	<form class="modal__content" name="frmqna" method="post" action="${contextPath }/product/Inquire">
            	<input type="hidden" name="productid"  id="gdasSeq" value='${component.productid}'>
            	<input type="hidden" name="mid"  id="goodsNo" value='${mid }'>
            	<h1 class="ptit">상품 Q&amp;A 작성</h1>
    
            <div class="reviews-write">
                <textarea cols="5" rows="1" name="qcontent" onkeyup="counter();" id="qcontent" name="gdasCont" placeholder="문의 내용을 입력해주세요(200자이내)"></textarea>
                    <p>
                        <span id="qconter">0</span>자/200자
                    </p>
            </div>
            
            <div class="btnGroup">
                <button id="BCancel" type="button"  class="btnGray">취소</button>
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
    		</div><!-- 모달 끝 -->
    		
    		<!-- 상품 정보 -->
			<div id= "qboardload">
				<div id="qboardList">
					<ul class="qboardul">
                  		<c:forEach var="qboardList" items="${qboardList }">
                  		
                  		<div class="qboardC">
                  		<!-- <form id="moveQmodify"> -->
                  		
                  			<li class="qbordli">
                  			<p class="qlist">
                  			<c:choose>
                  				<c:when test="${qboardList.mid == '관리자' }">
                  					<span>답변</span>
                  				</c:when>
	                  			<c:when test="${qboardList.qanswerno == 1 }">
	                  				<span class="finans">답변완료</span>
	                  			</c:when>
	                  			<c:otherwise>
	                  				<span class="qrno">답변대기</span>
	                  			</c:otherwise>
                  			</c:choose>       
							
							<c:choose>	
								<c:when test="${fn:length(qboardList.qcontent) > 10 }">
									<%-- <c:out value="${fn:substring(qboardList.qcontent, 0, 9)}"/>... --%>
									<span class="qconsp" data-qno="${qboardList.qno }" data-productid="${qboardList.productid }">${fn:substring(qboardList.qcontent, 0, 9)}....</span></p>
								</c:when>
								<c:otherwise>
									<span class="qconsp" data-qno="${qboardList.qno }" data-productid="${qboardList.productid }" style="word-break: break-word;">${qboardList.qcontent}</span></p>
								</c:otherwise>
							</c:choose>
	                  				
	                  				<p class="qlistmid">
	                  				<span id = "qmid">${qboardList.mid}</span>

	                  			
	                  				<c:if test="${mid == qboardList.mid}">
		                  				<button data-qno="${qboardList.qno }" class="open_correction">수정</button>
		                  				<button data-mid="${qboardList.mid }" class="qDelete">삭제</button>
	                  				</c:if>
	                  				</p>
	                  				<p class="qdate"><fmt:formatDate value="${qboardList.qdate }" pattern="yyyy/MM/dd"/></p>
                  			</li>
                  			</div>
                  			
                  		
                  			<div class='qboardanswer'>
	                  			<div class='qboardMidQcontent'>
	                  				<span class='qboardQcontents'>Q</span>
	                  				<p class='qboardQcontent'>${qboardList.qcontent}</p>
	                  			</div>
	                  		<c:if test="${qboardList.qanswerno == 1 }">
                  				<div class='qboardAdAnswer'>
                  					<span class='Answerboard'>A</span>
                  					<p class='Answerboardp'></p>
                  				</div>
                  			</c:if>
                  			</div>
                  			
                  		<!-- </form> -->
                  		 </c:forEach>
						</ul>
						</div>
					</div> <!-- qboardload -->
					<div id="buttonload">
					<div id= "pagebutton">
					<div class="pull-right">
					  <ul class="pagination pagination-sm pageNum">
					  
					  <c:if test="${qboardPaging.prev}">
					    <li class="paginate_button previous">
					      <a data-qbu="1">&laquo;</a>
					    </li>					  
					  </c:if>
					  
					  <c:if test="${qboardPaging.prev}">
					    <li class="paginate_button previous">
					      <a data-qbu="${qboardPaging.startPagingNum - 1 }">이전</a>
					    </li>					  
					  </c:if>
					  
					  <c:forEach var="pageNum" begin="${qboardPaging.startPagingNum }" end="${qboardPaging.endPagingNum }">
					  	<li class='paginate_button ${qboardPaging.qboardPagingDTO.pageNum == pageNum ? "active" : "" }'>
					  		<a href="javascript:void(0);" data-qbu="${pageNum }">${pageNum }</a>
					  	</li>
					  </c:forEach>
					  
					  <c:if test="${qboardPaging.next}">
					    <li class="paginate_button next">
					      <a data-qbu = "${qboardPaging.endPagingNum + 1 }">다음</a>
					      
					    </li>					  
					  </c:if>
					  
					  <c:if test="${qboardPaging.next}">
					    <li class="paginate_button next">
					      <a data-qbu="${qboardPaging.lastPageNum }">&raquo;</a>
					    </li>					  
					  </c:if>
					  </ul>
					  ${qboardPaging.qboardPagingDTO.pageNum}
				</div>
				</div>
				</div> 
		<!-- 수정 모달 -->
        <div class="modals hidden">
       		<div class="modal__overlay"></div>
        		<div class="modal-header"></div>
        
        	<form id="modifypop" class="modal__content" name="modfrm" method="post" action="${contextPath }/product/modify">
            	<input type="hidden" name="productid"  id="gdasSeq" value='${component.productid}'>
            	<input type="hidden" name="mid" class="modifymid" value='${mid }'>
            	<input type="hidden" name="qno" class="modifyqno">
            	<h1 class="ptit">상품 Q&amp;A 수정</h1>
    
            <div class="reviews-write">
                <textarea cols="5" rows="1" name="qcontent" onkeyup="modcounters();" id="qcontentmodify" name="gdasCont" placeholder="문의 내용을 입력해주세요(200자이내)"></textarea>
                    <p>
                        <span id="modqconter">1</span>자/200자
                    </p>
            </div>
            
            <div class="btnGroup">
                <button id="BCancel" type="button"  class="btnGray">취소</button>
                <button id="BModify" type="button" class="btnGreen">수정</button>
            </div>
            
            <div class="usage-guide">
                	<h2 class="stit">이용안내</h2>
                <ul>
                	<li>재판매글, 상업성 홍보글, 미풍양속을 해치는 글 등 상품 Q&amp;A의 취지에 어긋나는 글은 삭제될 수 있습니다</li>
                </ul>
            </div>
           <sec:csrfInput />
       	 	</form>
    		</div><!-- 모달 끝 -->
				
				
				
				
				<!-- buttonload -->
				
<%-- 				<form id="SendPagingNum">
					<input type='hidden' name='productid' value='${qboardPaging.qboardPagingDTO.productid }'>
					<input type='hidden' name='pageNum' value='${qboardPaging.qboardPagingDTO.pageNum }'>
					<input type='hidden' name='rowAmountPerPage' value='${qboardPaging.qboardPagingDTO.rowAmountPerPage }'>
					<input type='hidden' name='lastPageNum' value='${qboardPaging.lastPageNum }'>
				</form> --%>
					
				<form id="frmSendQboardValue">
						<%-- 삭제 --%>
				<sec:csrfInput />
			    </form>

                  </div>
                  
                </div>
              </div>
            </div>
          </div>
        </section>
  
    </main>
    

    
    <script type="text/javascript" src = "${contextPath }/resources/js/reply.js"></script>
    <script type="text/javascript" src = "${contextPath }/resources/js/productQ&A.js"></script>
    <script type="text/javascript" src = "${contextPath }/resources/js/correction.js"></script>
    <script type="text/javascript" src = "${contextPath }/resources/js/order.js"></script>
    <script type="text/javascript" src = "${contextPath }/resources/js/review.js"></script>
    <%-- <script src="${contextPath }/resources/js/review.js"></script> --%>
    <script type="text/javascript">
    
			var productid = '<c:out value = "${component.productid}"/>';
			var commentUL = $(".chat");
			var reviewTotal = $(".reviewTotal");
			
			var csrfHeaderName = "${_csrf.headerName}";
			var csrfTokenValue = "${_csrf.token}";
			
			$(document).ajaxSend(function(e, xhr, options){
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			});
			
    		//후기 조회
    		function showCmtList(page){
    			commentClsr.getCmtList(
    					{productid: productid, page: page || 1},
    					function(replyPagingCreator){
    						$("#frmCmtPagingValue").find("input[name='pageNum']").val(replyPagingCreator.replyPaging.pageNum);
    						//console.log("폼에 저장된 페이징" + frmCmtPagingValue.find("input[name='pageNum']").val());
    						
    			var str = "";
    			
    			if((!replyPagingCreator.reviewList) || (replyPagingCreator.reviewList.length == 0)){
    				str += '<li class="left clearfix commentLi"'
    					+ ' style="text-align: center; background-color: lightCyan;'
    					+ ' height: 35px; margin-bottom: 0px; padding-bottom:0px;'
    					+ ' padding-top:6px; border: 1px dotted; list-style:none;">'
    					+ ' <strong>후기 없음</strong></li>';
    				commentUL.html(str);
    				return;	
    			}
    			
    			for(var i = 0, len = replyPagingCreator.reviewList.length; i < len; i++){
    				str += '<li style = "list-style:none" class="left clearfix commentLi" data-productid="' + productid
    					+ '"data-rno="'+ replyPagingCreator.reviewList[i].rno+'">'
    					+ '<div class="reviewmid">';
						//답글 스타일    				

    				str += '<span class="header info-mid">'
    					+ ' <strong class="primary-font">'
    				/* if(replyPagingCreator.reviewList[i].lvl > 1){
						str += ' <i class="fa fa-reply fa-fw"></i>&nbsp';
					} */
    					
    					 	+ replyPagingCreator.reviewList[i].mid
    						+ ' </strong> </div>'
    						+ ' <div class="reviewConImg">'
    						+ ' <span>&nbsp;</span>'
    						+ '<span>피부타입:'
    						+ 	replyPagingCreator.reviewList[i].mskinType
    						+ '</span>'
    						+ ' <span>&nbsp;</span>'
    						+ ' <small class="text-muted">작성일:'
    						+ 		commentClsr.showDateTime(replyPagingCreator.reviewList[i].rdate)
    						+ ' </small>';
    					
    					/* if(replyPagingCreator.reviewList[i].lvl > 1){
    						str += '<small>&nbsp; 답글</small>';
    					} */
    					
    					/* var thumbnailFilePath = 
							encodeURIComponent(obj.repoPath + "/" + obj.uploadpath + "/s_" + obj.uuid + "_" + obj.filename); */
							/* var thumbnailFilePath=[];
				 		  thumbnailFilePath[i] =  */
				 		  
				 			 /* var thumbnailFilePath=[encodeURIComponent(replyPagingCreator.fileurl[i].repoPath + "/" + replyPagingCreator.fileurl[i].uploadpath + "/s_" + replyPagingCreator.fileurl[i].uuid + "_" + replyPagingCreator.fileurl[i].filename)]; */
							//encodeURIComponent(obj.repoPath + "/" + obj.uploadpath + "/s_" + obj.uuid + "_" + obj.filename);
							//console.log("파일경로" + thumbnailFilePath);
						var mid = '${mid}';
						str += ' </span>'
							+ ' <p id="reviewList" class="reviewList" data-productid=' + replyPagingCreator.reviewList[i].productid
							+ '    data-rno=' + replyPagingCreator.reviewList[i].rno
							+ '    data-mid=' + replyPagingCreator.reviewList[i].mid
							+ ' value=' + replyPagingCreator.reviewList[i].rno
							+ ' style="word-break: break-word;">' + replyPagingCreator.reviewList[i].rcontent
				 			+ '</p>';
				 			
				 			if(replyPagingCreator.reviewList[i].mid == '${mid}'){
				 				str += '<button type="button" class="reviewCan" onclick="reviewCan()">삭제</button>'
									+ '<button type="button" class="reviewReg"  data-rno="' + replyPagingCreator.reviewList[i].rno + '">수정</button>';	
				 			}
				 			else if('${mid}' == 'admin'){
				 				str += '<button type="button" class="reviewCan" onclick="reviewCan()">삭제</button>';
				 			}
				 			
	    						

				 			var rno = replyPagingCreator.reviewList[i].rno;
				 			console.log("rno : " + rno);
				 			for(var j = 0;  j < replyPagingCreator.fileurl.length; j++){
				 				var thumbnailFilePath=[encodeURIComponent(replyPagingCreator.fileurl[j].repoPath + "/" + replyPagingCreator.fileurl[j].uploadpath + "/s_" + replyPagingCreator.fileurl[j].uuid + "_" + replyPagingCreator.fileurl[j].filename)];
				 				if(rno == replyPagingCreator.fileurl[j].rno){
				 					str += '<span class="imageup" data-repopath="' + replyPagingCreator.fileurl[j].repoPath +'"'
					 					+ ' data-uploadpath="' + replyPagingCreator.fileurl[j].uploadpath +'"'
				    					+ ' data-uuid="' + replyPagingCreator.fileurl[j].uuid +'"'
				    					+ ' data-filename="' + replyPagingCreator.fileurl[j].filename +'"'
				    					+ '>'
				 						+ '<img class = "imgclass" src="${contextPath}/displayThumbnailFile?fileName=' + thumbnailFilePath + '" height="165" width="165" /></span>'
				 				}
				 			} 
							str += '</div>'
								+ '</li>';

    			} //for문 끝
    			
    			
    			commentUL.html(str);
    			
    			reviewTotal.html('리뷰'+'('+replyPagingCreator.replyTotalByBno+')');
    			
    			showCmtPagingNums(replyPagingCreator.replyPaging.pageNum,
    							  replyPagingCreator.startPagingNum,
    							  replyPagingCreator.endPagingNum,
    							  replyPagingCreator.prev,
    							  replyPagingCreator.next,
    							  replyPagingCreator.lastPageNum);
    					}); 
    					
    		} 
    		
    		function showCmtPagingNums(pageNum, startPagingNum, endPagingNum, prev, next, lastPageNum){
    			if(endPagingNum >= lastPageNum){
    				endPagingNum = lastPageNum;
    			}
    			
    		var str = "<ul class='pagination pagination-sm' style='position:relative; z-index:2'>";
    		//맨앞
    		if(prev){
    			str += "<li class='page-item'>"
    				+ " <a class='page-link' href='"+1+"'>"
    				+ " <span aria-hidden='true'>&laquo;</span>"
    				+ " </a>"
    				+ " </li>";
    			}
    		//이전
    		if(prev){
    			str += "<li class='page-item'>"
    				+ " <a class='page-link' href='"+(startPagingNum -1)+"'>이전</a>"
    				+ " </li>";
    			}
    		
    		for(var i = startPagingNum; i <= endPagingNum; i++){
    			var active = ((pageNum == i) ? "active" : "");
    			
    			str +="<li class='page-item" + active + "'>"
    				+ "<a class='page-link' href = '"+i+"'>"+i+"</a>"
    				+ "</li>";
    		}
    		
    			if(next){
    				str += "<li class='page-item'>"
    					+ " <a class='page-link' href='"+(endPagingNum + 1)+"'>다음</a>"
    					+ "</li>";
    			}
    			
    			if(next){
    				str += "<li class='page-item'>"
    					+ " <a class='page-link' href='"+(lastPageNum)+"'>&raquo;</a>"
    					+ "</li>";
    			}
    			
    			str += "</ul>";
    			
    			$("#showCmtPagingNums").html(str);
    		
    		}
    		
    		//선택 페이징 번호 목록 가져오기
    		$("#showCmtPagingNums").on("click", "ul li a", function(e){
    			e.preventDefault();
    			
    			var targetPageNum = $(this).attr("href");
    			console.log("targetPageNum" + targetPageNum);
    			showCmtList(targetPageNum);
    		});
    		
    		
    		
    		//후기 추가 요소 초기화 함수
    		/* function chgBeforeCmtBtn(){
    			$("#btnreview").attr("style", "display:in-block");
    			$("#btnRegCmt").attr("style", "display:none"); 
    			$("#btnCancelRegCmt").attr("style", "display:none");
    			$(".txtBoxCmtMod").val("");
    			$(".txtBoxCmtMod").attr("readonly", true);
    			$(".uploadDiv").attr("style", "display:none");
    		}
    		
    		$("#review").on("click", function(){
    			chgBeforeCmtBtn();

    		}); */
    		
    		//후기 작성 버튼 클릭
    		/* $("#btnreview").on("click", function(){
    			var mid= '${mid}';
    			if(mid == "null"){
    				let result = confirm("로그인 후 이용가능합니다 로그인 페이지로 이동하시겠습니까");
    				if(result == 1){
    					location.href = "${contextPath}/member/myLogin";
    				}
    				
    				return false;
    			}
    			
    			chgBeforeCmtBtn();
    			chgBeforeReplyBtn();
    			chgBeforeCmtRepBtns();
    			
    			$(this).attr("style", "display:none");
    			$("#btnRegCmt").attr("style", "display:in-block; margin-right:2px");
    			$("#btnCancelRegCmt").attr("style", "display:in-block");
    			$(".txtBoxCmtMod").attr("readonly", false);
    			$(".uploadDiv").attr("style", "display:in-block");
    		}); */
    		
    		//후기 취소 클릭
    		/* $("#btnCancelRegCmt").on("click", function(){
    			if(!confirm("후기 작성을 취소하시겠습니가?")){
    				return;
    			}
    			chgBeforeCmtBtn();
    		}); */
    		
    		/* var cloneInputFile = $(".fileUploadResult").clone();
    		//후기 등록 처리
    		$("#btnRegCmt").on("click", function(){
    			var mid = "${mid}";
    			
    			if(mid == null || mid == ""){
    				alert("로그인 해주세요");
    				return false;
    			}
    			var txtBoxCmtMod = $(".txtBoxCmtMod").val();
    			
    			if(txtBoxCmtMod.length == 0 || txtBoxCmtMod == ""){
    				alert("후기를 작성해주세요");
    			} */
    			
    			
/*     			var formObj = $("form[role='form']");
				var strInputHidden = ""; */
    			//var rfilename = $(".fileUploadResult").find("li").data("filename");
/* 				var formdata = new FormData();
     			$(".fileUploadResult ul li").each(function(i, obj){
     				var ObjLi = $(obj);
     				console.log("OBJLI" + ObjLi);
     				ObjLi.data('repopath');
     				console.log(ObjLi.data('repopath')); */
     				
/*     				var repopath = $(".fileUploadResult").find("li")+ObjLi.data('repopath');
        			var uploadpath = $(".fileUploadResult").find("li")+ObjLi.data("uploadpath");
        			var uuid = $(".fileUploadResult").find("li")+ObjLi.data("uuid");
        			var filetype = $(".fileUploadResult").find("li")+ObjLi.data("filetype");
        			var rfilename = $(".fileUploadResult").find("li")+ObjLi.data("filename"); 
        			var fileurl = repopath + "\\" + uploadpath + "\\s_" + uuid + "_" + rfilename;
        			var fileurl = ObjLi.data('repopath') + "\\" + ObjLi.data('uploadpath') + "\\s_" + ObjLi.data('uuid') + "_" + ObjLi.data('filename');
					
        			/* var fileform = $("#fileform"); */
        			var strInputHidden ="";
        			
/*         			$(".fileUploadResult ul li").each(function(i, obj){
						var objLi = $(obj);
						strInputHidden += " <input type='hidden' name='attachFileList["+i+"].uuid' value='"+objLi.data("uuid")+"'>"
										+ " <input type='hidden' name='attachFileList["+i+"].uploadpath' value='"+objLi.data("uploadpath")+"'>"
										+ " <input type='hidden' name='attachFileList["+i+"].filename' value='"+objLi.data("filename")+"'>";
					}); */
        			//var formdata = new FormData();
        			//formdata.append(strInputHidden);
        			//fileform.append(strInputHidden);
        			
	      		/* 	var repopath = $(".fileUploadResult").find("li").data('repopath');
        			var uploadpath = $(".fileUploadResult").find("li").data("uploadpath");
        			var uuid = $(".fileUploadResult").find("li").data("uuid");
        			var filetype = $(".fileUploadResult").find("li").data("filetype"); 
        			var rfilename = $(".fileUploadResult").find("li").data("filename");
        			var fileurl = repopath + "\\" + uploadpath + "\\s_" + uuid + "_" + rfilename; 
     			
   				var comment = {productid : productid,
    						   rcontent : txtBoxCmtMod,
    						   mid : mid,
    						   rfilename : rfilename,
    						   fileurl : fileurl};
     			commentClsr.registerCmt(
    				comment,
    				function(serverResult){
     					$(".txtBoxCmtMod").val("");
    					chgBeforeCmtBtn();
    					
    					alert("댓글이 등록되었습니다");
    					$(".fileUploadResult").html(cloneInputFile.html());
    					showCmtList(1); //후기가 추가된 맨 마지막 페이지 표시
    				}
    			);	
    		}); */
    		
    		//후기 답글 관련 초기화
    		function chgBeforeReplyBtn(){
    			$(".btnRegReply").remove();
    			$(".btnCancelRegReply").remove();
    			$(".txtBoxReply").remove();
    			$(".btnChgReplyReg").attr("style", "display:in-block");
    		}	
    		
    		//답글작성버튼클릭
    		$(".chat").on("click", ".commentLi div div .btnChgReplyReg", function(){
    			
    			$("p").attr("style", "display:in-block");
    			
    			chgBeforeCmtBtn();
    			chgBeforeReplyBtn();
    			chgBeforeCmtRepBtns();
    			
    			var strTxtBoxReply =
    								"<textarea class='form-control txtBoxReply' name = 'rcontent' style='margin-bottom:10px;'"
    								+ "placeholder='답글작성을 원하시면, &#10;답글 작성 버튼을 누르세요'"
    								+"></textarea>"
    								+"<button type='button' class='btn btn-warning btn-xs btnRegReply'>답글 등록</button>"
    								+"<button type='button' class='btn btn-danger btn-xs btnCancelRegReply'"
    								+"style='margin-left:4px;'>취소</button>";
    			$(this).after(strTxtBoxReply);
    			$(this).attr("style", "display:none");
    		});
    		
    		//답글 등록 취소
    		$(".chat").on("click", ".commentLi .btnCancelRegReply", function(){
    			if(!confirm("답글 입력을 취소하시겠습니까?")){
    				return;
    			}
    			chgBeforeReplyBtn();
    		});
    		
    		//답글 등록 버튼 클릭 이벤트
    		$(".chat").on("click", ".commentLi .btnRegReply", function(){
    			var mid = "test8";
    			var pageNum = $("#frmCmtPagingValue").find("input[name='pageNum']").val();
    			var txtBoxReply = $(this).prev().val();
    			var prnoVal = $(this).closest("li").data("rno");
    			
    			var reply = {productid:productid,
    						rcontent: txtBoxReply,
    						mid:mid,
    						prno:prnoVal};
    			
    			commentClsr.registerReply(
    				reply,
    				function(serverResult){
    					alert("답글이 등록되었습니다");
    					
    					showCmtList(pageNum);
    				}
    			);
    		})
    		
    		//후기/답글 수정-삭제-취소 입력창 삭제 함수
    		function chgBeforeCmtRepBtns(){
    			$("p").attr("style", "display:in-block");
    			
    			$(".btnModCmt").remove();
    			$(".btnDelCmt").remove();
    			$(".btnCancelCmt").remove();
    			$(".txtBoxMod").remove();
    		}
    		
    		//댓글-답글 수정/삭제 화면 표시
    		/* $(".chat").on("click", ".commentLi p", function(){
    			
    			var writer = $(this).data("mid");
    			console.log("mid : " + writer);
    			
    			if('${mid}' != writer){
    				alert("작성자만 수정 가능합니다");
    				return false;
    			}
    			
    			chgBeforeCmtBtn();
    			chgBeforeReplyBtn();
    			chgBeforeCmtRepBtns();
    			

    			$(this).parents("li").find(".btnChgReplyReg").attr("style", "display:none");
    			
    			var rcontent = $(this).text();
    			
    			var strTxtBoxReply = "<textarea class='form-control txtBoxMod' name='rcontent' style='margin-bottom:10px;'"
    								+ "placeholder='답글작성을 원하시면&#10;답글작성 버튼을 클릭하세요'"
    								+"></textarea>"
    								+"<button type='button' class='btn btn-warning btn-sm btnModCmt'>수정</button>"
    								+"<button type='button' class='btn btn-danger btn-sm btnDelCmt'>삭제</button>"
    								+"<button type='button' class='btn btn-info btn-sm btnCancelCmt' style='margin-left: 4px;'>취소</button>";
    								
    			$(this).after(strTxtBoxReply);
    			$(".txtBoxMod").val(rcontent);
    			$(this).attr("style", "display:none");
    		}); */
    		
    		//댓글-답글 수정/삭제 취소 버튼
    		$(".chat").on("click", ".commentLi .btnCancelCmt", function(){
    			chgBeforeCmtBtn();
    			chgBeforeReplyBtn();
    			chgBeforeCmtRepBtns();
    		});
    		
    		//댓글-답글 수정
    		$(".chat").on("click", ".commentLi .btnModCmt", function(){
    			//작성자 변수에 저장
    			var mid = $(this).siblings("p").data("mid");
    			var pageNum = $("#frmCmtPagingValue").find("input[name='pageNum']").val();
    			
    			var txtBoxComment = $(this).prev().val();
    			
    			var rnoVal = $(this).closest("li").data("rno");
    			
    			var comment = {productid:productid,
    							rno: rnoVal,
    							mid:mid,
    							rcontent:txtBoxComment
    							};
    			
    			commentClsr.modifyCmtReply(
    					comment,
    					function(serverResult){
    						alert("수정되었습니다");
    						
    						showCmtList(pageNum);
    					}
    					);
    		});

    		//후기삭제
    		$(".chat").on("click", ".commentLi .btnDelCmt", function(){
    			var mid = $(this).siblings("p").data("mid");
    			var delConfirm = confirm('삭제하시겠습니까?');
    			
    			if(!delConfirm){
    				alert('삭제가 취소되었습니다');
    				return;
    			}
    			
    			var pageNum = $("#frmCmtPagingValue").find("input[name='pageNum']").val();
    			
    			var rnoVal = $(this).closest("li").data("rno");
    			
    			var comment = {productid : productid,
    						   rno : rnoVal,
    						   mid : mid};
    			
    			commentClsr.deleteCmtReply(
    				comment,
    				function(serverResult){
    					alert("삭제되었습니다");
    					showCmtList(pageNum);
    				}
    			);
    		});
    		
    		//파일 업로드 크기, 확장자 제한
    		function checkUploadfile(fileName, fileSize){
    			var maxSizeAllowed = 5242880;
    			var regExpForFileExtention = /(.*)\.(exe|sh|zip|alz|txt)$/i;
    			
    			if(fileSize >= maxSizeAllowed){
    				alert("파일이 너무 큽니다 5MB 이하로 첨부해주세요");
    				return false;
    			}
    			
    			if(regExpForFileExtention.test(fileName)){
    				alert('해당 종류의 파일은 업로드할 수 없습니다');
    				return false;
    			}
    			return true;
    		}
    		
    		//업로드 후, 첨부파일 정보 표시
    		function showUploadedFile(uploadResult){
    		console.log("2222222" + uploadResult);
    		
    		if(!uploadResult || uploadResult.length == 0){
    			return;
    		}
    		
    		var fileUploadResult = $(".fileUploadResult ul");
    		var str = "";
    		
    		$(uploadResult).each(function(i, obj){
    /* 			console.log(obj.filetype);
    			 if(obj.filetype == "F"){
    				str += "<li>"
    					+ " <img src='${contextPath}/resources/img/icon-attach.png'"
    					+ "  alt = 'No Icon' style = 'height: 18px; width: 18px;'>"
    					+   obj.filename
    					+ "</li>";
    			} else{  */
    				var thumbnailFilePath = 
    										encodeURIComponent(obj.repoPath + "/" + obj.uploadpath + "/s_" + obj.uuid + "_" + obj.filename);
    				console.log(thumbnailFilePath); 
    				str += "<li class='imageup' data-repopath='" + obj.repoPath + "'"
   						+ "data-uploadpath='" + obj.uploadpath + "'"
    					+ " data-uuid='" + obj.uuid + "'"
    					+ " data-filename='" + obj.filename + "'"
    					+ " data-filetype='I'>"
    					
    					+ "<img src='${contextPath}/displayThumbnailFile?fileName=" + thumbnailFilePath + "'>"
    					
    					+ "<br><span data-filename='" + thumbnailFilePath + "' data-filetype='I'>[삭제]</span>"
    					+ "</li>";
    			//}
    		});
    		fileUploadResult.append(str);
    	}
    		
    		//업로드 후, 첨부파일 정보 표시
    		function showUploadedFiles(uploadResult){
    		console.log("111111111111111" + uploadResult);
    		
    		if(!uploadResult || uploadResult.length == 0){
    			return;
    		}
    		
    		var fileUploadResult = $(".fileUploadResults ul");
    		var str = "";
    		
    		$(uploadResult).each(function(i, obj){
    /* 			console.log(obj.filetype);
    			 if(obj.filetype == "F"){
    				str += "<li>"
    					+ " <img src='${contextPath}/resources/img/icon-attach.png'"
    					+ "  alt = 'No Icon' style = 'height: 18px; width: 18px;'>"
    					+   obj.filename
    					+ "</li>";
    			} else{  */
    				var thumbnailFilePath = 
    										encodeURIComponent(obj.repoPath + "/" + obj.uploadpath + "/s_" + obj.uuid + "_" + obj.filename);
    				console.log(thumbnailFilePath); 
    				str += "<span class='imgCloneClass' data-repopath='" + obj.repoPath + "'"
   						+ "data-uploadpath='" + obj.uploadpath + "'"
    					+ " data-uuid='" + obj.uuid + "'"
    					+ " data-filename='" + obj.filename + "'"
    					+ " data-filetype='I'>"
    					
    					+ "<img src='${contextPath}/displayThumbnailFile?fileName=" + thumbnailFilePath + "'>"
    					
    					
    					+ "<p data-filename='" + thumbnailFilePath + "' data-filetype='I'>[삭제]</p>"
    					+ "</span>";
    			//}
    		});
    		fileUploadResult.append(str);
    	}
    		
    		//업로드 + 후 input 초기화
    		
    		/* var cloneInputFile = $(".fileUploadResult").clone(); */
    		$(".panelFileBody").on("change", "input[type='file']", function(e){
    		alert("body");
    		var formData = new FormData();
    		
    		var inputFiles = $(this);
    		
    		var files = inputFiles[0].files;
    		console.log(files);
    		
    		if(files.length > 3){
    			alert("사진은 3장 이내로 올려주세요");
    			return false;
    		}
    		
     		for(var i = 0; i < files.length; i++){
    			
    			if(!checkUploadfile(files[i].name, files[i].size)){
    				return false;
    			}
    			formData.append("uploadFiles", files[i]);
    		}
    		
/*     		if(files.length > 1){
    			alert("사진은 하나만 올려요");
    			return false;
    		} else{ */
    		//formData.append("uploadFiles", files[0]);
    		$.ajax({
    			type : 'post',
    			url : '${contextPath}/fileUploadAjaxAction',
    			processData : false,
    			contentType : false,
    			data : formData,	
    			dataType : 'json',
    			beforeSend: function(xhr) {
   				 xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
   				 },
    			success : function(uploadResult, status){
    				alert(uploadResult + "==첨부일의 업로드 완료 : " + uploadResult);
/*     				$(".fileUploadResult ul").removeAttr("ul"); */
    				showUploadedFile(uploadResult);
    			}
    		})
    		/* } */
    	});
    		
    		
    		$(".panelFileBodys").on("change", "input[type='file']", function(e){
        		alert("panBoards");
        		var formData = new FormData();
        		
        		var inputFiles = $(this);
        		
        		var files = inputFiles[0].files;
        		console.log(files);
        		
        		if(files.length > 3){
        			alert("사진은 3장 이내로 올려주세요");
        			return false;
        		}
        		
         		for(var i = 0; i < files.length; i++){
        			
        			if(!checkUploadfile(files[i].name, files[i].size)){
        				return false;
        			}
        			formData.append("uploadFiles", files[i]);
        		}
        		
    /*     		if(files.length > 1){
        			alert("사진은 하나만 올려요");
        			return false;
        		} else{ */
        		//formData.append("uploadFiles", files[0]);
        		$.ajax({
        			type : 'post',
        			url : '${contextPath}/fileUploadAjaxAction',
        			processData : false,
        			contentType : false,
        			data : formData,	
        			dataType : 'json',
        			beforeSend: function(xhr) {
       				 xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
       				 },
        			success : function(uploadResult, status){
        				alert(uploadResult + "==첨부일의 업로드 완료 : " + uploadResult);
    /*     				$(".fileUploadResult ul").removeAttr("ul"); */
        				showUploadedFiles(uploadResult);
        			
        			}
        		})
        		/* } */
        	});
    		
    		//파일 삭제
    		$(".fileUploadResult").on("click", "span", function(e){
    		
    		var targetFileName = $(this).parent('.imageup').data("filename");
//    		var targetFileType = $(this).data("filetype");
    		
    		var parentLi = $(this).parent();
    		
    		$.ajax({
    			url: '${contextPath}/deleteUploadedFile',
    			data: {fileName: targetFileName}, //, fileType: targetFileType
    			dataType: 'text',
    			type: 'post',
    			success: function(result){
    				if(result == "SuccessDeletingFile"){
    					alert("파일이 삭제되었습니다");
    					parentLi.remove();
    				}else{
    					alert("오류: 삭제 실패");
    				}
    			}
    		});
    	});
    		
    		//파일 삭제
    		$(".fileUploadResults").on("click", "p", function(e){
    		
    		var targetFileName = $(this).parent('.imgCloneClass').data("filename");
    		//var targetFileName = $(this).parent('.imageup').data("filename");
    		
//    		var targetFileType = $(this).data("filetype");
    		
    		var parentLi = $(this).parent();
    		
    		$.ajax({
    			url: '${contextPath}/deleteUploadedFile',
    			data: {fileName: targetFileName}, //, fileType: targetFileType
    			dataType: 'text',
    			type: 'post',
    			success: function(result){
    				if(result == "SuccessDeletingFile"){
    					alert("파일이 삭제되었습니다");
    					parentLi.remove();
    				}else{
    					alert("오류: 삭제 실패");
    				}
    			}
    		});
    	});
    		
    		/* 페이지 로딩 시 함수 실행 */
    		$(document).ready(function(){
    		
    			showCmtList(1);
    			
    			/* 첨부 파일 조회(메인 사진) */
    			var thumbFilePath;
    			$("input[name='ImageList']").each(function(i){
    				thumbFilePath=encodeURIComponent($(this).val());
    				
    				console.log("thumbFilePath : " + thumbFilePath);
    				console.log("thumbFilePath3 : " + thumbFilePath.indexOf('ImageForList'));
    				if(thumbFilePath.indexOf('ImageForList') != -1){
    					$("#ImageForList").attr("src", "${contextPath}/displayThumbnailFile?fileName=" + thumbFilePath);
    					console.log("thumbFilePath1 : " + thumbFilePath);
    				} else if(thumbFilePath.indexOf('ImageForDesc') != -1){
    					$("#ImageForDesc").attr("src", "${contextPath}/displayThumbnailFile?fileName=" + thumbFilePath);
    					console.log("thumbFilePath2 : " + thumbFilePath);
    				}
    			});
    			
    			/* 로그인 아이디로 좋아요 확인 */
    			var mid = '<c:out value = "${principal.username}"/>'
    			
    			if(mid != null && mid != ''){
    			
    			$.ajax({
    				type : 'post',
    				url : '/allmybeauty/product/memberThumb',
    				data : {mid : mid,
    						productId : productid},
   					dataType : 'json',
    				success : function(result){
						
    					if(result == 1){
    						$(".nthumb").css("display", "none");
    	    				$(".ythumb").attr("onclick", "BtnN()");
    					} else{
    						$(".ythumb").css("display", "none");
	    					$(".nthumb").attr("onclick", "BtnY()");
    					}	
    				}
    			});
    			} else{
    			
    				$(".ythumb").css("display", "none");
					$(".nthumb").attr("onclick", "BtnY()");
    			}
    		});
    		
    </script>
	<%-- <script src="${contextPath }/resources/js/qboard.js"></script> --%>
	<script type="text/javascript">
			
	    	var productid = '${component.productid}'
			console.log("=================" + productid);
	    	
	    	//Q&A 버튼 이벤트 페이지 이동
			/* $(".paginate_button a").on("click", function(e){ */
				/* $(".paginate_button").find("a").click(function(e){ */
					$(document).on("click", ".paginate_button a", function(e){
				e.preventDefault();
 				/* var pageNum = $(this).attr("href"); */
 				var pageNum = $(this).data('qbu');
 				/* var pageNum = $(this).val(); */
 				console.log("pageNum " + pageNum);
				
 				/* 버튼 */
 				//var page = $(".pagebutton").clone();
				//console.log(page);

 				$.ajax({
					type: 'get',
					url: "${contextPath}/product/detail?productid=" + productid,
					dataType: 'html',
					data : {pageNum : pageNum},
					success: function(qboardList, status, xhr){
							$("#pagebutton").remove();
							$("#qboardList").remove();
							
							var reload=$(qboardList).find("#qboardList");
							var page=$(qboardList).find("#pagebutton");
							//var load = $(qboardList).find("#qboardload"); 
							
							$("#qboardload").html(reload);
							$("#buttonload").html(page);
					},
					error: function(xhr, status, er){
							alert(er);
					}
				});
			});
			//문의하기
			function qInquire(){
	    		/* location.href = "${contextPath}/allmybeauty/Inquire?productid=" + productid; */
	    		/* window.open("${contextPath}/allmybeauty/Inquire?productid=" + productid", "상품문의", "width=500"); */
	    	}

			//문의 답변(관리자만)
			/* $(".qAnswer").on("click", function(){ */
				$(document).on("click", ".qAnswer", function(e){
				var qrno = $(this).data("qno");
				location.href = "${contextPath }/product/AdminInquire?qrno=" + qrno + "&productid=" + productid;
			})

			// 문의 수정
			/* $(".qModify").on("click", function(){ */
/* 				$(document).on("click", ".qModify", function(e){
				var mid = $(this).data("mid");
				console.log("-[-====-34=20=-432]" + mid);
				location.href = "${contextPath}/allmybeauty/modify?mid=" + mid;
			})		 */
			
			//문의 삭제
				/* $(".qDelete").on("click",  function(){ */
				$(document).on("click", ".qDelete", function(e){
				var frmSendQboardValue = $("#frmSendQboardValue");
				var mid = $(this).data("mid");
				var qno = $(this).siblings(".open_correction").data("qno");
				console.log("qno : " + qno);
				frmSendQboardValue.append("<input type = 'hidden' name='mid' value='" + mid + "'>");
				frmSendQboardValue.append("<input type = 'hidden' name='productid' value='" + productid + "'>");
				frmSendQboardValue.append("<input type = 'hidden' name='qno' value='" + qno + "'>");
				frmSendQboardValue.attr("method", "post");
				frmSendQboardValue.attr("action", "${contextPath}/product/delete");
				frmSendQboardValue.submit();
			});
	</script>
<%@ include file="../include/myfooter.jsp" %>
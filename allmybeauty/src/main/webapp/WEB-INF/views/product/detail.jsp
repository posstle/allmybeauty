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
                    <div class="price font-alt"><span class="amount">${component.productprice }???</span></div>
                  </div>
                </div>
                <div class="prd_more_info">

                  <div class="proDe">
                    <p class="tit">????????????</p>
    
                    <ul class="bl_list">
                    <li style="list-style: none;">
                      <span>????????????</span>
                      <div> 2,500??? ( 20,000 ??? ?????? ???????????? )
                         <br><em>AllMyBeauty ?????? </em>
                         <em>?????? 3??? ?????? ??????</em>
                      </div>
                    </li>
                    </ul>
                  </div>

                  <div class="proDe">
                    <p class="tit">????????????</p>
                    <div class="txt_list">
                        <p>THE CJ ?????? ?????? 10%?????? <a href="javascript:goods.detail.openCardFullPop();" class="ico_info">??????????????? ?????? ????????? ??????</a></p>

          <!-- 									<li> -->					
                            <p>
                              CJ ONE ????????? <span class=""></span> 
                              ??????  2% ?????? ??????  
                              <a href="javascript:goods.detail.openCjonepntPop();" class="ico_info">CJ ONE ????????? ???????????? ????????? ??????</a>
                            </p>
                        
          <!-- 									</li> -->
                            
                      
    <!-- 									<p>THE CJ ?????? ?????? 10%?????? <a href="javascript:goods.detail.openCardFullPop();" class="ico_info">?????????????????? ???????????????</a></p> -->
    <!-- 									<p>CJ ONE ????????? 2% ?????? ??????</p> -->
    
                      <!-- ????????? ?????? -->
                      <!-- <p>CJ ONE ????????? <span class="color-1">GOLD OLIVE</span> 2.0% ?????? ?????? <a href="me" class="ico_info">???????????? ????????? ??????</a></p>
                                        <p>CJ ONE ????????? <span class="color-2">BLACK OLIVE</span> 2.0% ?????? ??????  <a href="me" class="ico_info">???????????? ????????? ??????</a></p>
                                        <p>CJ ONE ????????? <span class="color-3">GREEN OLIVE</span> 1.5% ?????? ??????  <a href="me" class="ico_info">???????????? ????????? ??????</a></p>
                                        <p>CJ ONE ????????? <span class="color-4">BABY OLIVE</span> 1% ?????? ??????  <a href="me" class="ico_info">???????????? ????????? ??????</a></p>-->
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
                	<span>????????????</span>
                  <div class="option">
              		<input type="button" onclick="count('minus')" value="-"/>
                    <input id="procount" type="text" name="" value="1" required="required" readonly="readonly"/>
                    <input type="button" onclick="count('plus')" value=&#43;>
                  </div>
                </div>
						
				<div class="prd_total_price">
					<span class="txt_total_price">???????????? ??????</span>
					<!-- ?????? ?????? ?????? ?????? -->
					<input type='hidden' id = 'productStock' value='${component.productstock }'/>
					<input type='hidden' class="noprice" value="${component.productprice }">
					<span class="tx_cont">
					<span class="total_price"><fmt:formatNumber value="${component.productprice}" pattern="###,###,###"/></span>
					???
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
	                	<button class="btn_bas" data-productid="${component.productid }" onclick="Btncart()">????????????</button>
	                	<button type="button" class="btn_buy" data-productid="${component.productid }" onclick="Btnorder()">????????????</button>
	                	

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
                  <li class="active"><a href="#description" data-toggle="tab"><span></span>????????????</a></li>
                  <!-- <li><a href="#data-sheet" data-toggle="tab"><span class="icon-tools-2"></span></a></li> -->
                  <li id = "review"><a class = "reviewTotal" href="#reviews" data-toggle="tab"><span>??????(0)</span></a></li>
                  <%-- <li id = "review"><a class = "reviewTotal" href="#reviews" data-toggle="tab"><span class="icon-tools-2"></span>?????? ??? ?????? ???</a></li> --%>
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
                          <td>????????????</td>
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
                
                <!-- ?????? -->
                <div class="tab-pane" id="reviews">
                   <div class="comment-form mt-20">
                      <h4 class="comment-form-title font-alt">
                      		<button type="button" id="RegRev" data-mid= '${mid }'>?????? ??????</button>
                      </h4>
                      
                      
        		<!-- ?????? ?????? -->
        <div class="modalr hidden">
       		<div class="modal__overlay"></div>
        		<div class="modal-header"></div>
        
        	<!-- <form id="frmreview" class="modal__content" name="frmreview" method="post"> -->
            	<div class="modal__content">
            	<input type="hidden" name="productid"  id="gdasSeq" value='${component.productid}'>
            	<input type="hidden" name="mid" value="${mid }" class="reviewmid">
            	<h1 class="ptit">?????? ??????</h1>
    
            <div class="reviews-write">
                <textarea cols="5" rows="1" name="rcontent" onkeyup="revcounters();" id="rcontentreg" name="gdasCont" placeholder="?????? ????????? ??????????????????(200?????????)"></textarea>
                    <p>
                        <span id="revqconter">0</span>???/500???
                    </p>
                    <div class="form-group panelFileBody">
                        <div class="form-group">
							<form method="post" enctype="multipart/form-data" class="uploadDiv">
										<!-- <input id="inputFilefi" type="file" name="files" multiple="multiple" style="margin-left: 50px;"> -->
								<label class="inputFileButton" for="input-file">
									 ?????????
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
							<!-- ????????? ??? ??????????????? ????????? ?????? -->
						</ul>
			  		</div>
              </div> 
              
              	
            	
            <div class="btnGroup">
                <button id="CancleRv" type="button"  class="btnGray">??????</button>
                <button id="BReview"  type="button" onclick="BtnRev()" class="btnGreen">??????</button>
            </div>
            
            <div class="usage-guide">
                	<h2 class="stit">????????????</h2>
                <ul>
                	<li>????????????, ????????? ?????????, ??????????????? ????????? ??? ??? ???????????? ????????? ???????????? ?????? ????????? ??? ????????????</li>
                </ul>
            </div>
       	 	<!-- </form> -->
       	 	</div>
    		</div><!-- ?????? ??? -->
    		
    		
   		<!-- ?????? ?????? ?????? -->
        <div class="modalc hidden">
       		<div class="modal__overlay"></div>
        		<div class="modal-header"></div>
        
        	<!-- <form id="frmreviewcor" class="modal__content" name="frmreviewcor" method="post"> -->
        	<div class="modal__content">
            	<input type="hidden" name="productid"  id="reviewMdPro" value='${component.productid}'>
            	<input type="hidden" name="mid" id="reviewMdMid" value="${mid }" class="reviewmid">
            	<input type="hidden" name="rno" id="reviewMdRno" value="" id="revrno"/>
            	<h1 class="ptit">?????? ??????</h1>
    
            <div class="reviews-write">
                <textarea cols="5" rows="1" name="rcontentc" onkeyup="revcounter();" id="rcontentcor" name="gdasCont" ></textarea>
                    <p>
                        <span id="revqconters">0</span>???/500???
                    </p>
                    <div class="panelFileBodys">
                    <div class="form-group">
                    	<form method="post" enctype="multipart/form-data" class="uploadDiv">
							<label class="inputFileButton" for="input-files">
							  ?????????
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
                <button id="CancleRvC" type="button"  class="btnGray">??????</button>
                <button id="BReviewC"  type="button" onclick="BtnRevC()" class="btnGreen">??????</button>
            </div>
            
            <div class="usage-guide">
                	<h2 class="stit">????????????</h2>
                <ul>
                	<li>????????????, ????????? ?????????, ??????????????? ????????? ??? ??? ??????????????? ????????? ???????????? ?????? ????????? ??? ????????????</li>
                </ul>
            </div>
       	 	</div>
    		</div><!-- ?????? ??? -->
                      <!-- <form method="post"> -->
<%--                         <div class="row">
                          <div class="col-sm-12">
                            <div class="form-group">
                              <!-- <label class="sr-only" for="name">ID</label>
                              <input class="form-control" id="name" type="text" name="name" placeholder="Name"/> -->
                              <!-- <form role="form"> -->
                              	<div class="form-group">
                            	  <!-- <textarea class="form-control " name= "rcontent" style="margin-bottom:10px" placeholder="?????? ????????? ????????????,&#10;????????? ????????????" readonly></textarea> -->
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
                               <!-- <label class="sr-only" for="email">?????? ??????</label> -->
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
									????????? ??? ??????????????? ????????? ??????
								</ul>
							</div>				
                            </div>
                          </div>
                          <div class="col-sm-12">
                            <!-- <button type = "button" id="btnreview" class="btn btn-info btn-sm">?????? ????????????</button>
                            <button type="button" id="btnRegCmt" class="btn btn-warning btn-sm" >?????? ??????</button>
                            <button type = "button" id="btnCancelRegCmt" class="btn btn-warning btn-sm" type="submit">??????</button> -->
                          </div>
                        </div> --%>
                      <!-- </form> -->
                    </div>
                          
                    <div class="comments reviews">
                    	<ul class="chat">
                    		<%--?????? ?????? ?????? --%>
                    	</ul>
                    </div>
                    
                    <div class="panel-footer text-center" id="showCmtPagingNums">
                    	<%--?????? ?????? ????????? ?????? ?????? --%>	
                    </div>
                    <!-- ?????? ????????? ????????? ?????? -->
                    <form id = "frmCmtPagingValue">
                    	<input type='hidden' name='pageNum' value=''/>
                    </form>
                  </div>
                
                <!-- ???????????? -->
                 <div class="tab-pane" id="data-sheet">
                  	<div class="queans">
                  		<p> ?????? ??????????????? ?????? ??????/???????????? ????????? ???????????? 1:1 ????????? ??????????????????</p>
                  		<button id="open" class="qbutton" data-mid = "${mid }">????????????</button>
                  	</div>
                  	
        <!-- ???????????? ?????? -->
        <div class="modal hidden">
       		<div class="modal__overlay"></div>
        		<div class="modal-header"></div>
        
        	<form class="modal__content" name="frmqna" method="post" action="${contextPath }/product/Inquire">
            	<input type="hidden" name="productid"  id="gdasSeq" value='${component.productid}'>
            	<input type="hidden" name="mid"  id="goodsNo" value='${mid }'>
            	<h1 class="ptit">?????? Q&amp;A ??????</h1>
    
            <div class="reviews-write">
                <textarea cols="5" rows="1" name="qcontent" onkeyup="counter();" id="qcontent" name="gdasCont" placeholder="?????? ????????? ??????????????????(200?????????)"></textarea>
                    <p>
                        <span id="qconter">0</span>???/200???
                    </p>
            </div>
            
            <div class="btnGroup">
                <button id="BCancel" type="button"  class="btnGray">??????</button>
                <button id="reg" type="button" class="btnGreen" onclick="btnqna()">??????</button>
            </div>
            
            <div class="usage-guide">
                	<h2 class="stit">????????????</h2>
                <ul>
                	<li>????????????, ????????? ?????????, ??????????????? ????????? ??? ??? ?????? Q&amp;A??? ????????? ???????????? ?????? ????????? ??? ????????????</li>
                </ul>
            </div>
            <sec:csrfInput />
       	 	</form>
    		</div><!-- ?????? ??? -->
    		
    		<!-- ?????? ?????? -->
			<div id= "qboardload">
				<div id="qboardList">
					<ul class="qboardul">
                  		<c:forEach var="qboardList" items="${qboardList }">
                  		
                  		<div class="qboardC">
                  		<!-- <form id="moveQmodify"> -->
                  		
                  			<li class="qbordli">
                  			<p class="qlist">
                  			<c:choose>
                  				<c:when test="${qboardList.mid == '?????????' }">
                  					<span>??????</span>
                  				</c:when>
	                  			<c:when test="${qboardList.qanswerno == 1 }">
	                  				<span class="finans">????????????</span>
	                  			</c:when>
	                  			<c:otherwise>
	                  				<span class="qrno">????????????</span>
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
		                  				<button data-qno="${qboardList.qno }" class="open_correction">??????</button>
		                  				<button data-mid="${qboardList.mid }" class="qDelete">??????</button>
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
					      <a data-qbu="${qboardPaging.startPagingNum - 1 }">??????</a>
					    </li>					  
					  </c:if>
					  
					  <c:forEach var="pageNum" begin="${qboardPaging.startPagingNum }" end="${qboardPaging.endPagingNum }">
					  	<li class='paginate_button ${qboardPaging.qboardPagingDTO.pageNum == pageNum ? "active" : "" }'>
					  		<a href="javascript:void(0);" data-qbu="${pageNum }">${pageNum }</a>
					  	</li>
					  </c:forEach>
					  
					  <c:if test="${qboardPaging.next}">
					    <li class="paginate_button next">
					      <a data-qbu = "${qboardPaging.endPagingNum + 1 }">??????</a>
					      
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
		<!-- ?????? ?????? -->
        <div class="modals hidden">
       		<div class="modal__overlay"></div>
        		<div class="modal-header"></div>
        
        	<form id="modifypop" class="modal__content" name="modfrm" method="post" action="${contextPath }/product/modify">
            	<input type="hidden" name="productid"  id="gdasSeq" value='${component.productid}'>
            	<input type="hidden" name="mid" class="modifymid" value='${mid }'>
            	<input type="hidden" name="qno" class="modifyqno">
            	<h1 class="ptit">?????? Q&amp;A ??????</h1>
    
            <div class="reviews-write">
                <textarea cols="5" rows="1" name="qcontent" onkeyup="modcounters();" id="qcontentmodify" name="gdasCont" placeholder="?????? ????????? ??????????????????(200?????????)"></textarea>
                    <p>
                        <span id="modqconter">1</span>???/200???
                    </p>
            </div>
            
            <div class="btnGroup">
                <button id="BCancel" type="button"  class="btnGray">??????</button>
                <button id="BModify" type="button" class="btnGreen">??????</button>
            </div>
            
            <div class="usage-guide">
                	<h2 class="stit">????????????</h2>
                <ul>
                	<li>????????????, ????????? ?????????, ??????????????? ????????? ??? ??? ?????? Q&amp;A??? ????????? ???????????? ?????? ????????? ??? ????????????</li>
                </ul>
            </div>
           <sec:csrfInput />
       	 	</form>
    		</div><!-- ?????? ??? -->
				
				
				
				
				<!-- buttonload -->
				
<%-- 				<form id="SendPagingNum">
					<input type='hidden' name='productid' value='${qboardPaging.qboardPagingDTO.productid }'>
					<input type='hidden' name='pageNum' value='${qboardPaging.qboardPagingDTO.pageNum }'>
					<input type='hidden' name='rowAmountPerPage' value='${qboardPaging.qboardPagingDTO.rowAmountPerPage }'>
					<input type='hidden' name='lastPageNum' value='${qboardPaging.lastPageNum }'>
				</form> --%>
					
				<form id="frmSendQboardValue">
						<%-- ?????? --%>
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
			
    		//?????? ??????
    		function showCmtList(page){
    			commentClsr.getCmtList(
    					{productid: productid, page: page || 1},
    					function(replyPagingCreator){
    						$("#frmCmtPagingValue").find("input[name='pageNum']").val(replyPagingCreator.replyPaging.pageNum);
    						//console.log("?????? ????????? ?????????" + frmCmtPagingValue.find("input[name='pageNum']").val());
    						
    			var str = "";
    			
    			if((!replyPagingCreator.reviewList) || (replyPagingCreator.reviewList.length == 0)){
    				str += '<li class="left clearfix commentLi"'
    					+ ' style="text-align: center; background-color: lightCyan;'
    					+ ' height: 35px; margin-bottom: 0px; padding-bottom:0px;'
    					+ ' padding-top:6px; border: 1px dotted; list-style:none;">'
    					+ ' <strong>?????? ??????</strong></li>';
    				commentUL.html(str);
    				return;	
    			}
    			
    			for(var i = 0, len = replyPagingCreator.reviewList.length; i < len; i++){
    				str += '<li style = "list-style:none" class="left clearfix commentLi" data-productid="' + productid
    					+ '"data-rno="'+ replyPagingCreator.reviewList[i].rno+'">'
    					+ '<div class="reviewmid">';
						//?????? ?????????    				

    				str += '<span class="header info-mid">'
    					+ ' <strong class="primary-font">'
    				/* if(replyPagingCreator.reviewList[i].lvl > 1){
						str += ' <i class="fa fa-reply fa-fw"></i>&nbsp';
					} */
    					
    					 	+ replyPagingCreator.reviewList[i].mid
    						+ ' </strong> </div>'
    						+ ' <div class="reviewConImg">'
    						+ ' <span>&nbsp;</span>'
    						+ '<span>????????????:'
    						+ 	replyPagingCreator.reviewList[i].mskinType
    						+ '</span>'
    						+ ' <span>&nbsp;</span>'
    						+ ' <small class="text-muted">?????????:'
    						+ 		commentClsr.showDateTime(replyPagingCreator.reviewList[i].rdate)
    						+ ' </small>';
    					
    					/* if(replyPagingCreator.reviewList[i].lvl > 1){
    						str += '<small>&nbsp; ??????</small>';
    					} */
    					
    					/* var thumbnailFilePath = 
							encodeURIComponent(obj.repoPath + "/" + obj.uploadpath + "/s_" + obj.uuid + "_" + obj.filename); */
							/* var thumbnailFilePath=[];
				 		  thumbnailFilePath[i] =  */
				 		  
				 			 /* var thumbnailFilePath=[encodeURIComponent(replyPagingCreator.fileurl[i].repoPath + "/" + replyPagingCreator.fileurl[i].uploadpath + "/s_" + replyPagingCreator.fileurl[i].uuid + "_" + replyPagingCreator.fileurl[i].filename)]; */
							//encodeURIComponent(obj.repoPath + "/" + obj.uploadpath + "/s_" + obj.uuid + "_" + obj.filename);
							//console.log("????????????" + thumbnailFilePath);
						var mid = '${mid}';
						str += ' </span>'
							+ ' <p id="reviewList" class="reviewList" data-productid=' + replyPagingCreator.reviewList[i].productid
							+ '    data-rno=' + replyPagingCreator.reviewList[i].rno
							+ '    data-mid=' + replyPagingCreator.reviewList[i].mid
							+ ' value=' + replyPagingCreator.reviewList[i].rno
							+ ' style="word-break: break-word;">' + replyPagingCreator.reviewList[i].rcontent
				 			+ '</p>';
				 			
				 			if(replyPagingCreator.reviewList[i].mid == '${mid}'){
				 				str += '<button type="button" class="reviewCan" onclick="reviewCan()">??????</button>'
									+ '<button type="button" class="reviewReg"  data-rno="' + replyPagingCreator.reviewList[i].rno + '">??????</button>';	
				 			}
				 			else if('${mid}' == 'admin'){
				 				str += '<button type="button" class="reviewCan" onclick="reviewCan()">??????</button>';
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

    			} //for??? ???
    			
    			
    			commentUL.html(str);
    			
    			reviewTotal.html('??????'+'('+replyPagingCreator.replyTotalByBno+')');
    			
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
    		//??????
    		if(prev){
    			str += "<li class='page-item'>"
    				+ " <a class='page-link' href='"+1+"'>"
    				+ " <span aria-hidden='true'>&laquo;</span>"
    				+ " </a>"
    				+ " </li>";
    			}
    		//??????
    		if(prev){
    			str += "<li class='page-item'>"
    				+ " <a class='page-link' href='"+(startPagingNum -1)+"'>??????</a>"
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
    					+ " <a class='page-link' href='"+(endPagingNum + 1)+"'>??????</a>"
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
    		
    		//?????? ????????? ?????? ?????? ????????????
    		$("#showCmtPagingNums").on("click", "ul li a", function(e){
    			e.preventDefault();
    			
    			var targetPageNum = $(this).attr("href");
    			console.log("targetPageNum" + targetPageNum);
    			showCmtList(targetPageNum);
    		});
    		
    		
    		
    		//?????? ?????? ?????? ????????? ??????
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
    		
    		//?????? ?????? ?????? ??????
    		/* $("#btnreview").on("click", function(){
    			var mid= '${mid}';
    			if(mid == "null"){
    				let result = confirm("????????? ??? ????????????????????? ????????? ???????????? ????????????????????????");
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
    		
    		//?????? ?????? ??????
    		/* $("#btnCancelRegCmt").on("click", function(){
    			if(!confirm("?????? ????????? ?????????????????????????")){
    				return;
    			}
    			chgBeforeCmtBtn();
    		}); */
    		
    		/* var cloneInputFile = $(".fileUploadResult").clone();
    		//?????? ?????? ??????
    		$("#btnRegCmt").on("click", function(){
    			var mid = "${mid}";
    			
    			if(mid == null || mid == ""){
    				alert("????????? ????????????");
    				return false;
    			}
    			var txtBoxCmtMod = $(".txtBoxCmtMod").val();
    			
    			if(txtBoxCmtMod.length == 0 || txtBoxCmtMod == ""){
    				alert("????????? ??????????????????");
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
    					
    					alert("????????? ?????????????????????");
    					$(".fileUploadResult").html(cloneInputFile.html());
    					showCmtList(1); //????????? ????????? ??? ????????? ????????? ??????
    				}
    			);	
    		}); */
    		
    		//?????? ?????? ?????? ?????????
    		function chgBeforeReplyBtn(){
    			$(".btnRegReply").remove();
    			$(".btnCancelRegReply").remove();
    			$(".txtBoxReply").remove();
    			$(".btnChgReplyReg").attr("style", "display:in-block");
    		}	
    		
    		//????????????????????????
    		$(".chat").on("click", ".commentLi div div .btnChgReplyReg", function(){
    			
    			$("p").attr("style", "display:in-block");
    			
    			chgBeforeCmtBtn();
    			chgBeforeReplyBtn();
    			chgBeforeCmtRepBtns();
    			
    			var strTxtBoxReply =
    								"<textarea class='form-control txtBoxReply' name = 'rcontent' style='margin-bottom:10px;'"
    								+ "placeholder='??????????????? ????????????, &#10;?????? ?????? ????????? ????????????'"
    								+"></textarea>"
    								+"<button type='button' class='btn btn-warning btn-xs btnRegReply'>?????? ??????</button>"
    								+"<button type='button' class='btn btn-danger btn-xs btnCancelRegReply'"
    								+"style='margin-left:4px;'>??????</button>";
    			$(this).after(strTxtBoxReply);
    			$(this).attr("style", "display:none");
    		});
    		
    		//?????? ?????? ??????
    		$(".chat").on("click", ".commentLi .btnCancelRegReply", function(){
    			if(!confirm("?????? ????????? ?????????????????????????")){
    				return;
    			}
    			chgBeforeReplyBtn();
    		});
    		
    		//?????? ?????? ?????? ?????? ?????????
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
    					alert("????????? ?????????????????????");
    					
    					showCmtList(pageNum);
    				}
    			);
    		})
    		
    		//??????/?????? ??????-??????-?????? ????????? ?????? ??????
    		function chgBeforeCmtRepBtns(){
    			$("p").attr("style", "display:in-block");
    			
    			$(".btnModCmt").remove();
    			$(".btnDelCmt").remove();
    			$(".btnCancelCmt").remove();
    			$(".txtBoxMod").remove();
    		}
    		
    		//??????-?????? ??????/?????? ?????? ??????
    		/* $(".chat").on("click", ".commentLi p", function(){
    			
    			var writer = $(this).data("mid");
    			console.log("mid : " + writer);
    			
    			if('${mid}' != writer){
    				alert("???????????? ?????? ???????????????");
    				return false;
    			}
    			
    			chgBeforeCmtBtn();
    			chgBeforeReplyBtn();
    			chgBeforeCmtRepBtns();
    			

    			$(this).parents("li").find(".btnChgReplyReg").attr("style", "display:none");
    			
    			var rcontent = $(this).text();
    			
    			var strTxtBoxReply = "<textarea class='form-control txtBoxMod' name='rcontent' style='margin-bottom:10px;'"
    								+ "placeholder='??????????????? ????????????&#10;???????????? ????????? ???????????????'"
    								+"></textarea>"
    								+"<button type='button' class='btn btn-warning btn-sm btnModCmt'>??????</button>"
    								+"<button type='button' class='btn btn-danger btn-sm btnDelCmt'>??????</button>"
    								+"<button type='button' class='btn btn-info btn-sm btnCancelCmt' style='margin-left: 4px;'>??????</button>";
    								
    			$(this).after(strTxtBoxReply);
    			$(".txtBoxMod").val(rcontent);
    			$(this).attr("style", "display:none");
    		}); */
    		
    		//??????-?????? ??????/?????? ?????? ??????
    		$(".chat").on("click", ".commentLi .btnCancelCmt", function(){
    			chgBeforeCmtBtn();
    			chgBeforeReplyBtn();
    			chgBeforeCmtRepBtns();
    		});
    		
    		//??????-?????? ??????
    		$(".chat").on("click", ".commentLi .btnModCmt", function(){
    			//????????? ????????? ??????
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
    						alert("?????????????????????");
    						
    						showCmtList(pageNum);
    					}
    					);
    		});

    		//????????????
    		$(".chat").on("click", ".commentLi .btnDelCmt", function(){
    			var mid = $(this).siblings("p").data("mid");
    			var delConfirm = confirm('?????????????????????????');
    			
    			if(!delConfirm){
    				alert('????????? ?????????????????????');
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
    					alert("?????????????????????");
    					showCmtList(pageNum);
    				}
    			);
    		});
    		
    		//?????? ????????? ??????, ????????? ??????
    		function checkUploadfile(fileName, fileSize){
    			var maxSizeAllowed = 5242880;
    			var regExpForFileExtention = /(.*)\.(exe|sh|zip|alz|txt)$/i;
    			
    			if(fileSize >= maxSizeAllowed){
    				alert("????????? ?????? ????????? 5MB ????????? ??????????????????");
    				return false;
    			}
    			
    			if(regExpForFileExtention.test(fileName)){
    				alert('?????? ????????? ????????? ???????????? ??? ????????????');
    				return false;
    			}
    			return true;
    		}
    		
    		//????????? ???, ???????????? ?????? ??????
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
    					
    					+ "<br><span data-filename='" + thumbnailFilePath + "' data-filetype='I'>[??????]</span>"
    					+ "</li>";
    			//}
    		});
    		fileUploadResult.append(str);
    	}
    		
    		//????????? ???, ???????????? ?????? ??????
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
    					
    					
    					+ "<p data-filename='" + thumbnailFilePath + "' data-filetype='I'>[??????]</p>"
    					+ "</span>";
    			//}
    		});
    		fileUploadResult.append(str);
    	}
    		
    		//????????? + ??? input ?????????
    		
    		/* var cloneInputFile = $(".fileUploadResult").clone(); */
    		$(".panelFileBody").on("change", "input[type='file']", function(e){
    		alert("body");
    		var formData = new FormData();
    		
    		var inputFiles = $(this);
    		
    		var files = inputFiles[0].files;
    		console.log(files);
    		
    		if(files.length > 3){
    			alert("????????? 3??? ????????? ???????????????");
    			return false;
    		}
    		
     		for(var i = 0; i < files.length; i++){
    			
    			if(!checkUploadfile(files[i].name, files[i].size)){
    				return false;
    			}
    			formData.append("uploadFiles", files[i]);
    		}
    		
/*     		if(files.length > 1){
    			alert("????????? ????????? ?????????");
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
    				alert(uploadResult + "==???????????? ????????? ?????? : " + uploadResult);
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
        			alert("????????? 3??? ????????? ???????????????");
        			return false;
        		}
        		
         		for(var i = 0; i < files.length; i++){
        			
        			if(!checkUploadfile(files[i].name, files[i].size)){
        				return false;
        			}
        			formData.append("uploadFiles", files[i]);
        		}
        		
    /*     		if(files.length > 1){
        			alert("????????? ????????? ?????????");
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
        				alert(uploadResult + "==???????????? ????????? ?????? : " + uploadResult);
    /*     				$(".fileUploadResult ul").removeAttr("ul"); */
        				showUploadedFiles(uploadResult);
        			
        			}
        		})
        		/* } */
        	});
    		
    		//?????? ??????
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
    					alert("????????? ?????????????????????");
    					parentLi.remove();
    				}else{
    					alert("??????: ?????? ??????");
    				}
    			}
    		});
    	});
    		
    		//?????? ??????
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
    					alert("????????? ?????????????????????");
    					parentLi.remove();
    				}else{
    					alert("??????: ?????? ??????");
    				}
    			}
    		});
    	});
    		
    		/* ????????? ?????? ??? ?????? ?????? */
    		$(document).ready(function(){
    		
    			showCmtList(1);
    			
    			/* ?????? ?????? ??????(?????? ??????) */
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
    			
    			/* ????????? ???????????? ????????? ?????? */
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
	    	
	    	//Q&A ?????? ????????? ????????? ??????
			/* $(".paginate_button a").on("click", function(e){ */
				/* $(".paginate_button").find("a").click(function(e){ */
					$(document).on("click", ".paginate_button a", function(e){
				e.preventDefault();
 				/* var pageNum = $(this).attr("href"); */
 				var pageNum = $(this).data('qbu');
 				/* var pageNum = $(this).val(); */
 				console.log("pageNum " + pageNum);
				
 				/* ?????? */
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
			//????????????
			function qInquire(){
	    		/* location.href = "${contextPath}/allmybeauty/Inquire?productid=" + productid; */
	    		/* window.open("${contextPath}/allmybeauty/Inquire?productid=" + productid", "????????????", "width=500"); */
	    	}

			//?????? ??????(????????????)
			/* $(".qAnswer").on("click", function(){ */
				$(document).on("click", ".qAnswer", function(e){
				var qrno = $(this).data("qno");
				location.href = "${contextPath }/product/AdminInquire?qrno=" + qrno + "&productid=" + productid;
			})

			// ?????? ??????
			/* $(".qModify").on("click", function(){ */
/* 				$(document).on("click", ".qModify", function(e){
				var mid = $(this).data("mid");
				console.log("-[-====-34=20=-432]" + mid);
				location.href = "${contextPath}/allmybeauty/modify?mid=" + mid;
			})		 */
			
			//?????? ??????
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <%@ include file="../include/myheader.jsp" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
    
    input:invalid {
	  border: 1px solid red;
	}
     
    .col-sm-offset-2 {
     	margin-left:80px;
     }
     
     li {
     	list-style: none;
     }
      #aside{
        margin:20px;
     	float: left;
     	width: 10%;
     	min-height: 20px;
     }
     #article{

     	float: right;
     	width: 90%;
     	margin-left: -50px;
     	padding-left: 50px;
     } 
     .PostFile label {
 		  display: inline-block;
  		  padding: .5em .75em;
		  color: #fff;
		  font-size: inherit;
		  line-height: normal;
		  vertical-align: middle;
		  background-color: #00BFFF;
		  cursor: pointer;
		  border: 1px solid #00BFFF;
		  border-radius: .25em;
		  -webkit-transition: background-color 0.2s;
		  transition: background-color 0.2s;
	}

	.PostFile label:hover {
	  background-color: #4682B4;	
	}
	
	.PostFile label:active {
	  background-color: #4682B4;
	}
	
	.PostFile input[type="file"] {
	  position: absolute;
	  width: 1px;
	  height: 1px;
	  padding: 0;
	  margin: -1px;
	  overflow: hidden;
	  clip: rect(0, 0, 0, 0);
	  border: 0;
	}    
  	textarea{
            height:40px;
            width:300px;
            border-radius: 4px;
            font-size: 20px;
        }
        }    
  	#productDesc{
            height:40px;
            width:300px;
            border-radius: 4px;
            font-size: 20px;
        }
    input[type=text]{
            height:44px;
            width:300px;
            font-size: 15px;
        }
    #productPrice{
            height:30px;
            width:150px;
            font-size: 18px;
            position:static;
            top:10px;
            border-radius:4;
            display:in-block;
            margin: .4em 0;
        }
    #category{	width:200px;
    			height:35px;
    }
    .subcategory {
       			width:200px;
    			height:35px;
    }
    #skintypeid{	
    			width:200px;
    			height:35px;
    }
    .keywordform{
    			 float: left;
  			     margin-left: 5%;
                 width:30%;
                 box-sizing: border-box;
                  padding-bottom:20px;
    		}
   	.compKeywordDiv{
   		  float: left;
   		  box-sizing: border-box;
   		  padding-bottom:20px;
    }
    input::-webkit-input-placeholder { color:#00BFFF; };
    
    import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@800&display=swap');
    
    .bold_font{
    
    		font-family:'Extra-bold 800', serif;
    	}
     
    </style>
    </head>
	<body>   		
		<div class="main" style="white-space: nowrap">
            <section class="module" style="padding:100px;">
            <div class="aside col-sm-4 col-md-3" id="aside">
	                <div class="widget">
	                    <h5 class="widget-title font-alt">???????????????</h5>
	                    <ul class="icon-list">
	                    	<li><a href="${contextPath }/admin/main">???????????????</a></li>
		                  	<li><a href="${contextPath }/product/addproduct">????????????</a></li>
		                  	<li><a href="${contextPath }/product/productListForAdmin">???????????????</a></li>
		                  	<li><a href="${contextPath }/admin/adminmemberlist">????????????</a></li>
		                  	<li><a href="${contextPath }/QnABoard/adminNotice">??????????????????</a></li>
	                  	</ul>
	                </div>
               </div> 
      			<div class="container">
                   <div class="row">
                       <div class="col-sm-8 col-sm-offset-2">
                       	   <div class="form-group">
                               <h4 class="font-alt mb-0 bold_font">?????? ?????? ?????????</h4>
                           </div>
                           <div role="tabpanel">
                               <ul class="nav nav-tabs font-alt .MenuList" role="tablist">
                   		           <li class="active"><a href="#Menubars1" data-toggle="tab"><span class="icon-anchor"></span>??????????????????</a></li>
                 				   <li><a href="#Menubars2" data-toggle="tab"><span class="icon-beaker"></span>?????? ??????</a></li>
                                </ul>
      							<div class="tab-content">
						            <div class="tab-pane active" id="Menubars1">
						                <div class="row" id="proType" style="display:in-block">
							                <form id="frmSelectValue" role="form">
							                	<div class="col-sm-6">
							                		<label for="sl1">?????? ?????? ?????????</label> 
							                		<div class="form-group uploadDivForList">
									                    <input type="file" id="inputFile" name="files">
								                    </div>
								                    <div class="form-group fileUploadResultForList">
							                        	<ul>
							                        		<%-- ????????? ??? ?????? ?????? --%>
							                        	</ul>
								                    </div>
							                   	    <div class="form-group">
							                        	<label for="sl1">?????? ??????</label>
							                        	<label class="sr-only" for="name"></label>
							                        	<input class="form-control" type="text" id="productName" name="productname" value="${productInfo.productName }" placeholder="????????? ???????????? ??????*" required="required"/>
							                        	<%-- <c:if test="${productInfo != null }">
							                        		<input class="form-control" type="text" id="productName" name="productname" value="${productInfo.productName }" placeholder="????????? ???????????? ??????*" required="required"/>
							                        	</c:if> --%>
	                   								</div>
								                    <div class="form-group">
								                   		<label for="sl1">?????? ?????? ??????</label> 
								                        <label class="sr-only" for="text"></label>
								                        <input class="form-control" type="text" id="productBrand" name="productbrand" value="${productInfo.productBrand }" placeholder="????????? ?????? ??????" required="required" maxlength=20/>
								                    </div>
								                     <div class="form-group">
								                   		<label for="sl1">?????? ??????</label> 
								                        <label class="sr-only" for="text"></label>
								                        <input class="form-control" type="text" id="productPrice" value="${productInfo.productPrice }" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" name="productPrice" placeholder="?????? ??????" required="required"/>
								                    </div>
								                    <div class="form-group">
								                    	<label for="sl1">?????? ?????? ??????</label> 
				                                       <div class="form-group">
				                                          <textarea id="productDesc" name="productDesc" style="resize:vertical;" cols="56.5" rows="10"><c:out value="${productInfo.productDesc }"/></textarea>
				                                       </div>   
				                                    </div>
				                                 </div>
				                           	   <div class="col-sm-6">
								                    <div class="form-group">
								                        <label for="sl1">?????? ?????? ?????????</label> 
								                        <div class="form-group uploadDivForDesc">
								                        	<input type="file" id="inputFile" name="files">
								                        </div>
								                        <div class="form-group fileUploadResultForDesc">
								                        	<ul>
								                        		<%-- ????????? ??? ?????? ?????? --%>
								                        	</ul>
								                        </div>
								                    </div>
							                   <div class="form-group">
						                           <div class="form-group">
									                    <label>????????????:</label>
									              	    <select class="form-control" id="category" name="productCategory" onchange="selectCategory()">
										              	 	<option value="body" <c:out value="${productInfo.productCategory eq 'body' ? 'selected' : '' }"/>>????????????</option>
										              	 	<option value="skin" <c:out value="${productInfo.productCategory eq 'skin' ? 'selected' : '' }"/>>????????????</option>
										              	 	<option value="cleansing" <c:out value="${productInfo.productCategory eq 'cleansing' ? 'selected' : '' }"/>>?????????</option>
										              	 	<option value="hair" <c:out value="${productInfo.productCategory eq 'hair' ? 'selected' : '' }"/>>????????????</option>
										              	 	<option value="sun" <c:out value="${productInfo.productCategory eq 'sun' ? 'selected' : '' }"/>>?????????</option>
									                 	</select> 
							                 		</div>
						                        </div>
						               			<div class="form-group">
							                       <label>?????? ????????????:</label> 
					                       			<select class="form-control subcategory" id="catebody" name="productSubCategory"> 
								                       <option value="bodywash" <c:out value="${productInfo.productSubCategory eq 'bodywash' ? 'selected' : '' }"/>>????????????</option> 
								                       <option value="bodylotion" <c:out value="${productInfo.productSubCategory eq 'bodylotion' ? 'selected' : '' }"/>>????????????</option> 
								                       <option value="bodyoil" <c:out value="${productInfo.productSubCategory eq 'bodyoil' ? 'selected' : '' }"/>>????????????</option>
								                       <option value="handcream" <c:out value="${productInfo.productSubCategory eq 'handcream' ? 'selected' : '' }"/>>????????????/?????????</option>
							                       </select>
					                       		
					                       			<select class="form-control subcategory" id="cateskin" name="productSubCategory"> 
								                       <option value="toner" <c:out value="${productInfo.productSubCategory eq 'toner' ? 'selected' : '' }"/>>??????/??????</option> 
								                       <option value="lotion" <c:out value="${productInfo.productSubCategory eq 'lotion' ? 'selected' : '' }"/>>??????/?????????</option> 
								                       <option value="serum" <c:out value="${productInfo.productSubCategory eq 'serum' ? 'selected' : '' }"/>>?????????/??????/??????</option>
								                       <option value="cream" <c:out value="${productInfo.productSubCategory eq 'cream' ? 'selected' : '' }"/>>??????</option>
							                       </select>
					                       		
					                       			<select class="form-control subcategory" id="catecleansing" name="productSubCategory">
								                       <option value="cleansingform" <c:out value="${productInfo.productSubCategory eq 'cleansingform' ? 'selected' : '' }"/>>????????????</option> 
								                       <option value="cleansinggel" <c:out value="${productInfo.productSubCategory eq 'cleansinggel' ? 'selected' : '' }"/>>????????????</option> 
								                       <option value="cleansingwater" <c:out value="${productInfo.productSubCategory eq 'cleansingwater' ? 'selected' : '' }"/>>???????????????</option>
								                       <option value="cleansingoil" <c:out value="${productInfo.productSubCategory eq 'cleansingoil' ? 'selected' : '' }"/>>???????????????</option>
								                       <option value="cleansingtissue" <c:out value="${productInfo.productSubCategory eq 'cleansingtissue' ? 'selected' : '' }"/>>???????????????</option>
							                       </select>
					                       		
					                       			<select class="form-control subcategory" id="catehair" name="productSubCategory"> 
								                       <option value="shampoo" <c:out value="${productInfo.productSubCategory eq 'shampoo' ? 'selected' : '' }"/>>??????</option> 
								                       <option value="rinse" <c:out value="${productInfo.productSubCategory eq 'rinse' ? 'selected' : '' }"/>>???????????????/??????</option> 
								                       <option value="hairessence" <c:out value="${productInfo.productSubCategory eq 'hairessence' ? 'selected' : '' }"/>>???????????????</option>
							                       </select>
					                       		
					                       			<select class="form-control subcategory" id="catesun" name="productSubCategory"> 
								                       <option value="suncream" <c:out value="${productInfo.productSubCategory eq 'suncream' ? 'selected' : '' }"/>>?????????</option> 
								                       <option value="sunstick" <c:out value="${productInfo.productSubCategory eq 'sunstick' ? 'selected' : '' }"/>>?????????</option> 
							                       </select>
							                   </div>                    
							                   <div class="form-group">
								                    <label for="sl1">?????? ??????</label>
								              	    <select class="form-control" id="skintypeid" name="skintypeid">
									              	 	<option value="1" <c:out value="${productInfo.skintypeid eq '1' ? 'selected' : '' }"/>>??????</option>
									              	 	<option value="2" <c:out value="${productInfo.skintypeid eq '2' ? 'selected' : '' }"/>>??????</option>
									              	 	<option value="3" <c:out value="${productInfo.skintypeid eq '3' ? 'selected' : '' }"/>>?????????</option>
								                 	</select> 
							                 	</div>
							                 	<div class="form-group">
								                    <label for="sl1">??????</label><br>
								              	    <input class="form-control" type="text" value="${productInfo.productStock }" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" id="productStock" name="productStock" placeholder="?????? ??????" required="required"/>
							                 	</div>
							                 </div>
							                 	</form>
							                 	<button class="btn btn-block btn-round btn-d" id="productsubmit">????????????</button>
							             		<h4 class="font-alt mb-0"></h4>
										 </div><!--  /row -->
								     </div>
											<!-- ?????? ?????? ?????? -->
                    			        <div class="tab-pane" id="Menubars2">
                        			    	<div class="row" id="proIngre">
	                        			    	<form role="form">
								                  <div class="col-sm-6 search-box compKeywordDiv">
								                  	<label for="keyword" style="padding:left">????????? ?????? ??????</label>
								                    <input class="form-control" type="text" name="compKeyword" placeholder="???????????? ???????????????."/>
								                  </div>
								                  <div class="col-sm-6 search-box keywordform">
                                                    <label for="keyword">????????? ?????? ??????</label>
                                                    <input class="form-control" type="text" name="selectedCompKeyword" placeholder="???????????? ???????????????." onkeyup="search2(this);"/>
                                                  </div>
								                </form><br>
		            					    	<div class="col-sm-6 nonSelectComp" style="overflow:auto; height:500px; border: 1px solid #bcbcbc;">
		            					    		<h4>?????? ??????</h4>
							                    	 
                                                </div>
                                                <div class="col-sm-6 selectedComp" style="overflow:auto; height:500px; border: 1px solid #bcbcbc;">
                                               		<h4>????????? ??????</h4>
                                                	<c:forEach items="${componentList }" var="comp">
							                    	 	<c:if test="${comp.productId > 0 }">
							                    	 		<li style="font-size: 15px;">
									                        	<input type="checkbox" class="selectComponent" name="component" value="${comp.comno }" checked>&nbsp;${comp.comname }
									                     	</li>
							                    	 	</c:if>
								                    </c:forEach>
                                                </div>
                            			    </div><!-- /row -->
                          				</div>
						             <form id="frmSendValue">
						             	<sec:csrfInput/>
						             	<input type="hidden" name="productId" value="${productInfo.productId }">
						             	<input type="hidden" name="productName" value="">
						             	<input type="hidden" name="productPrice" value="">
						             	<input type="hidden" name="productCategory" value="">
						             	<input type="hidden" name="productSubCategory" value="">
						             	<input type="hidden" name="productBrand" value="">
						             	<input type="hidden" name="productDesc" value="">
						             	<input type="hidden" name="productStock" value="">
						             	<input type="hidden" name="skintypeid" value="">
						             </form>
						         </div>
						     </div>
						 </div><!--/container  -->
                     </div>
                 </div>
             </section>
         </div>  <!-- /main -->
     </body>
<script>
	
	var productId=$("input[name='productId']").val();
	var ImageID;
	var category=$("#category option:selected").val();
	var subCategory;
	var InputFileCloneForList=$(".uploadDivForList").clone();
	var InputFileCloneForDesc=$(".uploadDivForDesc").clone();
	var csrfHeaderName = "${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";
	selectCategory();
	
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
    
    $(".uploadDivForList").on("change", "input[type='file']", function(e){
    	var formData=new FormData();
    	
    	var inputFile=$(this);
    	var files=inputFile[0].files;
    	ImageID=parseInt(1);
    	
    	if(!checkUploadfile(files[0].name, files[0].size)){
    		$(".uploadDivForList").html(InputFileCloneForList.html());
    		return false;
    	} else {
    		formData.append("uploadFiles", files[0]);
    		formData.append("ImageID", ImageID)
    	}
    	
    	$.ajax({
    		type:'post',
    		url:'${contextPath}/fileUploadAjaxAction',
    		processData: false,
    		contentType: false,
    		data: formData,
    		dataType:'json',
    		beforeSend:function(xhr){
	    		 xhr.setRequestHeader(csrfHeadername, csrfTokenValue);
	    	 },
    		success:function(uploadResult, status){
    			console.log(InputFileCloneForList);
    			$(".uploadDivForList").html(InputFileCloneForList.html());
    			showUploadedFiles(uploadResult);
    		}
    	});	
    });
    
    $(".uploadDivForDesc").on("change", "input[type='file']", function(e){
    	var formData=new FormData();
    	
    	var inputFile=$(this);
    	var files=inputFile[0].files;
    	ImageID=parseInt(2);
    	
    	if(!checkUploadfile(files[0].name, files[0].size)){
    		$(".uploadDivForDesc").html(InputFileCloneForDesc.html());
    		return false;
    	} else {
    		formData.append("uploadFiles", files[0]);
    		formData.append("ImageID", ImageID)
    	}
    	
    	$.ajax({
    		type:'post',
    		url:'${contextPath}/fileUploadAjaxAction',
    		processData: false,
    		contentType: false,
    		data: formData,
    		dataType:'json',
    		beforeSend:function(xhr){
	    		 xhr.setRequestHeader(csrfHeadername, csrfTokenValue);
	    	 },
    		success:function(uploadResult, status){
    			$(".uploadDivForDesc").html(InputFileCloneForDesc.html());
    			showUploadedFiles(uploadResult);
    		}
    	});	
    });
    	
    
    function checkUploadfile(fileName, fileSize){
    	var maxSizeAllowed=1048576;
    	var regExpForFileExtention=/(.*)\.(jpg|png|jpeg|gif|bmp)$/i;
    	
    	if(fileSize>=maxSizeAllowed){
    		alert("????????? ????????? ????????? ????????? ??????????????????.");
    		return false;
    	}
    	
    	if(!regExpForFileExtention.test(fileName)){
    		alert("???????????? ????????? ????????? ????????? ??? ??? ????????????.");	
    		return false;
    	} else {
    		return true;
    	}
    }
    
    function showUploadedFiles(uploadResult) {
    	 
    	if(!uploadResult || uploadResult.length==0){
    		return;
    	} 
    	
    	var fileUploadResult;

	    var str = "";
	    
	    //???????????? ???????????? ????????? ????????? ?????????
	    $(uploadResult).each(function(i, obj) {
	    	if(uploadResult[i].filename.includes("ImageForList")){
	    		fileUploadResult = $(".fileUploadResultForList ul");
	    	} else {
	    		fileUploadResult = $(".fileUploadResultForDesc ul");
	    	}
		    var thumbnailFilePath =
		    encodeURIComponent(obj.repoPath + "/" + obj.uploadpath + "/s_" + obj.uuid + "_" + obj.filename);
		
			    str = "<li data-uploadpath='" + obj.uploadpath + "'"
			    + " data-uuid='" + obj.uuid + "'"
			    + " data-filename='" + obj.filename + "' >"
			    + " <img src='${contextPath}/displayThumbnailFile?fileName=" + thumbnailFilePath + "'"
			    + " alt='No Icon' style='height: 250px; width: 250px;'>"
			    + "<br>" + obj.filename
			    + " <span data-filename='" + thumbnailFilePath + "'>[??????]</span>"
			    + "</li>" ;
			    
			fileUploadResult.html(str);
		    });                 //end $(uploadResult).each(function(){})
    }
    
    //?????? ??????
    $(".fileUploadResultForList").on("click","span", function(e){
    	 //this: span
    	 var targetFileName = $(this).data("filename");

    	 //span??? ????????? li ????????? ??????
    	 var parentLi = $(this).parent();
    	 //var targetLi = $(this).closest("li");

    	 $.ajax({
	    	 url: '${contextPath}/deleteUploadedFile',
	    	 data: {fileName: targetFileName},
	    	 dataType:'text',
	    	 type: 'post',
	    	 beforeSend:function(xhr){
	    		 xhr.setRequestHeader(csrfHeadername, csrfTokenValue);
	    	 },
	    	 success: function(result){
	    	 	if (result == "SuccessDeletingFile"){
	    	 		alert("????????? ?????????????????????.");
			    	 
	    	 		parentLi.remove();

		    	 } else {
		    	 	alert("??????: ?????? ?????? ??????.");
		    	 }
    	 	}
    	}); //End $.ajax
    });
    
    $(".fileUploadResultForDesc").on("click","span", function(e){
   	 var targetFileName = $(this).data("filename");

   	 var parentLi = $(this).parent();

   	 $.ajax({
	    	 url: '${contextPath}/deleteUploadedFile',
	    	 data: {fileName: targetFileName},
	    	 dataType:'text',
	    	 type: 'post',
	    	 beforeSend:function(xhr){
	    		 xhr.setRequestHeader(csrfHeadername, csrfTokenValue);
	    	 },
	    	 success: function(result){
	    	 	if (result == "SuccessDeletingFile"){
	    	 		alert("????????? ?????????????????????.");
			    	parentLi.remove();
		    	 } else {
		    	 	alert("??????: ?????? ?????? ??????.");
		    	 }
   	 	}
   	}); //End $.ajax
   });
    
    //?????? ?????? ??? ???????????? ?????????
    $(document).on("change", "input[type='checkbox']", function(){
    	var selectComp=$(this).closest("li").clone();
    	$(this).closest("li").remove();
   		
    	if($(this).is(":checked")){
    		$(".selectedComp").append(selectComp);
    	} else {
    		$(".nonSelectComp").append(selectComp);	
    	}
    });
    
    function search2(keyword){
        var keyword=$(keyword).val();
        
        $(".selectedComp li").hide();
         var temp2 = $(".selectedComp li:contains('" + keyword + "')");
         
         $(temp2).show();
     }
    
  	//?????? ????????????
    $("input[name='compKeyword']").keydown(function(key){
     
    var keyword = $("input[name='compKeyword']").val();
    if (window.event.keyCode == 13) {
    	if(keyword.length<1 || keyword==""){
        	alert("???????????? 2?????? ?????? ??????????????????.");
        	return false;
        }

         $.ajax({
             type:'get',
             dataType : 'json',
             url : '${contextPath}/product/searchComponent',
             data: {keyword : keyword},
             error: function(error){
                 console.log("search?????? ?????? ??????");
             },
             success: function(complist){
                 $(".nonSelectComp li").hide();

                 var compstr="";
                 
                 $(complist).each(function(i, obj) {
                	 compstr+="<li style='font-size: 15px;'>"
                       +"<input type='checkbox' class='searchedComp' name='component' value='" +obj.comno+ "'>&nbsp;"
                       +obj.comname
                       +"</li>";
       		    	}); 

                 $(".nonSelectComp").children("h4").html(compstr);
             }
         
      });
    }
  });
    
    $("#productsubmit").on("click", function(e){
    	var frmSelectValue=$("#frmSelectValue");
    	
    	if(frmSelectValue.find("input[type='text']").val()=="" || frmSelectValue.find("textarea[name='productDesc']").val()==""){
    		alert("?????? ?????? ????????? ????????? ??????????????????.");
    		return false;
    	} else if($(".fileUploadResultForList ul li").length==0 || $(".fileUploadResultForDesc ul li").length==0){
    		alert("??????????????? ????????? ??????????????????.");
    		return false;
    	} else if($(".selectedComp").find("input[type='checkbox']:checked").length==0){
    		alert("????????? ???????????? ?????????????????????.");
    		return false;
    	}
    		
    	var frmSendValue=$("#frmSendValue");
    	var strInputHidden;
    	var compList;

    	$("input[type='checkbox']:checked").each(function(i){
    		compList +=" <input type='hidden' name='compList["+i+"].comno' value='"+ $(this).val() +"'>";
    	});
    	
    	
    	var productName=$("#productName").val();
    	var productBrand=$("#productBrand").val();
    	var productDesc=$("#productDesc").val();
    	var productPrice=$("#productPrice").val();
    	var productSubCategory=$(subCategory, "option:selected").val();
    	var productStock=$("#productStock").val();
    	var skintypeid=$("#skintypeid option:selected").val();
    	
    	
    	frmSendValue.find("input[name='productName']").val(productName);
    	frmSendValue.find("input[name='productPrice']").val(productPrice);
    	frmSendValue.find("input[name='productCategory']").val(category);
    	frmSendValue.find("input[name='productSubCategory']").val(productSubCategory);
    	frmSendValue.find("input[name='productBrand']").val(productBrand);
    	frmSendValue.find("input[name='productDesc']").val(productDesc);
    	frmSendValue.find("input[name='productStock']").val(productStock);
    	frmSendValue.find("input[name='skintypeid']").val(skintypeid);
    	
    	$(".fileUploadResultForList ul li").each(function(i, obj){
    		var objLi=$(obj);
    		console.log(objLi);
    		
	    	strInputHidden
	       	 +=" <input type='hidden' name='attachFileList[0].uuid' value='"+objLi.data("uuid")+"'>"
	       	 + " <input type='hidden' name='attachFileList[0].uploadpath' value='"+objLi.data("uploadpath")+"'>"
	       	 + " <input type='hidden' name='attachFileList[0].filename' value='"+objLi.data("filename")+"'>";
	       	 
    	});
    	
    	$(".fileUploadResultForDesc ul li").each(function(i, obj){
    		var objLi=$(obj);
    		console.log(objLi);
    		
	    	strInputHidden
	       	 +=" <input type='hidden' name='attachFileList[1].uuid' value='"+objLi.data("uuid")+"'>"
	       	 + " <input type='hidden' name='attachFileList[1].uploadpath' value='"+objLi.data("uploadpath")+"'>"
	       	 + " <input type='hidden' name='attachFileList[1].filename' value='"+objLi.data("filename")+"'>";

    	});
    	
    	frmSendValue.append(strInputHidden);
    	frmSendValue.append(compList);
    	frmSendValue.attr("method", "post");
    	frmSendValue.attr("action", "${contextPath}/product/modifyProduct");
    	frmSendValue.submit();
    });
    
    $(document).ready(function(){//????????? ?????? ??? ?????? ?????? ?????? JavaScript ?????? ??? ?????? ???????????? ???????????? ???
    	 //???????????? ????????? ???????????? Ajax.
    	 $.ajax({
	    	 type: 'get',
	    	 url: '${contextPath}/product/getFilesForModify',
	    	 data: {productId : parseInt(productId)},
	    	 dataType: 'json',
	    	 beforeSend:function(xhr){
	    		 xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
	    	 },
	    	 success: function(fileList, status){
	    	 	console.log("???????????? ?????? ??????: " + status);
	    	 	console.log(fileList);
	    	 	showUploadedFiles(fileList);
	    	 }
    	 }); //ajax end
    });
	
	</script>
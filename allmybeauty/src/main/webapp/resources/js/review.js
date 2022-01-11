/**
 * 
 */
 	/*리뷰 작성 모달*/
	const openReview = document.getElementById("RegRev");
    const modalr = document.querySelector(".modalr");
    const overlayr = modalr.querySelector(".modal__overlay");
    const closeBtnr = document.getElementById("CancleRv");
	const Mfile = document.getElementsByClassName("fileUploadResult");
	/*리뷰 수정 모달*/
	//const openReview = document.getElementById("RegRev");
    const modalc = document.querySelector(".modalc");
    //const overlayr = modalr.querySelector(".modal__overlay");
    const closeBtnc = document.getElementById("CancleRvC");

    const revqconter = document.getElementById("revqconter");
    const rcontentreg = document.getElementById("rcontentreg");

	const rcontentcor	 = document.getElementById("rcontentcor");
	const revqconters = document.getElementById("revqconters");

        
	/*모달 생성*/
    /*const openModalr = () =>{
        modalr.classList.remove("hidden");
    }*/	

    /*리뷰 모달 닫기*/
    const closeModalr = () => {
        modalr.classList.add("hidden");
        console.log(rcontentreg.value);

            rcontentreg.value = "";
			revqconter.innerHTML = 0;
			$("#inputFilefi").val("");
			$(".imgsh").html('');
        
		 //$(this).find('.fileUploadResult')[0].reset();
		//$("#inputFile").html('');
		
    }

	/*리뷰 수정 모달 닫기*/
	 const closeModalc = () => {
    		modalc.classList.add("hidden");
			rcontentcor.value = "";
			revqconters.innerHTML = 0;
			$("#inputFilese").val("");
			$(".ImgbtnCan").remove();
			$(".imgsh").html('');
    }

    closeBtnr.addEventListener("click", closeModalr);
	closeBtnc.addEventListener("click", closeModalc);
	//openReview.addEventListener("click", openModalr);
	
	//Javascript
/*	function scrollDisable(){
	    $('.main').addClass('scrollDisable').on('scroll touchmove mousewheel', function(e){
	        e.preventDefault();
	    });
	}
	function scrollAble(){
	    $('body').removeClass('scrollDisable').off('scroll touchmove mousewheel');
	}*/
	
	
	/*리뷰 등록 버튼 클릭 로그인 안 되있을 경우 막기*/
    openReview.addEventListener("click", function(){
			const mid = $(this).data("mid");
			//modalr.classList.remove("hidden");
			//location.href = "/allmybeauty/member/myLogin";
		/*	$('.main').addClass('scrollDisable').on('scroll touchmove mousewheel', function(e){
	        e.preventDefault();
	    });*/
				if(mid == null || mid == ""){
						location.href = "/allmybeauty/member/myLogin";
				} else{
						modalr.classList.remove("hidden");
				}
			});
	
	/*리뷰 등록 버튼 이벤트*/
    function BtnRev(){
		
        const rcontent = $("#rcontentreg").val();
		console.log("r:" + rcontent);
        const productid = $("#gdasSeq").val();
        const mid = $(".reviewmid").val();
		//const rfilename = frmreview.rfilename.value;
		/*const rcontent =  $("#rcontentreg").val();
		console.log("rcontent" + rcontent);*/
		var uuid = [];
		var uploadpath = [];
		var filename = [];
		var fileurl=[];
		$(".fileUploadResult ul li").each(function(i, obj){
			var obj = $(obj);
			console.log("obj : " + obj);
		
		var data = {	
			uuid : obj.data("uuid"),
			uploadpath : obj.data("uploadpath"),
			filename : obj.data("filename")
			}
			/*fileurl[i].uuid=uuid;
			fileurl[i].uploadpath=uploadpath;
			fileurl[i].filename=filename;*/
			
			fileurl.push(data);
		});
		
		if(fileurl.length > 3){
			alert("사진은 3장 이내로 올려주세요");
			return false;
		}
		
		console.log("uuid" + uuid);
		console.log("uploadpath" + uploadpath);
		console.log("filename" + filename);
		console.log("fileurl : " + fileurl);
		
		
        if(rcontent.length == "" || rcontent == 0){
            alert("후기내용을 입력해주세요");
        } else if(productid.length == "" ){
            alert("취소했다가 다시 작성을 해주세요");
        }

/*		const revValue = {productid : productid,
					mid : mid,
					rcontent : rcontent,
					fileurl : fileurl.uuid,
					fileurl : fileurl.uploadpath,
					fileurl : fileurl.filename
					};*/
		$.ajax({
			type: 'post',
			enctype: 'multipart/form-data',
			url: "/allmybeauty/replies/" + productid + "/new",
			data: JSON.stringify({"productid" : productid,
					"mid" : mid,
					"rcontent" : rcontent,
					"fileurl" : fileurl
					}),
			contentType: "application/json; charset=utf-8",
			success: function(result){
				if(result == "게시물의 댓글 등록 성공"){
					showCmtList(1);
					modalr.classList.add("hidden");
					rcontentreg.value = "";
					revqconter.innerHTML = 0;
					$("#inputFilefi").val("");
					$(".imgsh").html('');
				}	
			},
			error: function(xhr, status, er){
				if(error){
					error(er);
				}
			}
		});
        
}
	
	/*리뷰 작성 글자수 실시간*/
    function revcounters(){
        
        revqconter.innerHTML = rcontentreg.value.length;
        if( rcontentreg.value.length > 500){
            alert("500자 이내로 작성해주세요");
			rcontentreg.value = rcontentreg.value.substring(0,500);
			return false;
        }
    }

	/*리뷰 수정 글자수 실시간*/
   function revcounter(){
        revqconters.innerHTML = rcontentcor.value.length;
        if(rcontentcor.value.length > 500){
            alert("500자 이내로 작성해주세요");
			rcontentcor.value = rcontentcor.value.substring(0,500);
			revqconters.innerHTML = 500;
			return false;
        }
    }

	
	
	/*리뷰 수정*/
	$(document).on("click", ".reviewReg", function(){
		modalc.classList.remove("hidden");
		
		/*스크롤 막기*/
		/*$('.main').addClass('scrollDisable').on('scroll touchmove mousewheel', function(e){
	        e.preventDefault();
	    });*/

		const rnodata = $(this).data("rno");
		$("#revrno").val(rnodata);	
		
		const rnoText = $(this).siblings(".reviewList").text();
		console.log("ffffff" + rnoText);
		$("#rcontentcor").val(rnoText);
		
		const rno = $(this).data("rno");
		$("#reviewMdRno").val(rno);
		
		var reviewImg = $(this).siblings(".imageup").clone();
		reviewImg.attr("class", "imgCloneClass");
		const reviewButton = "<p><button class = 'ImgbtnCan' type = 'button'>삭제</button> </p>";
		$(".imgsh").append(reviewImg);
		$(document).find(".imgCloneClass").append(reviewButton);
	});
	
	/*리뷰 수정 이미지 삭제*/
/*	$(document).on("click", ".ImgbtnCan", function(){
		//$(this).parent(".revImg").clone();
		alert("하이하잏아힝");
		//$(this).parent(".imgCloneClass").remove();
			 
	});*/
	
	/*리뷰 수정 최종 클릭*/
	function BtnRevC(){

		
        const rcontent = $("#rcontentcor").val();
        const productid = $("#reviewMdPro").val();
        const mid = $("#reviewMdMid").val();
		const rno = $("#reviewMdRno").val();
		
		
		var uuid = [];
		var uploadpath = [];
		var filename = [];
		var fileurl= [];
		$(".fileUploadResults ul span").each(function(i, obj){
			var obj = $(obj);
			console.log("obj : " + obj);
		
		var data = {	
			uuid : obj.data("uuid"),
			uploadpath : obj.data("uploadpath"),
			filename : obj.data("filename")
			}
			
			fileurl.push(data);
		});
		
		if(fileurl.length > 3){
			alert("사진은 3장 이내로 올려주세요");
			return false;
		}
		console.log("uuid" + uuid);
		console.log("uploadpath" + uploadpath);
		console.log("filename" + filename);
		console.log("fileurl : " + fileurl);

		$.ajax({
			type: 'put',
			enctype: 'multipart/form-data',
			url: "/allmybeauty/replies/" + productid + "/" + rno,	
			data: JSON.stringify({"productid" : productid,
					"mid" : mid,
					"rno" : rno,
					"rcontent" : rcontent,
					"fileurl" : fileurl
					}),
			contentType: "application/json; charset=utf-8",
			success: function(result){
				if(result == "댓글 수정 성공"){
					showCmtList(1);
					modalc.classList.add("hidden");
					rcontentreg.value = "";
					revqconter.innerHTML = 0;
					$("#inputFilese").val("");
					$(".imgsh").html('');
				}
			},
			error: function(xhr, status, er){
				if(error){
					error(er);
				}
			}
		});
}

	/*리뷰 삭제*/
	function reviewCan(){
		
		const rno = $("#reviewList").data("rno");
		const mid = $("#reviewList").data("mid");
		const productid = $("#reviewList").data("productid");
		$.ajax({
			type:"delete",
			url : "/allmybeauty/replies/" + productid + "/" + rno,
			data : JSON.stringify({productid:productid, rno:rno, mid:mid}),
			contentType : "application/json; charset=utf-8",
			success : function(removeResult, status, xhr){
				alert("리뷰가 삭제되었습니다");
				showCmtList(1);
			},
			error : function(xhr, status, er){
				if(error){
					error(er);
				}
			}
		});
	}
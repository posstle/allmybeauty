/**
 * 
 */
/**
 * 
 */

var commentClsr = (function(){
	
	function getCmtList(pagingParams, callback, error){
		var productid = pagingParams.productid
		var page = pagingParams.page || 1;
		
		console.log(productid + page);
		
		$.ajax({
			type: 'get',
			url: "/allmybeauty/replies/pages/" + productid + "/" + page,
			dataType: 'json',
			success: function(replyPagingCreator, status, xhr){
				if(callback){
					callback(replyPagingCreator);
				}
				
			},

			error: function(xhr, status, er){
				if(error){
					error(er);
				}
			}
		});
	}

	//후기 등록
	function registerCmt(comment, callback, error){
		var productid = comment.productid;
		
		$.ajax({
			type: 'post',
			enctype: 'multipart/form-data',
			url: "/allmybeauty/replies/" + productid + "/new",
			data: JSON.stringify(comment),
			contentType: "application/json; charset=utf-8",
			success: function(result, status, xhr){
				if(callback){
					callback(result);
				}
			},
			error: function(xhr, status, er){
				if(error){
					error(er);
				}
			}
		});
	}
	
	//파일 첨부
	function registerFile(file, callback, error){

		var productid = file.productid;
		//var filetype = file.filetype;
		var formData = file.formData;
		
		$.ajax({
			type : "post",
			url : "/allmybeauty/replies/" + productid + "/new", // + "/" + file 
			data : formData,
			enctype:'multipart/form-data',
			contentType: false,
			processData : false,
			success : function(uploadResult, status){
				if(callback){
					callback(uploadResult);
				}
			},
			error : function(xhr, status,er){
				if(error){
					error(er);
				}
			}
		});
		
	}
	
	//답글 등록
	function registerReply(reply, callback, error){
		var productid = reply.productid;
		var prno = reply.prno;
		
		$.ajax({
			type: "post",
			url: "/allmybeauty/replies/" + productid + "/" + prno + "/new",
			data: JSON.stringify(reply),
			contentType: "application/json; charset=utf-8",
			dataType: 'text',
			success: function(result, status, xhr){
				if(callback){
					callback(result);
				}
			},
			error: function(xhr, status, er){
				if(error){
					error(er);
				}
			}
		});
	}
	
	//후기 조회
	function getCmtReply(productidrno, callback, error){
		var productid = productidrno.productid;
		var rno = productidrno.rno;
		
		$.get("/allmybeauty/replies/" + productid + "/" + rno + ".json",
			function(result){
				if(callback){
					callback(result);
				}
			}
		).fail(function(xhr, status, err){
			if(error){
				error();
			}
		});
	}
	
	//후기 수정
	function modifyCmtReply(comment, callback, error){
		var productid = comment.productid;

		var rno = comment.rno;

		$.ajax({
			type: "put",
			url: "/allmybeauty/replies/" + productid + "/" + rno,
			data: JSON.stringify(comment),
			contentType: "application/json; charset=utf-8",
			dataType: "text",
			success: function(modifyResult, status, xhr){
				if(callback){
					callback(modifyResult);
				}
			},
			error: function(xhr, status, er){
				if(error){
					error(er);
				}
			}
		});
	}
	
	//리뷰 삭제
	function deleteCmtReply(comment, callback, error){
		var productid = comment.productid;
		console.log("comment productid" + productid);
		var rno = comment.rno;
		var mid = comment.mid;
		$.ajax({
			type:"delete",
			url : "/allmybeauty/replies/" + productid + "/" + rno,
			data : JSON.stringify({productid:productid, rno:rno, mid:mid}),
			contentType : "application/json; charset=utf-8",
			success : function(removeResult, status, xhr){
				if(callback){
					callback(removeResult);
				}
			},
			error : function(xhr, status, er){
				if(error){
					error(er);
				}
			}
		});
	}
	
	
	//날짜 형식 설정
		function showDateTime(datetimeValue){
			var dateObj = new Date(datetimeValue);
			var str = "";
			
			var yyyy = dateObj.getFullYear();
			var mm = dateObj.getMonth() + 1;
			var dd = dateObj.getDate();
			
			str= [yyyy, '/',
				 (mm > 9 ? '' : '0') + mm, '/',
				 (dd > 9 ? '' : '0') + dd].join('');
		
			return str;
		}
		
		
	
	
	
	return{
		getCmtList : getCmtList,
		registerCmt : registerCmt,
		registerReply : registerReply,
		getCmtReply : getCmtReply,
		modifyCmtReply : modifyCmtReply,
		showDateTime : showDateTime,
		deleteCmtReply : deleteCmtReply,
		registerFile : registerFile
	};
})();
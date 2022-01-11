/**
 * 댓글/답글 데이터 처리용 Ajax Closure Module 
 */

var myCommentClsr = ( function(){
	
	function getCmtList(pagingParams, callback, error){
		
		var bno = pagingParams.bno;
		var page = pagingParams.page || 1;
		
		/*console.log("getCmtList()가 전달받은 bno: " + bno) ;
		console.log("getCmtList()가 전달받은 page: " + page) ;
 		console.log("getCmtList()함수의 ajax 처리 시작...................."); */
		$.ajax({	type: 'get',
					url: "/allmybeauty/qnaReplies/pages/" + bno + "/" + page,
					dataType: 'json',
					success : function(bCommentPagingCreator, status, xhr){
							   if(callback){
									callback(bCommentPagingCreator);
							}
					},
					
					error : function(xhr, status, er){
								if(error){
									error(er);
								}
					}
				   }
				);//.ajax END
				
	}//getCmtList END
	
	function registerCmt(comment, callback, error){
		var bno = comment.bno;
		/*console.log("registerCmt()에 전달된 bno: " + bno);
		console.log("registerCmt() 함수의 comment등록 ajax 처리 시작..........."); */
		
		$.ajax({ type:"post",
				 url: "/allmybeauty/qnaReplies/" + bno + "/new",
				 data: JSON.stringify(comment),
				 contentType: "application/json; charset=utf-8",
				 success : function(result, status, xhr){
								if(callback){
									callback(result);
								}
							},
				 error : function(xhr, status, er){
							if(error){
									error(er);
							}
						}
				}
		);//.ajax END	
/*	console.log("ajax함수 실행 성공");*/
	}//registerCmt 함수 END
	
	//답글 등록
	function registerReply(reply, callback,error){
		var bno = reply.bno;
		var creply = reply.creply
		/*console.log("registerReply()에 전달받은 bno: " + bno);
		console.log("registerReply()에 전달받은 creply: "+ creply);
		console.log("registerReply()함수의 댓글에 대한 답글 등록 .ajax 처리 시작...");*/
		
		$.ajax( { type: "post",
				  url: "/allmybeauty/qnaReplies/"+ bno + "/" + creply + "/new",
				  data: JSON.stringify(reply),
				  contentType : "application/json; charset=utf-8",
				  dataType: 'text',
				  success : function(result, status, xhr){
								if(callback){
										callback(result);
								}
							},
				  error : function(xhr, status, er){
								if(error){
									error(er);
								}
							}
				}
		);//.ajax END
	}//registerReply함수 END
	
	//댓글 조회
	function getCmtReply(bnoAndCno, callback, error){
		
		var bno = bnoAndCno.bno;
		var cno = bnoAndCno.cno;
		/*console.log("getCmtReply에서 전달받은 bno: " + bno);
		console.log("getCmtReply에서 전달받은 cno: " + cno);
		console.log("getCmtReply에서 댓글 조회 .ajax 처리 시작.........");*/
		
		$.get("/allmybeauty/qnaReplies/" + bno + "/" + cno + ".json",
			function(result){
				if (callback){
					callback(result);
				}
			}).fail(function(xhr, status, err){
						if(error){
							error();
						}
			});//fail END
	}//getCmtReply 함수 END
	
	//댓글 수정: 특정 댓글을 서버로 전송
	function modifyCmtReply(comment, callback, error){
		
		var bno = comment.bno;
		var cno = comment.cno;
	/*	console.log("modifCmtReply() 전달받은 bno: " + bno + " 전달받은 cno: " + cno);
		console.log("modifCmtReply() 함수의 특정 댓글 수정 ajax 처리 시작.....");*/
		
		$.ajax( {type: "put",
				 url : "/allmybeauty/qnaReplies/" + bno + "/" + cno,
				 data: JSON.stringify(comment),
				 contentType: "application/json; charset=utf-8",
				 dataType: "text",
				 success: function(modifyResult, status, xhr){
							if (callback){
								 callback(modifyResult);
							}
				},
				error: function(xhr, status, er){
							if(error){
								erorr(er);
							}
				}
		});//ajax END
	}//updata END
	
	function removeCmtReply(myCmt, callback, error){
		
		var bno = myCmt.bno;
		var cno = myCmt.cno;
		var mid = myCmt.mid 
	/*	console.log("removeCmtReply() 전달받은bno: " + bno);
		console.log("removeCmtReply() 전달받은cno:  " + cno);
		console.log("removeCmtReply() 전달받은mid:  " + mid);
		console.log("removeCmtReply() 함수의 댓글삭제 ajax시작... ");*/
		
		$.ajax( {type: "delete",
				url: "/allmybeauty/qnaReplies/" + bno + "/" + cno,
				data: JSON.stringify({bno: bno, cno: cno, mid: mid}),
				contentType : "application/json; charset=utf-8",
				success : function(removeResult, status, xhr){
							if(callback){
								callback(removeResult);
							}
				},
				error: function(xhr, status, er){
						if(error){
							error(er);
						}
				}
		}); //ajax END
	}//removeCmtReply 함수 END
	
	function showDatetime(datetimeValue){
	
		var dateObj = new Date(datetimeValue);
		var str = "";
		
		var yyyy= dateObj.getFullYear();
		var mm = dateObj.getMonth() + 1;
		var dd = dateObj.getDate();
		var hh = dateObj.getHours();
		var mi = dateObj.getMinutes();
		var ss = dateObj.getSeconds();
	
		str[yyyy, '/',
			(mm > 9 ? '' : '0') + mm, '/',
			(dd > 9 ? '' : '0') + dd, ' ',
			(hh > 9 ? '' : '0') + hh, ':',
			(mi > 9 ? '' : '0') + mi, ':',
			(ss > 9 ? '' : '0') + ss].join('');
			
			return str;
	}
	return{
		getCmtList : getCmtList,
		registerCmt : registerCmt,
		registerReply : registerReply,
		getCmtReply: getCmtReply,
		modifyCmtReply: modifyCmtReply,
		removeCmtReply: removeCmtReply,
		showDatetime : showDatetime
	};
	
})();//즉시 실행 함수
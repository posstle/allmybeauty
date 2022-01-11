/**
 * 
 */

var myCommentClsr=( function(){
	function getCmtList(pagingParams, callback, error){
		var bno=pagingParams.bno;
		var page=pagingParams.page || 1;
		
		console.log("getCmtList가 전달받은 bno : " + bno);
		console.log("getCmtList가 전달받은 page : " + page);
		console.log("getCmtList ajax처리 시작..............");
		
		$.ajax({	type:'get',
					url:"/mypro00/replies/pages/" + bno + "/" + page,
					dataType:'json',
					success:function(replyPagingCreator, status, xhr){
						if(callback){
							callback(replyPagingCreator);
						}
					},
					error:function(xhr, status, er){
						if(error){
							error(er);
						}
					}
			
			})
	}

	return {
		getCmtList : getCmtList
	};
	
})();


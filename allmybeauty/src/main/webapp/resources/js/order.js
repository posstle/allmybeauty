/**
 * 
 */

function Btnorder(){
/*	const productid = $(".btn_buy").data("productid");
	console.log("productid = " + productid);
	
	const mid = "user5";
	
	const procount = $("#procount").val();
	console.log("procount = " + procount);
	
	const totalPrice = $(".total_price").text();
	console.log("total" + totalPrice);*/
	

	const frmBuy = document.getElementById("frmBuy");
	
	const mid = frmBuy.mid.value;
	
	if(mid == null || mid == ""){
		location.href = "/allmybeauty/member/myLogin";
	}else{
		frmBuy.method = "post";
		frmBuy.submit();	
	}
	
	
/*	const productId = frmBuy.productid.value;

	const totalPrice = frmBuy.toprice.value;

	const cartAmount = frmBuy.amount.value;*/

	
	
	}
/*	$.ajax({
		type:'post',
		url : '/allmybeauty/order/order',
		data : {
			productid : productid,
			mid : mid,
			procount : procount
		},
		success:function(result, status, xhr){
			location.href = "/allmybeauty/order/order";
		},
		error:function(xhr, status, er){
			alert(er);
		}
	});
}*/

function Btncart(){
	const productid = $(".btn_bas").data("productid");
	console.log("productid = " + productid);
	
	const mid = document.getElementById("myId").value;
	console.log("mid" + mid);
	if(mid == null || mid == ""){
		location.href = "/allmybeauty/member/myLogin";
	}
	
	const procount = $("#procount").val();
	console.log("procount = " + procount);
	
	$.ajax({
		type:'get',
		url: '/allmybeauty/cart/inserttocart',
		data : {
			productId : productid,
			mid : mid,
			cartAmount : procount
		},
		success:function(result, status, xhr){
			alert("장바구니에 담겼습니다");
		},
		error:function(xhr, status, er){
			alert(er);
		}
	});
}

$(".thumb").on("click", function(){
	
});


//상품 수량에 따른 가격 변동
	function count(type){
		
		const noprice = $(".noprice").val();
		
		const resultPrice = document.getElementById("procount").value;
		var number = resultPrice;
		
		let totalPrice = $(".total_price").text();
		totalPrice=totalPrice.replace(/,/g,"");

		let resultTotal = 0;

		const productStock = $("#productStock").val();
		console.log("productStock " + productStock);
		console.log("number " + number);
					
		if(type === 'plus'){
			number = parseInt(number) + 1;
			resultTotal = (parseInt(totalPrice) + parseInt(noprice)).toLocaleString('ko-KR');
			
			if(number > 20){
				alert("최대 20개 구매가능합니다");
				return false;
			} else if(productStock < number){
				alert("현재 남은 재고는 " + productStock + "입니다.");
				return false;
			}
		} else if(type === 'minus'){
			resultTotal = (parseInt(totalPrice) - parseInt(noprice)).toLocaleString('ko-KR');
			number = parseInt(number) - 1;
			if(number === 0){
				alert("1개부터 구매 가능합니다");
				number = 1;
				resultTotal = noprice;
			}
		}
		
		
		document.getElementById("procount").value = number;
		$(".total_price").text(resultTotal);
		
		document.getElementById("amount").value = number;
		$("#toprice").val(resultTotal);
		/*$("#procount").val(number);*/
		/*const totalPrice = document.getElementsByClassName("total_price").text();*/	
	}
	
	/*좋아요 클릭에 따른 변화*/
/*	$(document).on("click", "btnTh", function(){
		alert("333");
	});*/
	
	
	/*좋아요 감소*/
	function BtnN(){
		const frmBuy = document.getElementById('frmBuy');
		const productid = frmBuy.productId.value;
		const mid = frmBuy.mid.value;
		
		$.ajax({
			type: 'get',
			url : '/allmybeauty/product/minusThumb',
			data : {
				productId : productid,
				mid : mid
			},
			success : function(result){


				$(".ythumb").css("display", "none");
				$(".nthumb").css("display", "block");
    			$(".nthumb").attr("onclick", "BtnY()");
			}, 
			error : function(er){
				alert(er);
			}
		});
	}
	
	/*좋아요 증가*/
	function BtnY(){
		const frmBuy = document.getElementById('frmBuy');
		const productid = frmBuy.productId.value;
		const mid = frmBuy.mid.value;
		
		console.log("mid = " + mid);
		if(mid == null || mid == ""){
			location.href = "/allmybeauty/member/myLogin";
		}
		
		$.ajax({
			type: 'get',
			url : '/allmybeauty/product/plusThumb',
			data : {
				productId : productid,
				mid : mid
			},
			success : function(result){
				$(".nthumb").css("display", "none");
				$(".ythumb").css("display", "block");
    			$(".ythumb").attr("onclick", "BtnN()");
			}, 
			error : function(er){
				alert(er);
			}
		});
	}


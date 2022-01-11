/**
 * 
 */

 	//const openButtons = document.getElementsByClassName("open_correction");
    const modals = document.querySelector(".modals");
    const overlays = modal.querySelector(".modal__overlay");
    //const closeBtns = document.getElementById("BCancel");


    const modqconter = document.getElementById("modqconter")
    const qcontentmodify = document.getElementById("qcontentmodify")
        
/*    const openModals = () =>{
        modals.classList.remove("hidden");
    }*/
	
	$(document).on("click", ".open_correction", function(){
		modals.classList.remove("hidden");

		const qnoText = $(this).parent(".qlistmid").siblings(".qlist").children(".qconsp").text();
		console.log("qnoText" + qnoText);
		$("#qcontentmodify").val(qnoText);
		
		const qno = $(this).data("qno");
		console.log("rnodata " + qno);
		$(".modifyqno").val(qno);
	});

	
	$(document).on("click", "#BCancel", function(){
		//alert("aaa");
		modals.classList.add("hidden");
		qcontentmodify.empty();
		modqconter.innerHTML = 0;
		
	})
    
/*    const closeModals = () => {
        modals.classList.add("hidden");
        console.log(qcontents.value);
        if(qcontents.value != ""){
            qcontents.value = "";
            //qconter.value = 0;
        }
    }*/

    /*closeBtns.addEventListener("click", closeModals);*/

/*	for (var i = 0; i < openButtons.length; i++) {
	    openButtons[i].addEventListener('click', openModals);
	}*/
    /*openButtons.addEventListener("click", openModals);*/


    function modcounters(){
        
        modqconter.innerHTML = qcontentmodify.value.length;
        if( qcontentmodify.value.length > 200){
            alert("200자 이내로 작성해주세요");
        }
    }

	$(document).on("click", "#BModify", function(){
        const modfrm = document.modfrm;
        const qcontent = modfrm.qcontent.value;
        const productid = modfrm.productid.value;
		const mid = modfrm.mid.value;
		
        //const mid = frmqna.mid.value; || mid.length == ""

        if(qcontent.length == "" || qcontent == 0){
            alert("문의내용을 입력해주세요");
        } else if(productid.length == ""){
            alert("취소했다가 다시 작성을 해주세요");
        }

		modfrm.submit();
});
		/*frmqna.method = "post";
        /*frmqna.action ="allmybeauty/Inquire";
        frmqna.submit();*/
    
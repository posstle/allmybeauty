/**
 * 
 */
    const openButton = document.getElementById("open");
    const modal = document.querySelector(".modal");
    const overlay = modal.querySelector(".modal__overlay");
    const closeBtn = document.getElementById("BCancel");


    const qconter = document.getElementById("qconter")
    const qcontent = document.getElementById("qcontent")
        
    const openModal = () =>{
        modal.classList.remove("hidden");
    }

    
    const closeModal = () => {
        modal.classList.add("hidden");
        console.log(qcontent.value);
        if(qcontent.value != ""){
            qcontent.value = "";
            //qconter.value = 0;
        }
    }

    closeBtn.addEventListener("click", closeModal);

    openButton.addEventListener("click", function(){
             const mid = $(this).data("mid");
			
            if(mid == null || mid == ""){
                  location.href = "/allmybeauty/member/myLogin";
               
            } else{
                  modal.classList.remove("hidden");
            }
         });
      


    function counter(){
        
        qconter.innerHTML = qcontent.value.length;
        if( qcontent.value.length > 200){
            alert("200자 이내로 작성해주세요");
        }
    }

    function btnqna(){
        const frmqna = document.frmqna;
        const qcontent = frmqna.qcontent.value;
        const productid = frmqna.productid.value;
        //const mid = frmqna.mid.value; || mid.length == ""

        if(qcontent.length == "" || qcontent == 0){
            alert("문의내용을 입력해주세요");
        } else if(productid.length == "" ){
            alert("취소했다가 다시 작성을 해주세요");
        }

      /*frmqna.method = "post";*/
        /*frmqna.action ="allmybeauty/Inquire";*/
        frmqna.submit();
    }


 /*관리자 답변 보기*/
   $(document).on("click", ".qconsp", function(){

     $(this).closest(".qboardC").next(".qboardanswer").slideToggle();
	 $(this).closest(".qboardC").next(".qboardanswer").siblings(".qboardanswer").slideUp();
      
     const qno = $(this).data("qno");
     const productid = $(this).data("productid");
      const answer = $(this).closest(".qboardC").next('.qboardanswer').children('.qboardAdAnswer').find('p');
        
      console.log("qno값 : " + qno + productid);
      $.ajax({
         type:'post',
         url : '/allmybeauty/product/selectAnswer',
         data : {"qno" : qno,
             "productid" : productid},
         dataType : 'text',
         success : function(result){
            answer.text(result);
         }
      });
   });
   


   
   
   
   
   
   
   
   
   
   
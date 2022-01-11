package com.spring.allmybeauty.mypage.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.allmybeauty.member.domain.MemberVO;
import com.spring.allmybeauty.mypage.domain.MyPageBoardVO;
import com.spring.allmybeauty.mypage.domain.MyPageQboardVO;
import com.spring.allmybeauty.mypage.domain.MyPageThumbVO;
import com.spring.allmybeauty.mypage.paging.MyPagePagingCreatorDTO;
import com.spring.allmybeauty.mypage.paging.MyPagePagingDTO;
import com.spring.allmybeauty.mypage.service.MyPageService;
import com.spring.allmybeauty.product.cart.service.CartService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/mypage")
public class MyPageController {

	   @Setter(onMethod_ = @Autowired)
	   private MyPageService myPageService;
	   
		@Setter(onMethod_ = @Autowired)
		private CartService cartService ;
		
//		@Autowired
//		private MemberService memberService;

	   @Autowired
	   private BCryptPasswordEncoder  pwEncoder;

	   //회원 상세 페이지
	   @PreAuthorize("isAuthenticated() && principal.username == #memberVO.mid")
	   @GetMapping("/mypagedetail{username}")
		public void showMyPageDetail( @RequestParam("mid") String mid,
				                                         MemberVO memberVO,
	                                            Model model, MyPageThumbVO myPageThumbVO,
	                                                                MyPageBoardVO myPageBoardVO,
	                                                                MyPageQboardVO myPageQboardVO) {
		   
        SecurityContext context = SecurityContextHolder.getContext();
        Authentication authentication = context.getAuthentication();
        
        Object principal = authentication.getPrincipal();
        
        if(principal instanceof  UserDetails) {
		   
        	@SuppressWarnings("unused")
			UserDetails user = (UserDetails) principal;
	      model.addAttribute("mypagemember", myPageService.getMyPageMember(((UserDetails) principal).getUsername()));
	      
	      
	      //좋아요 목록
	      model.addAttribute("MyPageThumbList", myPageService.getMyThumbList(myPageThumbVO));
	      model.addAttribute("MyPageThumbListSize", myPageService.getMyThumbList(myPageThumbVO).size());
	      
	     // log.info("MyPageThumbListSize 값 : " + myPageService.getMyThumbList(myPageThumbVO).size());
	      
	      //1:1게시판 목록
	      model.addAttribute("MyPageBoardList" , myPageService.getMyBoardList(myPageBoardVO));
	      model.addAttribute("MyPageBoardListSize" ,myPageService.getMyBoardList(myPageBoardVO).size());
	      
	      //Q&A게시판 목록
	      model.addAttribute("MyPageQboardList", myPageService.getMyQboardList(myPageQboardVO));
	      model.addAttribute("MyPageQboardListSize", myPageService.getMyQboardList(myPageQboardVO).size());
	     // log.info("(회원상세)컨트롤러 - 화면으로 전달할 model(detail) :" + model);
        }
	      
	   }
	   
	   //로그인 시 회원 상세 페이지(로그인 했을 때 post로 상세페이지 이동)
	   @PreAuthorize("isAuthenticated() && principal.username == #memberVO.mid")
	   @PostMapping("/mypagedetail")
	   public void showMyPageDetailpost( @RequestParam("mid") String mid, 
	                                            Model model, MemberVO memberVO) {

	      model.addAttribute("mypagemember", myPageService.getMyPageMember(mid));
	     
	      //log.info("(회원상세)컨트롤러 - 화면으로 전달할 model(detail) :" + model);
	      
	   }
	   
	   
	   //회원 수정페이지 호출 
	   @PreAuthorize("isAuthenticated() && principal.username == #memberVO.mid")
	   @GetMapping("/mypagemodify")
	   public String showMyPageModify(String mid,
	                                              Model model, MemberVO memberVO) {
	   
		   // 특정 회원 조회 
	      model.addAttribute("mypagemember" , myPageService.getMemberDetailModify(mid));
	     // log.info("컨트롤러- 화면으로 전달할 model(modify) :" + model);
	      
	      return "/mypage/mypagemodify";

	   }
	   

	   // 회원 수정
	   @PreAuthorize("isAuthenticated() && principal.username == #memberVO.mid")
	   @PostMapping("/mypagemodify")
	   public String modifyMypageMember(MemberVO memberVO,
			                                     RedirectAttributes redirectAttr) {
	      
	      //log.info("mypagemodify - 멤버 수정 전달된 myPage값(modpost) : "  +memberVO);
	     

			String encodemPw = ""; 	//인코딩 후 비밀번호
	      
	      //비밀번호 암호화 
			encodemPw = pwEncoder.encode(memberVO.getMpw()); //비밀번호 인코더
	      memberVO.setMpw(encodemPw);  //DB에 넘겨주기 위해 암호화된 비밀번호 저장 
	      

	      if(myPageService.modifyMyPageMember(memberVO)) {
	 
	         redirectAttr.addFlashAttribute("result", "successModify");
	      }      

	     // log.info("성공 :" + myPageService.modifyMyPageMember(memberVO));
	      
	      return "redirect:/mypage/mypagedetail?mid=" + memberVO.getMid();

	   }
	   
	   
	   //회원 삭제 요청(mdelflag = 1) 
	   @PreAuthorize("isAuthenticated() && principal.username == #memberVO.mid")
	   @PostMapping("/mypagememdelete")
	   public String setMypageDelete(@RequestParam("mid") String mid ,
	                                           RedirectAttributes redirectattr,HttpServletRequest request, MemberVO memberVO) {
	      //log.info("컨트롤러 - 멤버 mdelFlag값 변경 : " + mid);
		   
	      if(myPageService.setMyPageMemberDelete(mid)) {
	         redirectattr.addFlashAttribute("result", "successDelete");
	         HttpSession session = request.getSession();
	         session.invalidate();
	      }
	      
		  // log.info("전달된 memberVO :" + memberVO);
		   
		   
		   String rawPw = "";   //인코딩 전 비밀번호
		   String encodemPw = ""; // 인코딩 후 비밀번호
		   
		   HttpSession session = request.getSession();
		  
		   MemberVO lvo = myPageService.selectMyPagePwCheck(memberVO);
		   
		  // log.info("lvo값 :" + lvo);
		   

			   rawPw = memberVO.getMpw();  //사용자가 입력.... 
			//   log.info("rawPw 값 :" + rawPw);
			   
			   encodemPw = lvo.getMpw();  //데이터베이스에 저장된 인코딩된 비밀번호 
			 //  log.info("encodemPw값 :" + encodemPw);
			   
			 //  log.info("pwEncoder.matches(rawPw , encodemPw) :" + pwEncoder.matches(rawPw, encodemPw));
			   
			   //비밀번호 일치 판단
			   if(pwEncoder.matches(rawPw, encodemPw) == true) {
				//   log.info("비밀번호가 일치합니다. 인증 성공");
				   lvo.setMpw("");  //인코딩된 비밀번호 정보 지움
				   session.setAttribute("mypagemember", lvo);
				//   log.info("lvo값 : " + lvo);
				   
				   return "redirect:/mypage/mypagedeletesuccess";
			   }else {
				//   log.info("비밀번호 확인 필요");
				   redirectattr.addFlashAttribute("PwCheckResult", 0);
				   return "redirect:/mypage/mypagememdelete?mid=" + mid;
			   }
	      
	     	     
	   }
	   
	   //회원 삭제 요청(mdelflag = 1) 
	   @PreAuthorize("isAuthenticated() && principal.username == #memberVO.mid")
	   @GetMapping("/mypagememdelete")
	   public void setMypageDeleteGet(String mid ,
	                                                        Model model, MemberVO memberVO) {
		  // log.info("회원탈퇴하기 전에 이용약관 확인");
		  // log.info("탈퇴전 mid 값 :" + mid);
		  model.addAttribute("mypagedelete", myPageService.selectMyPageIdCheck(mid));		   
	   }
	   
	   //탈퇴 성공 페이지
	   @GetMapping("/mypagedeletesuccess")
	   public void deleteSuccess(HttpServletRequest request,SessionStatus sessionStatus) {
		   
		  // log.info("탈퇴 확인창 ");
		   SecurityContextHolder.clearContext();
	   }
	   
	   
	   // 수정페이지 가기전 비밀번호확인 (Get) jsp 호출용
	   @PreAuthorize("isAuthenticated() && principal.username == #memberVO.mid")
	   @GetMapping("mypagememmodify")
	   public void myPageMemberModifyGet(MemberVO memberVO, Model model){
		   
		  // log.info("수정페이지 전 비밀번호 확인");
		   model.addAttribute("mypagemember" , myPageService.selectMyPagePwCheck(memberVO));
	   }
	   
	   //회원 수정페이지 가기전 비밀번호 확인 (post)
	   //암호화된 비번과 입력된 비번 확인
	   @PreAuthorize("isAuthenticated() && principal.username == #memberVO.mid")
	   @PostMapping("/mypagememmodify")
	   public String ModifyMypageMemberPw(
			      HttpServletRequest request,  MemberVO memberVO  , Model model, RedirectAttributes redirectattr) {
		   
		  // log.info("전달된 memberVO :" + memberVO);
		   
		   String rawPw = "";   //인코딩 전 비밀번호
		   String encodemPw = ""; // 인코딩 후 비밀번호
		   
		   HttpSession session = request.getSession();
		   String mid = memberVO.getMid();
		  
		   MemberVO lvo = myPageService.selectMyPagePwCheck(memberVO);
		   
		  // log.info("lvo값 :" + lvo);
		   

			   rawPw = memberVO.getMpw();  //사용자가 입력.... 
			 //  log.info("rawPw 값 :" + rawPw);
			   
			   encodemPw = lvo.getMpw();  //데이터베이스에 저장된 인코딩된 비밀번호 
			  // log.info("encodemPw값 :" + encodemPw);
			   
			  // log.info("pwEncoder.matches(rawPw , encodemPw) :" + pwEncoder.matches(rawPw, encodemPw));
			   
			   //비밀번호 일치 판단
			   if(pwEncoder.matches(rawPw, encodemPw) == true) {
				//   log.info("비밀번호가 일치합니다. 인증 성공");
				   lvo.setMpw("");  //인코딩된 비밀번호 정보 지움
				   session.setAttribute("mypagemember", lvo);
				  // log.info("lvo값 : " + lvo);
				   
				   return "redirect:/mypage/mypagemodify?mid=" + mid;
			   }else {
				  // log.info("비밀번호 확인 필요");
				   redirectattr.addFlashAttribute("PwCheckResult", 0);
				   return "redirect:/mypage/mypagememmodify?mid=" + mid;
			   }
			   
         }
		   
     
   //주문내역 목록 -페이징
	   @PreAuthorize("isAuthenticated() && principal.username == #memberVO.mid")
   @GetMapping("/mypageorder")
   public void showMyPageOrderList(@RequestParam("mid") String mid, MyPagePagingDTO myPagePagingDTO, Model model, MemberVO memberVO) {
	//   log.info("컨트롤러(mypageorder)-페이징 주문목록 조회 시작 ........");
	//   log.info("컨트롤러에 전달된 사용자의 페이징처리 데이터 :" + myPagePagingDTO);


	   model.addAttribute("myPageOrderList", myPageService.getMyOrderPagingList(myPagePagingDTO));
	   model.addAttribute("myPageOrderListSize", myPageService.getMyOrderPagingList(myPagePagingDTO).size());

	   

	 //  log.info("주문 내역 searchMonth : " + myPagePagingDTO.getSearchMonth());
	 // log.info("주문내역 페이징 mid :" + mid);

	   long rowAmountTotal = myPageService.selectRowAmountTotal(myPagePagingDTO);
	  // log.info("컨트롤러에 전달된 게시물 총 개수 : " + rowAmountTotal);
	   
	   MyPagePagingCreatorDTO myPagePagingCreatorDTO = 
			                 new MyPagePagingCreatorDTO (rowAmountTotal, myPagePagingDTO);
	 //  log.info("컨트롤러에 생성된 MyPagePagingDTO 객체 정보 :" + myPagePagingCreatorDTO.toString());
	   
	   model.addAttribute("mypagingCreator", myPagePagingCreatorDTO);
	   
	  // log.info("컨트롤러(mypageorder)-페이징 주문목록 조회 완료....");
	   
   }
   
   
   
   // 좋아요 목록 조회
	   @PreAuthorize("isAuthenticated() && principal.username == #memberVO.mid")
   @GetMapping("/mypagethumb")
     public void showMyPageThumbList(String mid,MyPagePagingDTO myPagePagingDTO, Model model, MemberVO memberVO ) {
	 //   log.info("컨트롤러 - 좋아요목록 리스트 조회 시작");
	    
	   model.addAttribute("myPagethumbList", myPageService.getMyPageThumbList(myPagePagingDTO));
	   model.addAttribute("myPagethumbListSize", myPageService.getMyPageThumbList(myPagePagingDTO).size());
	   model.addAttribute("thumbList", cartService.thumbList(mid));
	   
	   
	   long rowAmountTotal = myPageService.selectRowThumbTotal(myPagePagingDTO);
	 //  log.info("컨트롤러에 전달된 게시물 총 개수 : " + rowAmountTotal);
	   
	   MyPagePagingCreatorDTO myPagePagingCreatorDTO = 
			                 new MyPagePagingCreatorDTO (rowAmountTotal, myPagePagingDTO);
	 //  log.info("컨트롤러에 생성된 MyPagePagingDTO 객체 정보 :" + myPagePagingCreatorDTO.toString());
	   
	   model.addAttribute("mypagingCreator", myPagePagingCreatorDTO);
	   
	 //  log.info("컨트롤러(mypagethumb)- 페이징 좋아요목록 조회 완료");
   }
   
   
   
   //좋아요 목록 삭제
   @PreAuthorize("isAuthenticated() && principal.username == #memberVO.mid")
   @PostMapping("/mypagethumbremove")
   public String showMyPageThumbListRemove(int thumbid ,
		                                                                String mid,
		                                                               RedirectAttributes redirectAttr, MemberVO memberVO) {

	 //  log.info("컨트롤러 - 좋아요 목록 삭제 thumbid :" + thumbid);
	 //  log.info("컨트롤러 - 좋아요 목록 삭제 mid :" +  mid);
      myPageService.removeMyPageThumb(thumbid);
       redirectAttr.addFlashAttribute("result", "successRemove");
      
	  return "redirect:/mypage/mypagethumb?mid=" + mid;
      
   }

   
  
   //Q &A게시판목록 조회
	@PreAuthorize("isAuthenticated() && principal.username == #memberVO.mid")
   @GetMapping("/mypageqboard")
   public void showMyPageQboardList( String mid, MyPagePagingDTO myPagePagingDTO, Model model, MemberVO memberVO) {
	   
	 //  log.info("Q&A게시판 목록 조회 시작 ....");
	   
	    model.addAttribute("myPageQboardList", myPageService.getMyPageQboardList(myPagePagingDTO));
	    model.addAttribute("myPageQboardListSize", myPageService.getMyPageQboardList(myPagePagingDTO).size());
	 
	//	  log.info("Q &A게시판목록페이징 mid :" + mid);
		    
		   long rowAmountTotal = myPageService.selectQboardTotal(myPagePagingDTO);
		//   log.info("컨트롤러에 전달된 게시물 총 개수 : " + rowAmountTotal);
		   
		   MyPagePagingCreatorDTO myPagePagingCreatorDTO = 
				                 new MyPagePagingCreatorDTO (rowAmountTotal, myPagePagingDTO);
	//	   log.info("컨트롤러에 생성된 MyPagePagingDTO 객체 정보 :" + myPagePagingCreatorDTO.toString());
		   
		   model.addAttribute("mypagingCreator", myPagePagingCreatorDTO);
		   
		//   log.info("컨트롤러(mypageqboard)-페이징 Q &A게시판목록 조회 완료....");
   }
   
   //Q&A게시판 목록 삭제
	@PreAuthorize("isAuthenticated() && principal.username == #memberVO.mid")
   @PostMapping("/mypageqboardremove")
   public String showMyPageQboardListRemove(long qno,
		                                                         String mid, 
		                                                         RedirectAttributes redirectAttr, MemberVO memberVO) {
	  // log.info("컨트롤러 - Q&A 게시판 삭제  qno :"+ qno);
	   
	   myPageService.removeMyPageQboardList(qno);
	   
	
	 //  log.info("Q &A게시판목록 qno : " + qno);
	   
	   redirectAttr.addFlashAttribute("result", "successRemove");
	   
	   return "redirect:/mypage/mypageqboard?mid=" + mid;
   }
   
   
   
   //게시판(Board)
	   @PreAuthorize("isAuthenticated() && principal.username == #memberVO.mid")
   @GetMapping("/mypageboard")
   public void showMyPageBoardList(String mid, MyPagePagingDTO myPagePagingDTO, Model model, MemberVO memberVO) {
	   
	  // log.info("게시판 목록 조회 시작.....");
	   model.addAttribute("myPageBoardList" , myPageService.getMyPageBoardList(myPagePagingDTO));
	   model.addAttribute("myPageBoardListSize" , myPageService.getMyPageBoardList(myPagePagingDTO).size());
	   
	   long rowAmountTotal = myPageService.selectRowBoardTotal(myPagePagingDTO);
	  // log.info("컨트롤러에 전달된 게시물 총 개수 : " + rowAmountTotal);
	   
	   MyPagePagingCreatorDTO myPagePagingCreatorDTO = 
			                 new MyPagePagingCreatorDTO (rowAmountTotal, myPagePagingDTO);
	  // log.info("컨트롤러에 생성된 MyPagePagingDTO 객체 정보 :" + myPagePagingCreatorDTO.toString());
	   
	   model.addAttribute("mypagingCreator", myPagePagingCreatorDTO);
	   
	   
	 //  log.info("컨트롤러(mypageboard) - 페이징 게시판목록 조회 완료");
   }

   
}
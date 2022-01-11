package com.spring.allmybeauty.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.allmybeauty.member.domain.MemberVO;
import com.spring.allmybeauty.member.service.MemberService;

@Controller
//@Log4j
public class LoginLogoutController {

	@Autowired
	private MemberService memberService;

	@Autowired
	private BCryptPasswordEncoder pwEncoder;
			
	//메인 페이지 호출
	@GetMapping("/main")
	 public void mainPageGet() {
		
		//log.info("메인 페이지 진입");
	}
	
	//스프링 시큐리티가 반환하는 로그인 처리 결과에 대하여 메세지 처리하려면,
	//String 유형의 error, logout 매개변수가 선언되야 한다.
	@GetMapping("/member/myLogin") // 사용자 정의 로그인 JSP 페이지 호출 URL, 다른 URL을 사용해도 됨
	 public String loginPageGET(String error, String logout, Model model) {
		
		if (error != null) {
			
			// log.info("로그인 오류 시 error.hashCode(): " + error.hashCode());
			 model.addAttribute("error", "사용자 ID 또는 비밀번호를 잘못 입력하셨습니다.");
			 return "member/myLogin"; 
			 
			 } else if (logout != null) {
			// log.info("로그인 오류 시 error.hashCode(): " + logout.hashCode());
			model.addAttribute("logout", "정상적으로 로그아웃 됨");
			 return "member/myLogin";
			 }
		
			 //정상적인 로그인 페이지 호출
			 //log.info("정상적인 로그인 페이지 호출");
			 return "member/myLogin";
	 }
	
	//회원가입 성공시
	@GetMapping("/member/joinSuccess")
	 public void joinSuccessGet() {
		
		//log.info("회원가입 성공페이지 진입");
	}
	
	// 시큐리티 이후로 안쓰임
	// HttpServletRequest는 로그인 성공 시 session에 회원 정보 저장
	// RedirectAttributes는 로그인 실패 시 리다이렉트 된 로그인 페이지에 실패를 의미하는 데이터 전송하기 위함
	@PostMapping("/member/myLogin")
	public String loginPagePost(HttpServletRequest request, MemberVO memberVO, 
								RedirectAttributes rttr) {

		//log.info("로그인 Post 진입");
		//log.info("전달된 memberVO : " + memberVO);
		
		//session을 사용하기 위한 변수 선언 : (초기화)
		HttpSession session = request.getSession();
		
		//변수 선언 및 초기화
		String rawmPw = "";  	//인코딩 전 비밀번호
		String encodemPw = ""; 	//인코딩 후 비밀번호
		
		//memberLogin메서드를 호출하기 위해 수정 쿼리 실행하도록 하고 결과로 반환받은 MemberVO 인스턴스의 주소를 memberVO타입의 lvo변수에 저장.
		//MemberVO객체를 반환받아서 변수 lvo에 저장 (제출한 아이디와 일치하는 아이디가 있는지)
		MemberVO lvo = memberService.memberLogin(memberVO);
		
		//log.info("lvo값 : " + lvo);

		if(lvo != null) { //일치하는 아이디가 존재하면
			
			rawmPw = memberVO.getMpw(); //사용자가 제출한 비밀번호
			//log.info("rawmPw값 : " + rawmPw);
			
			encodemPw = lvo.getMpw(); //데이터베이스에 저장한 인코딩된 비밀번호
			//log.info("encodemPw값 : " + encodemPw);
			
			//log.info("pwEncoder.matches(rawmPw, encodemPw) : " + pwEncoder.matches(rawmPw, encodemPw));
		
			//비밀번호 일치여부 판단
			if(pwEncoder.matches(rawmPw, encodemPw) == true) { 
				
				//log.info("비밀번호가 일치합니다. 로그인 성공");
				lvo.setMpw(""); //인코딩된 비밀번호 정보 지움
				//log.info("lvo값 : " + lvo);
				session.setAttribute("memberVO", lvo); //session에 사용자의 정보 저장
				return "redirect:/main";
				
			}else {
				
				//log.info("아이디는 존재하나 비밀번호 확인 필요");
				rttr.addFlashAttribute("loginResult", 0);
				return "redirect:/member/myLogin";
			}
			
		}else { //로그인 실패 (일치하는 아이디 존재하지 않을 시)
			
			//log.info("lvo == null : 일치하는 아이디가 없습니다.");
			rttr.addFlashAttribute("loginResult", 0);
			return "redirect:/member/myLogin";
			
		}
	
	}
	
	//@GetMapping("/myLogoutPage")
	@GetMapping("/member/logout")
	public String logoutPageGet() {
		
		//log.info("로그아웃 페이지 호출");
		
		return "member/myLogout";
	}
	
	// a태그의 요청은 GET이므로 
	// session에 대한 작업을 해야기 때문에 HttpServletRequest 타입의 매개변수 작성
//	@GetMapping("/member/logout")
//	public String logoutMainGet(HttpServletRequest request) {
//		
//		log.info("logoutMainGet메서드 진입");
//		
//		//세션 제거하는 작업해야하기 떄문에 session 변수 및 초기화 작업
//		HttpSession session = request.getSession(false);
//
//		//사용될 세션이 없는 경우는 invalidate()메서드 사용
//		System.out.println("로그아웃 시 세션객체: "+session);
//		if (session != null) {
//		    session.invalidate();
//		}
//		
//		return "redirect:/main";
//		
//		//로그아웃 시 main이 아닌 현재 페이지에 새로고침하고 싶으면
//		//String -> void로 고치면 댐
//		
//		log.info("비동기 로그아웃 메서드 진입");
//        
//        HttpSession session = request.getSession();
//        
//        session.invalidate();
//	}
	
	//아이디찾기 페이지 이동
	@GetMapping("/member/idSearch")
	public void idSearchGet() {
		
		//log.info("아이디찾기 페이지 진입");
	}
	
	//아이디 찾기
	@PostMapping("/member/idSearch")
	public String idSearchPost(MemberVO memberVO, RedirectAttributes rttr, Model model){
		
		//log.info("idSearchPost() 진입");
		//log.info("전달된 memberVO : " + memberVO);
			
		MemberVO idSearch = memberService.idSearch(memberVO);
		
		//log.info("memberService.idSearch(memberVO)의 결과값 = " + idSearch);
		
		if(idSearch != null) { // 값이 있으면
			
			//log.info("아이디 찾기 성공");
			model.addAttribute("memberVO", idSearch); //session에 사용자의 정보 저장
			return "/member/idSearchSuccess";	
			
		} else {
			
			//log.info("idSearch == null : 일치하는 아이디가 없습니다.");
			rttr.addFlashAttribute("idSearchResult", 0);
			return "redirect:/member/idSearch";
			
		}	
	
	}
	
	//아이디찾기 성공 페이지 페이지 호출
	@GetMapping("/member/idSearchSuccess")
	 public void idSearchSuccessPageGet() {
		
		//log.info("아이디찾기 성공 페이지 진입");
		
	}
		
	
	//비밀번호찾기 페이지 이동
	@GetMapping("/member/pwSearch")
	public void pwSearchGet() {
	
		//log.info("비밀번호찾기(인증) 페이지 진입");
	
	}
	
	
	//비밀번호찾기(인증)
	@PostMapping("/member/pwSearch")
	public String pwSearchPost(MemberVO memberVO, RedirectAttributes rttr, Model model) {
		
		//log.info("pwSearchPost() 페이지 진입");
		//log.info("전달된 memberVO : " + memberVO);
		
		String mid = memberVO.getMid();
		
		MemberVO pwSearch = memberService.pwSearch(memberVO);
		//log.info("pwSearch : " + pwSearch);
		
		if(pwSearch != null) { // 값이 있으면
			
			//log.info("비밀번호 인증 성공");
			model.addAttribute("memberVO", pwSearch); 
			return "redirect:/member/pwSearchChange?mid=" + mid;	
			
		} else {
			
		//	log.info("pwSearch == null : 일치하는 아이디가 없습니다.");
			rttr.addFlashAttribute("pwSearchResult", 0);
			return "redirect:/member/pwSearch";
			
		}	
	
	}
	
	//비밀번호변경 페이지 이동
	@GetMapping("/member/pwSearchChange")
	public void pwSearchChangeGet(String mid, Model model) {
		
		//log.info("비밀번호변경 페이지 진입");
		//model.addAttribute("pwSearchChange", memberService.pwSearch(memberVO));
	
	}
	
	//비밀번호변경 페이지
	@PostMapping("/member/pwSearchChange")
	public String pwSearchChangePost(MemberVO memberVO,
            RedirectAttributes rttr) {
	
		//log.info("비밀번호변경 Post 진입");
		//log.info("memberVO : " + memberVO);
		
		String securePw = pwEncoder.encode(memberVO.getMpw()); //비밀번호암호화
		//log.info("memberVO.getMpw() : " + memberVO.getMpw());
		
		memberVO.setMpw(securePw); //비밀번호저장
		//log.info("securePw : " + securePw);
		
		memberService.pwSearchChange(memberVO);
		//log.info(memberService.pwSearchChange(memberVO));
		
		return "redirect:/member/myLogin";
	}
}

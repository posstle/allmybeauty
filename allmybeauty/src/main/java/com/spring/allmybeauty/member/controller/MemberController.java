package com.spring.allmybeauty.member.controller;

import java.util.Random;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.allmybeauty.member.domain.AuthorityVO;
import com.spring.allmybeauty.member.domain.MemberVO;
import com.spring.allmybeauty.member.service.MemberService;

@Controller
@RequestMapping("/member")
//@Log4j
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BCryptPasswordEncoder pwEncoder;
	
	//객체 타입인 mailSender 변수 선언 (의존성 주입을 위해 AutoWired 어노테이션 사용)
	@Autowired
	private JavaMailSender mailSender;

	//회원가입 페이지 이동
	@GetMapping("/join")
	public void joinGet() {
		
		//log.info("회원가입 페이지 진입");
	}
	
	//회원가입 -> 로그인페이지이동
	@PostMapping("/join")
	public String joinPost(MemberVO member, AuthorityVO authority){
		
		//log.info("회원가입 Post 진입");
		
		String rawmPw = "";  	//인코딩 전 비밀번호
		String encodemPw = ""; 	//인코딩 후 비밀번호
		
		rawmPw = member.getMpw();			  //비밀번호 데이터 얻음
		encodemPw = pwEncoder.encode(rawmPw); //비밀번호 인코딩
		member.setMpw(encodemPw); 			  //인코딩된 비밀번호 member객체에 다시 저장
		
		//log.info("member : " + member);
		
		//회원가입 서비스 실행
		memberService.memberJoin(member);
		
		//권한부여 (모든유저에게 Default : ROLE_USER로 설정)
		memberService.insertMemAuthority(authority);
		
		//log.info("memberService.memberJoin(member) 성공");
		
		return "redirect:/member/joinSuccess"; // 수정해야함 main 페이지로 가게끔
		
	}
	
	//아이디 중복 검사
	@PostMapping("/memberIdChk")
	@ResponseBody //해당 코드가 없으면 join.jsp 메서드의 결과가 반환되지 않음.
	public String memberIdChkPost(String mid){
		
		//log.info("memberIdChk() 진입");
		
		int idExistResult = memberService.idCheck(mid);
		
		//log.info("memberService.idCheck(mid)의 결과값 = " + idExistResult);
		
		if(idExistResult != 0) { // 0이 아니면
			
			return "yes";	// 중복아이디 존재
			
		} else {
			
			return "no";	// 중복아이디 없음
			
		}	
	
	} //memberIdChkPost() - end
	
	
	@GetMapping("/mailCheck")
	@ResponseBody
	public String mailCheckGET(String memail) {
	
		//log.info("mailCheckGET() 진입");
		
		//view로부터 넘어온 데이터 확인
		//log.info("이메일 데이터 전송 확인");
		//log.info("인증번호 보낼 이메일 : " + memail);
		
		//인증번호 난수 생성
		Random random = new Random();
		
		//11111~999999의 범위 숫자 얻기위해
		int checkNum = random.nextInt(888888) + 11111;
		
		//log.info("인증번호(checkNum) : " + checkNum); // 요까지는완료
		
		//이메일 보내기
		String setFrom = "goljw0520@naver.com"; // mybatis-context.xml 에 있는 email 주소
		String toMail = memail; //수신받을 이메일
		String title = "[ALL MY BEAUTY] 회원가입 인증 이메일입니다."; // 보낼 email 제목
		String content = "<p style=\"font-size: 25px; color:black; font-weight:bold\">저희 All My Beauty 홈페이지를 방문해주셔서 감사합니다.</p> <br><br>" 
					   + "아래의 해당 인증 번호를 확인란에 기입하여 주세요." 
					   + "<p style=\"font-size: 22px; color:#2749FF; font-weight:bold\">" + checkNum + "</p><br>"
					   + "인증번호 입력시 정상적으로 이메일이 인증되며, 인증 후 회원가입이 완료됩니다.<br><br>"
					   + "회원님의 소중한 개인정보를 보호하고자 정보보호 및 보안에 최선을 다하고 있으며,<br>"
					   + "개인정보를 제3자에게 양도하거나 이용하도록 하여 불이익이 발생하는 일이 없도록<br>"
					   + "정보보호에 각별히 유념하여 주시기 바랍니다.";
		//log.info(content);
		
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content, true);
			mailSender.send(message);
			
		} catch (Exception e) {
			e.printStackTrace();
			
			//System.out.println("MemberController : 메일 전송에 실패하였습니다.");
		}
		
		String checkNumSt = Integer.toString(checkNum);
		
		return checkNumSt;
	}
	
	
}

package com.spring.allmybeauty.member.admin.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.allmybeauty.member.admin.paging.AdminMemberPagingCreatorDTO;
import com.spring.allmybeauty.member.admin.paging.AdminMemberPagingDTO;
import com.spring.allmybeauty.member.admin.service.AdminMemberService;
import com.spring.allmybeauty.member.domain.MemberVO;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/admin")
public class AdminMemberController {
  
	@Autowired
	private AdminMemberService adminMemberService;
	
	@SuppressWarnings("unused")
	@Autowired
	private BCryptPasswordEncoder pwEncoder;
	
	// 회원 전체 목록
	@GetMapping("/adminmemberlist")
	public void adminMember(Model model, 
			                              @ModelAttribute("adminMemberPagingDTO") AdminMemberPagingDTO adminMemberPagingDTO) {
		//log.info("관리자 회원관리 페이지 진입 ");
		model.addAttribute("AdminMemberList" , adminMemberService.getMemberList(adminMemberPagingDTO));
		
		   long rowAmountTotal = adminMemberService.selectRowAmountTotal(adminMemberPagingDTO);
		  // log.info("컨트롤러에 전달된 게시물 총 개수 : " + rowAmountTotal);
		   
		   AdminMemberPagingCreatorDTO adminMemberPagingCreatorDTO = 
				                 new AdminMemberPagingCreatorDTO (rowAmountTotal, adminMemberPagingDTO);
		   //log.info("컨트롤러에 생성된 adminMemberPagingDTO 객체 정보 :" + adminMemberPagingCreatorDTO.toString());
		   
		   model.addAttribute("adminpagingCreator", adminMemberPagingCreatorDTO);
		   

		
	}
	
	@PostMapping("/adminmemberlist")
	private String adminMemberPost(Model model,RedirectAttributes redirectAttr, AdminMemberPagingDTO adminMemberPagingDTO) {
		model.addAttribute("AdminMemberList" , adminMemberService.getMemberList(adminMemberPagingDTO));
		return "redirect:/admin/adminmemberlist";
	}
	

	// 회원탈퇴 대기 목록
	@GetMapping("/admindeletelist")
	public void adminMemberDelete(Model model, AdminMemberPagingDTO adminMemberPagingDTO) {
		//log.info("관리자 회원 탈퇴 페이지 진입");
		model.addAttribute("AdminMemberDeleteList" , adminMemberService.getMemberDeleteList(adminMemberPagingDTO));
		
		   long rowAmountTotal = adminMemberService.selectRowAmountDeleteTotal(adminMemberPagingDTO);
		   //log.info("컨트롤러에 전달된 게시물 총 개수 : " + rowAmountTotal);
		   
		   AdminMemberPagingCreatorDTO adminMemberPagingCreatorDTO = 
				                 new AdminMemberPagingCreatorDTO (rowAmountTotal, adminMemberPagingDTO);
		  // log.info("컨트롤러에 생성된 adminMemberPagingDTO 객체 정보 :" + adminMemberPagingCreatorDTO.toString());
		   
		   model.addAttribute("adminpagingCreator", adminMemberPagingCreatorDTO);
	}
	
	
	// 신규회원 목록 
	@GetMapping("/adminnewmemberlist")
	public void admineNewMemberList(Model model, AdminMemberPagingDTO adminMemberPagingDTO) {
		//log.info("신규회원목록 페이지 진입");
		model.addAttribute("AdmineNewMemberList" , adminMemberService.getNewMemberList(adminMemberPagingDTO));
		
		   long rowAmountTotal = adminMemberService.selectRowAmountNewTotal(adminMemberPagingDTO);
		  // log.info("컨트롤러에 전달된 게시물 총 개수 : " + rowAmountTotal);
		   
		   AdminMemberPagingCreatorDTO adminMemberPagingCreatorDTO = 
				                 new AdminMemberPagingCreatorDTO (rowAmountTotal, adminMemberPagingDTO);
		   //log.info("컨트롤러에 생성된 adminMemberPagingDTO 객체 정보 :" + adminMemberPagingCreatorDTO.toString());
		   
		   model.addAttribute("adminpagingCreator", adminMemberPagingCreatorDTO);
	}
	

	//회원 수정 - jsp 이동
	@GetMapping("/adminmodify")
	public String adminMemberModifyGet(String mid , Model model,
			                                                  AdminMemberPagingDTO adminMemberPagingDTO) {
		model.addAttribute("adminmember", adminMemberService.getMember(mid));
		model.addAttribute("adminMemberPagingDTO", adminMemberPagingDTO);
		//log.info("컨트롤러 - 화면으로 전달할 model(adminmodify(get)):"+ model);
		
		return "/admin/adminmodify";
	}
	
	//회원수정
	@PostMapping("/adminmodify")
	public String adminMemberModifyPost(MemberVO memberVO, RedirectAttributes redirectAttr,
			                                                   AdminMemberPagingDTO adminMemberPagingDTO  ) {
		
		//log.info("adminMembermodfiy - 멤버 수정전달된 memberVO 값 :" + memberVO);
	
		adminMemberService.updateAdminMember(memberVO);

		return "redirect:/admin/adminmemberlist";
	}
	
	
	//회원삭제
    @PostMapping("/admindelete")
    @ResponseBody
	public String adminMemberDelete(String mid , HttpServletRequest request,RedirectAttributes redirectAttr) {
    	
    	//log.info("삭제 버튼 클릭 ");
    	//log.info("삭제 버튼 mid 값 :" + mid);
    	
    	String[] ajaxMsg = request.getParameterValues("valueArr");
    	int size = ajaxMsg.length;
    	for(int i = 0; i < size; i ++) {
    		adminMemberService.DeleteMember(ajaxMsg[i]);
    	}
        return "redirect:/admin/admindeletelist";
	}
	
    
    
    
}

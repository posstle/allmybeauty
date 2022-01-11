package com.spring.allmybeauty.member.domain;

import java.sql.Date;
import java.util.List;

import lombok.Data;

@Data
public class MemberVO {
	
	//테이블의 컬럼명과 동일하게 필드이름 설정을 권장한다.
	
	//회원 아이디
	private String mid;
	
	//회원 비밀번호
	private String mpw;
	
	//회원 이름
	private String mname;
	
	//회원 성별
	private String mgender; 
	
	//회원 이메일
	private String memail;
	
	//회원 번호
	private String mphone;
	
	//가입날짜
	private Date mregDate;

	//회원 우편번호
	private String mpostalCode;
	
	//회원 주소
	private String maddress;
	
	//회원 상세주소
	private String mdetailAddress;
	
	//회원 피부타입
	private String mskinType;
	
	//탈퇴여부 (0, 1구분) : 기본값 0(유지), 1(탈퇴요청)
  	private boolean mdelFlag;
  
	//계정상태 (0, 1구분) : 기본값 1(활성화) 0(비활성화)
  	private boolean enabled;
  	
  	//포인트
  	private int point;
  	
  	//권한설정(시큐리티) 
  	private List<AuthorityVO> authorityList;
 
}

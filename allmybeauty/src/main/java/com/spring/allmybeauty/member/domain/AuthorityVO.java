package com.spring.allmybeauty.member.domain;

import lombok.Data;

@Data
public class AuthorityVO {

	//테이블의 컬럼명과 동일하게 필드이름 설정 권장
	private String mid;
	private String authority;
}

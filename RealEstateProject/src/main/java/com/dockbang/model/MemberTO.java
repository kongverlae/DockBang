package com.dockbang.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MemberTO {
	// member seq
	private String userseq;
	
	private String email;
	private String password;
	private String name;
	private String surveyUrl;
	
	// 일반/중개/관리자 회원 구분
	private String check;
	
	// 일반회원/소셜로그인회원 구분
	private String social;
	
	
}

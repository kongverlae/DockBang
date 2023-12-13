package com.dockbang.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BoardTO {
	// board seq
	private String seq;
	
	private String subject;
	private String writer;
	private String mail;
	private String password;
	private String content;
	private String filename;
	private String filesize;
	private String hit;
	private String wip;
	private String wdate;
	private String wgap;
	private String category;
}

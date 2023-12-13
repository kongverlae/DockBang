package com.dockbang.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CommentTO {
	// comment seq
	private String seq;
	
	private String writer;
	
	// member seq
	private String mseq;
	
	private String content;
	
	// parent(모글) seq
	private String pseq;
	
	private String wdate;
	
	
}

package com.dockbang.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CommentTO {
	// comment seq
	private String commentseq;
	
	private String writer;
	
	// user seq
	private String userseq;
	
	private String content;
	
	// parent(모글) seq
	private String boardseq;
	
	private String wdate;
	
	
}

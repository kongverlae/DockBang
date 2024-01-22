package com.dockbang.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BookmarkTO {
	// bookmark seq
	private String bookmarkseq;
	// user의 email은 unique
	private String useremail;

	private String memo;
	
	// sale seq
	private String saleseq;
}

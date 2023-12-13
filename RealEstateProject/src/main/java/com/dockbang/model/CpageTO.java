package com.dockbang.model;

import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CpageTO {
	private int cpage;
	private int recordPerPage;
	private int blokPerPage;
	private int totalPage;
	private int totalRecord;
	private int startBlock;
	private int endBlock;
	private List<BoardTO> boardLists;
	
	// 생성자
	public CpageTO() {
		
	}
	
	
}

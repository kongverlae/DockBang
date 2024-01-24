package com.dockbang.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class HistoryTO {
	// 매물 조회 기록 seq
	private String historyseq;
	
	// 유저 seq
	private String userseq;
	
	// 매물 seq
	private String saleseq;
}

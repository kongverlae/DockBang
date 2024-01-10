package com.dockbang.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PoliceTO {
	// 편의시설-경찰서 seq
	private String policeseq;
	
	private String division;
	private String address;
	private double lon;
	private double lat;
	
	// 특정 지점과의 거리 반환값을 받기 위함
	private double distance;
}

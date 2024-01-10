package com.dockbang.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MovieTO {
	// 편의시설-영화관 seq
	private String movieseq;
	
	private String address;
	private String ji_address;
	private String business_name;
	private double lon;
	private double lat;
	
	// 특정 지점과의 거리 반환값을 받기 위함
	private double distance;
}

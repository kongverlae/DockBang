package com.dockbang.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class FoodTO {
	// 편의시설-음식점 seq
	private String foodseq;
	
	private String address;
	private String road_address;
	private String business_name;
	private String business_type;
	private double lon;
	private double lat;
}

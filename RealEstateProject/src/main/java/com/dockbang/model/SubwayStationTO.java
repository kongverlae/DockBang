package com.dockbang.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SubwayStationTO {
	private String id;
	private String name;
	private String subway_line;
	private double latitude;
	private double longitude;
	private String jibun_address;
	private String road_address;
	private String telnum;
}

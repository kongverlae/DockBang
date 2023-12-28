package com.dockbang.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SaleNearStationTO {
	private String id;
	private String station_name;
	private String station_line;
	private String sale_name;
	private String distance;
}

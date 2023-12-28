package com.dockbang.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SaleTO {
	// sale seq
	private String sale_seq;
	
	private String title;
	private String agency;
	private String address;
	private double lat;
	private double lon;
	private String sale_type;
	private String price;
	private String deposit;
	private String monthly_fee;
	private String manage_fee;
	private String area;
	private String built_date;
	private String house_type;
	private String house_usage;
	private String num_parking;
	private String loan_amount;
	private String floor;
	private String height;
	private String room;
	private String bathroom;
}
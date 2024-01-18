package com.dockbang.model;

import org.json.simple.JSONObject;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SaleTO {
	// sale seq
	private String sale_seq;
	private String sale_pic;
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
	private String full_option;
	private String main_street;
	private String parking_ok;
	private String pet_ok;
	private String bed;
	private String desk;
	private String closet;
	private String built_in_closet;
	private String dining_table;
	private String sofa;
	private String shoe_closet;
	private String refrigerator;
	private String laundry;
	private String dryer;
	private String shower_booth;
	private String bath;
	private String bidet;
	private String sink;
	private String dish_washer;
	private String gas_stove;
	private String induction;
	private String microwave;
	private String gas_oven;
	private String inner_guard;
	private String video_phone;
	private String inter_phone;
	private String card_key;
	private String cctv;
	private String outer_guard;
	private String door_security;
	private String elevator;
	private String fire_alarm;
	private String window_guard;
	private String veranda;
	private String television;
	private String gas;
	private String electric;
	private String water;
	private String internet;
	private String tv_license;
	private String new_built;
	
	// List 중복체크에 커스텀메서드를 넣기 위함
	@Override
	public boolean equals(Object saleTO) {
		// sale_seq가 같으면 같은 to
		return ((SaleTO) saleTO).getSale_seq().equals(this.sale_seq);
	}
	
	public JSONObject toJson() {
		JSONObject obj = new JSONObject();
		obj.put( "sale_seq", sale_seq);
		obj.put( "sale_pic", sale_pic);
		obj.put( "title", title);
		obj.put( "agency", agency);
		obj.put( "address", address);
		obj.put( "lat", lat);
		obj.put( "lon", lon);
		obj.put( "sale_type", sale_type);
		obj.put( "price", price);
		obj.put( "deposit", deposit);
		obj.put( "monthly_fee", monthly_fee);
		obj.put( "manage_fee", manage_fee);
		obj.put( "area", area);
		obj.put( "built_date", built_date);
		obj.put( "house_type", house_type);
		obj.put( "house_usage", house_usage);
		obj.put( "num_parking", num_parking);
		obj.put( "loan_amount", loan_amount);
		obj.put( "floor", floor);
		obj.put( "height", height);
		obj.put( "room", room);
		obj.put( "bathroom", bathroom);
		obj.put( "full_option", full_option);
		obj.put( "main_street", main_street);
		obj.put( "parking_ok", parking_ok);
		obj.put( "pet_ok", pet_ok);
		obj.put( "bed", bed);
		obj.put( "desk", desk);
		obj.put( "closet", closet);
		obj.put( "built_in_closet", built_in_closet);
		obj.put( "dining_table", dining_table);
		obj.put( "sofa", sofa);
		obj.put( "shoe_closet", shoe_closet);
		obj.put( "refrigerator", refrigerator);
		obj.put( "laundry", laundry);
		obj.put( "dryer", dryer);
		obj.put( "shower_booth", shower_booth);
		obj.put( "bath", bath);
		obj.put( "bidet", bidet);
		obj.put( "sink", sink);
		obj.put( "dish_washer", dish_washer);
		obj.put( "gas_stove", gas_stove);
		obj.put( "induction", induction);
		obj.put( "microwave", microwave);
		obj.put( "gas_oven", gas_oven);
		obj.put( "inner_guard", inner_guard);
		obj.put( "video_phone", video_phone);
		obj.put( "inter_phone", inter_phone);
		obj.put( "card_key", card_key);
		obj.put( "cctv", cctv);
		obj.put( "outer_guard", outer_guard);
		obj.put( "door_security", door_security);
		obj.put( "elevator", elevator);
		obj.put( "fire_alarm", fire_alarm);
		obj.put( "window_guard", window_guard);
		obj.put( "veranda", veranda);
		obj.put( "television", television);
		obj.put( "gas", gas);
		obj.put( "electric", electric);
		obj.put( "water", water);
		obj.put( "internet", internet);
		obj.put( "tv_license", tv_license);
		obj.put( "new_built", new_built);
		return obj;
	}
}

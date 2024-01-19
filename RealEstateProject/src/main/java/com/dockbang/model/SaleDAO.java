package com.dockbang.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dockbang.mapper.SqlMapperInter;

@Repository
public class SaleDAO {
	@Autowired
	private SqlMapperInter mapper;

	// 기능 설명
	public void saleSearch() {
		// 기능

//		return null;
	}
	
	
	// 기능 설명
	public void surveyResult() {
		// 기능
		
//		return null;
	}
	
	
	// 기능 설명
	public void saleCompare() {
		// 기능
		
//		return null;
	}
	
	
	// 기능 설명
	public void saleInfo() {
		// 기능
		
//		return null;
	}
	
	// 역 정보(SubwayStationTO 참고) 가져오기
	public List<SubwayStationTO> getStations(){
		return mapper.getStations();
	}
	
	// 매물 정보(SaleTO 참고) 가져오기
	public List<SaleTO> getSales(){
		return mapper.getSales();
	}

	
	// 역근처매물 정보(SaleNearStationTO 참고) 가져오기
	//public List<SaleTO> getSaleNearStation(Double lon, Double lat){
	public List<String> getSaleNearStation(Double lon, Double lat){
//		List<SaleNearStationTO> sales = mapper.getSalesNearStation();
		// 1km이내 매물정보 가져오기
		return mapper.getSalesNearStation(lon, lat, "1");
	}
	
	
}

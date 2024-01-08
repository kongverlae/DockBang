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

	// db를 참조해 역 주변 1km 이내인 역근처 매물의 정보를 저장하는 코드
	public void saveSaleNearStation() {
		// 지하철역의 이름,호선,위도,경도 데이터
//		List<SubwayStationTO> stations = mapper.getStations();
		List<SubwayStationTO> stations = this.getStations();
		
		// 매물의 이름, 위도, 경도 데이터
//		List<SaleTO> sales = mapper.getSales();
		List<SaleTO> sales = this.getSales();
		
		
		for(SubwayStationTO stationTO:stations) {
			// 역정보 출력
//				System.out.println(	stationTO.getName() + "\t" + 
//						stationTO.getSubway_line() + "\t" + 
//						stationTO.getLatitude() + "\t" + 
//						stationTO.getLongitude()
//						);

			// 매물정보 출력 (하나만)
			// System.out.println("title: " + sales.get(0).getTitle());
			// System.out.println("lat: " + sales.get(0).getLat());
			// System.out.println("lon: " + sales.get(0).getLon());
			
			// 매물의 위도경도를 이용해 1km 범위내의 매물이라면 거리데이터를 DB테이블에 저장
			for(SaleTO saleTO:sales) {
				// 역과 매물의 위도경도
				double staLat = stationTO.getLatitude();
				double staLon = stationTO.getLongitude();
				double saleLat = saleTO.getLat();
				double saleLon = saleTO.getLon();

				// 위도 경도 이용해서 매물과 역 사이 거리 계산 (km)
				// 식은 distance 함수에
				double distance = this.distance(staLat, staLon, saleLat, saleLon, "kilometer");
//				System.out.println("distance from " + stationTO.getName() + ": " + distance);
				
				// 1km 이내의 매물정보만 저장
				if(distance < 1) {
					int result = mapper.insertDistanceStationSale(stationTO.getName(), stationTO.getSubway_line(), saleTO.getTitle(), distance);
					// 데이터 삽입 실패시
					if(result != 1) {
						System.out.println("역 매물간 거리데이터 삽입 실패 - " + stationTO.getName() + "\t" + saleTO.getTitle());
					}
				}
			}
		}
	}
	
	// 역근처매물 정보(SaleNearStationTO 참고) 가져오기
	public List<SaleTO> getSaleNearStation(Double lon, Double lat){
//		List<SaleNearStationTO> sales = mapper.getSalesNearStation();
		// 1km이내 매물정보 가져오기
		return mapper.getSalesNearStation(lon, lat, "1");
	}
	
	
	/**
	 * 두 지점간의 거리 계산
	 * 
	 * @param lat1 지점 1 위도
	 * @param lon1 지점 1 경도
	 * @param lat2 지점 2 위도
	 * @param lon2 지점 2 경도
	 * @param unit 거리 표출단위 
	 * @return
	 */
	private double distance(double lat1, double lon1, double lat2, double lon2, String unit) {
		
		double theta = lon1 - lon2;
		double dist = Math.sin(deg2rad(lat1)) * Math.sin(deg2rad(lat2)) + Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) * Math.cos(deg2rad(theta));
		
		dist = Math.acos(dist);
		dist = rad2deg(dist);
		dist = dist * 60 * 1.1515;
		
		if (unit.equals("kilometer")) {
			dist = dist * 1.609344;
		} else if(unit.equals("meter")){
			dist = dist * 1609.344;
		} 
	
		return (dist);
	}


	// This function converts decimal degrees to radians
	private double deg2rad(double deg) {
		return (deg * Math.PI / 180.0);
	}
	
	// This function converts radians to decimal degrees
	private double rad2deg(double rad) {
		return (rad * 180 / Math.PI);
	}
	
	
}

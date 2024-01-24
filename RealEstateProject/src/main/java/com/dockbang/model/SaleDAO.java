package com.dockbang.model;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
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

	// type: 원하는 데이터
	public List<String> getGeo(String type){
		List<String> resultList;
		
		switch(type) {
			case "lat":
				resultList = mapper.selectlat();
				break;
			case "lon":
				resultList = mapper.selectlon();
				break;
			case "local":
				resultList = mapper.selectlocal();
				break;
			default:
				resultList = null;
				break;
		}
		
		return resultList;
	}
	
	// 매물 목록 반환
	public List<SaleTO> getSale(){
		List<SaleTO> resultList = mapper.getSales();
		
		return resultList;
	}
	
	// 지하철 역 목록 반환 - 호선별 중복X
	public List<SubwayStationTO> getSubwayStationGroupByNameList(){
		List<SubwayStationTO> stationList = mapper.getStationsGroupByName();
		
		return stationList;
	}
	
	// 지하철 역 목록 반환 - 호선별 중복 O
	public List<SubwayStationTO> getSubwayStationList(){
		List<SubwayStationTO> stationList = mapper.getStations();
		
		return stationList;
	}
	
	// seq를 이용해 모든 정보 불러오기
	public SaleTO getSaleInfo(String seq) {
		SaleTO saleTO = mapper.getSale(seq);
		
		return saleTO;
	}
	
	
	// seq를 이용해 매물리스트 출력에 필요한 정보만 불러오기
	public SaleTO getSaleListTO(String seq) {
		SaleTO saleTO = mapper.getSaleListInfo(seq);
		
		return saleTO;
	}
	
	// 매물 주변에 제일 가까운 편의시설 검색
	public Map<String, Object> getConvNearStation(String sale_seq) {
		SaleTO saleTO = mapper.getSale(sale_seq);
		
		Map<String, Object> resultMap = new HashMap<>();
		
		resultMap.put("편의점", mapper.getFoodNearPoint(saleTO.getLon(), saleTO.getLat(), "편의점"));
		resultMap.put("음식점", mapper.getFoodNearPoint(saleTO.getLon(), saleTO.getLat(), "기타 휴게음식점"));
		resultMap.put("카페", mapper.getFoodNearPoint(saleTO.getLon(), saleTO.getLat(), "커피숍"));
		resultMap.put("영화관", mapper.getMovieNearPoint(saleTO.getLon(), saleTO.getLat()));
		resultMap.put("경찰서", mapper.getPopliceNearPoint(saleTO.getLon(), saleTO.getLat()));
		
		return resultMap;
	}
	
	// 지하철역 이름으로 TO 가져오기 
	public SubwayStationTO getStationTO(String stationName) {
		SubwayStationTO stationTO = mapper.getStation(stationName);
		
		return stationTO;
	}
	
	// housetype으로 해당하는 매물의 seq list 가져오기
	public JSONObject getSeqsByHouseType(List<String> house_type_list) {
		JSONObject result = new JSONObject();
		List<String> saleSeqs = mapper.getSaleSeqByHouseTypes(house_type_list);
		
		result.put("saleSeqs", saleSeqs);
		return result;
	}
	
	// saletype으로 해당하는 매물의 seq list 가져오기
	public JSONObject getSeqsBySaleType(List<String> saleTypeList, Map<String, String> fee) {
		JSONObject result = new JSONObject();
		List<String> saleSeqs = new ArrayList<>();
		
		for (String saleType : saleTypeList) {
	        List<String> tempSaleSeqs;
	        switch (saleType) {
	            case "p":
	                tempSaleSeqs = mapper.getSaleSeqBySaleTypeP(fee.get("priceMin"), fee.get("priceMax"));
	                break;
	            case "l":
	                tempSaleSeqs = mapper.getSaleSeqBySaleTypeL(fee.get("lDepositMin"), fee.get("lDepositMax"));
	                break;
	            case "m":
	                tempSaleSeqs = mapper.getSaleSeqBySaleTypeM(fee.get("mDepositMin"), fee.get("mDepositMax"), fee.get("monthlyFeeMin"), fee.get("monthlyFeeMax"));
	                break;
	            default:
	                tempSaleSeqs = Collections.emptyList();
	        }
	        saleSeqs.addAll(tempSaleSeqs);
	    }

	    result.put("saleSeqs", saleSeqs);
		
		
		return result;
	}
	
	
}



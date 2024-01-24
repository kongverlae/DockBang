package com.dockbang.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dockbang.mapper.SqlMapperInter;
import com.dockbang.model.FoodTO;
import com.dockbang.model.MemberDAO;
import com.dockbang.model.MovieTO;
import com.dockbang.model.PoliceTO;
import com.dockbang.model.SaleDAO;
import com.dockbang.model.SaleTO;
import com.dockbang.model.SubwayStationTO;
import com.dockbang.util.DijkstraAlgo;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class SaleController {
	@Autowired
	MemberDAO mdao;
	@Autowired
	SaleDAO sdao;

//	@RequestMapping("/index.do")
//	ModelAndView index() {
//
//		// view(.jsp) 설정
//		ModelAndView modelAndView = new ModelAndView();
//		modelAndView.setViewName("index");
	// 데이터 전송
	// modelAndView.addObject("data_name", data);
//
//		// view 페이지로 반환
//		return modelAndView;
//	}

	// 메인 페이지이므로 /에 추가로 매핑
	@RequestMapping(value = { "/", "/page_main.do" })
	ModelAndView page_main() {

		// view(.jsp) 설정
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("page_main");
		// 데이터 전송
		// modelAndView.addObject("data_name", data);

		// view 페이지로 반환
		return modelAndView;
	}

	@RequestMapping("/page_survey.do")
	ModelAndView page_survey() {
		// view(.jsp) 설정
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("page_survey");

		// view 페이지로 반환
		return modelAndView;
	}
	
	
	@RequestMapping("/page_search.do")
	ModelAndView page_search(
			// 검색어	- 일반검색
			@RequestParam(value = "keyword", defaultValue = "서울특별시 강남구 역삼동 819-10") String keyword,
			// 출발역 	- 거리기반 검색
			@RequestParam(value = "startStation", defaultValue = "") String startStation,
			// 제한시간 - 거리기반 검색
			@RequestParam(value = "timeLimit", defaultValue = "-1") int timeLimit) {

		// view(.jsp) 설정
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("page_search");

		
		//매물 정보 저장 
		List<SaleTO> sale = sdao.getSale();
		modelAndView.addObject("sale", sale);
		
		//역 정보 저장
		List<SubwayStationTO> station = sdao.getSubwayStationGroupByNameList();
		modelAndView.addObject("station", station);
		
		List<String> lat = sdao.getGeo("lat");
		List<String> lon = sdao.getGeo("lon");
		List<String> local = sdao.getGeo("local");
		
		
		// 경계선 데이터 전송
		modelAndView.addObject("keyword", keyword);
		modelAndView.addObject("lineLat", lat);
		modelAndView.addObject("lineLon", lon);
		modelAndView.addObject("lineLocal", local);

		// view 페이지로 반환
		return modelAndView;
	}

	@RequestMapping("/act_distance_search.do")
	@ResponseBody
	JSONObject act_distance_search(
			// 출발역 	- 거리기반 검색
			@RequestParam(value = "startStation", defaultValue = "") String startStation,
			// 제한시간 - 거리기반 검색
			@RequestParam(value = "timeLimit", defaultValue = "-1") int timeLimit) {
		JSONObject result = new JSONObject();
		result.put("startStation", startStation);
		//result.put("timeLimit", timeLimit);
		
		// 전체 역 리스트
		List<SubwayStationTO> stations = sdao.getSubwayStationList();
		// 출발점 기준 5분이내 도달가능한 역 리스트
		List<SubwayStationTO> stationsNearStart = new DijkstraAlgo().getStationsNearStart(stations, startStation, timeLimit);
		
		result.put("stationsNearStart", stationsNearStart);
		
		
		// Map<역이름, List<매물>> - 페이지로 반환할 결과
//		Map<String, List<SaleTO>> salesNearStationMap = new HashMap<>();
		
		// 최종결과인 sale의 seq를 담는 리스트
		List<String> salesNearStation = new ArrayList<>();
		
		JSONArray salesNearStations = new JSONArray();
		// 역 하나하나 1km이내 매물리스트 찾아오기
		for (SubwayStationTO stationTO : stationsNearStart) {
			String stationName = stationTO.getName();
			// 이름으로 지하철 역 정보 get
			stationTO = sdao.getStationTO(stationName);
			
//			if(stationTO.getName().equals(startStation)) {
				// 출발역일때 검색어 가져오기 - 출발역으로 지도 이동을 위함
				// 페이지 이동으로 쓰이지 않음
				//keyword = stationTO.getRoad_address();
//			}
//		System.out.println("stationTO: " + stationTO.getName());

//			salesNearStation.add(sdao.getSaleNearStation(stationTO.getLongitude(), stationTO.getLatitude()).get(0));
			// 공간DB로 역 위치 기준 1km 이내 매물리스트
			List<String> saleSeqs = sdao.getSaleNearStation(stationTO.getLongitude(), stationTO.getLatitude());

			for(String saleSeq:saleSeqs) {
				// 중복이 없을때만 추가
				if(!salesNearStation.contains(saleSeq)) {
					salesNearStation.add(saleSeq);
				}
			}
			//salesNearStationMap.put(stationName, salesNearStation);
		}
		
		salesNearStations.add(salesNearStation);
		// JSONArray에 seq List를 추가
		result.put("salesNearStations", salesNearStations);
		
		return result;
	}
	
	// 매물리스트 화면 출력에 필요한 정보 추가
	@RequestMapping("act_saleList.do")
	@ResponseBody
	JSONArray act_saleList(@RequestParam List<String> seqList) {
		//System.out.println(seqList);
		JSONArray array = new JSONArray();
		
		// 매물리스트 화면 출력에 필요한 정보 추가
		for(String seq:seqList) {
			JSONObject obj = new JSONObject();
			SaleTO saleTO = sdao.getSaleListTO(seq);
			
			obj.put("sale_seq", saleTO.getSale_seq());
			obj.put("sale_pic", saleTO.getSale_pic());
			obj.put("sale_type", saleTO.getSale_type());
			obj.put("price", saleTO.getPrice());
			obj.put("deposit", saleTO.getDeposit());
			obj.put("monthly_fee", saleTO.getMonthly_fee());
			obj.put("house_type", saleTO.getHouse_type());
			obj.put("area", saleTO.getArea());
			obj.put("floor", saleTO.getFloor());
			obj.put("height", saleTO.getHeight());
			obj.put("address", saleTO.getAddress());
			
			array.add(obj);
		}
		
		return array;
	}
	
	// 매물 상세정보 + 매물 주변 편의시설 정보 반환
	@RequestMapping("/page_saleInfo.do")
	ModelAndView page_saleInfo(@RequestParam String sale_seq, HttpServletRequest request) {
		// 매물 주변 편의시설 정보 해시맵
		Map<String, Object> convNearStationMap = sdao.getConvNearStation(sale_seq);
		

		// 매물 주변 편의시설 정보 - 편의점
		FoodTO convTO = (FoodTO)convNearStationMap.get("편의점");
		
		// 매물 주변 편의시설 정보 - 음식점
		FoodTO foodTO = (FoodTO)convNearStationMap.get("음식점");
		
		// 매물 주변 편의시설 정보 - 카페
		FoodTO cafeTO = (FoodTO)convNearStationMap.get("카페");

		// 매물 주변 편의시설 정보 - 영화관
		MovieTO movieTO = (MovieTO)convNearStationMap.get("영화관");

		// 매물 주변 편의시설 정보 - 경찰서
		PoliceTO policeTO = (PoliceTO)convNearStationMap.get("경찰서");
		
		
		// 매물 상세정보
		SaleTO saleTO = sdao.getSaleInfo(sale_seq);

		// ===히스토리 기능===
		HttpSession session = request.getSession();
		
		// 열람 기록을 세션에 저장
		List<SaleTO> historyList;
		
		// 세션에서 열람기록 받아옴
		if(session.getAttribute("historyList") != null) {
			historyList = (List<SaleTO>) session.getAttribute("historyList");
		} else {
			// 열람한적 없으면 열람기록 새로 생성
			historyList = new ArrayList<>();
		}

		// 중복된 매물이면 기존 기록 제외
		if(historyList.contains(saleTO)) {
			historyList.remove(saleTO);
		}
		// 히스토리에 매물 추가
		historyList.add(saleTO);
		
		// 1: 성공 / 0: 실패
		int flag = 0;
		// 유저 로그인시 히스토리DB에 추가
		if(session.getAttribute("email") != null && !session.getAttribute("email").equals("")) {
			flag = sdao.saveHistory((String)session.getAttribute("email"), saleTO);
		}
		
		if(flag != 1) {
			System.out.println("저장 실패");
		}
		
		// 최대 5개만 남기고 삭제
		while (historyList.size() > 5) {
			historyList.remove(0);
        }
		
		// 세션에 히스토리 추가
		session.setAttribute("historyList", historyList);
		// / ===히스토리 기능=== /
		
		// view(.jsp) 설정
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("page_saleInfo");
		
		// 데이터 전송
		
		// 매물 상세정보
		modelAndView.addObject("saleTO", saleTO);
		
		// 매물 주변 편의시설 상세정보
		modelAndView.addObject("convTO", convTO);
		modelAndView.addObject("foodTO", foodTO);
		modelAndView.addObject("cafeTO", cafeTO);
		modelAndView.addObject("movieTO", movieTO);
		modelAndView.addObject("policeTO", policeTO);

		// view 페이지로 반환
		return modelAndView;
	}

	@RequestMapping("/page_compare.do")
	ModelAndView page_compare() {

		// view(.jsp) 설정
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("page_compare");
		// 데이터 전송
		// modelAndView.addObject("data_name", data);

		// view 페이지로 반환
		return modelAndView;
	}

	// 상세 검색을 위한 매소드들
	// 매물 상세 정보(house_type)를 가진 매물의 seq 리스트 반환
	@RequestMapping("/act_house_type_search.do")
	@ResponseBody
	JSONObject act_house_type_search(
			// house_type 리스트
			@RequestParam List<String> house_type_list) {
		
		// housetype list => seq list
		JSONObject result = sdao.getSeqsByHouseType(house_type_list);
		
		return result;
	}
	
	// 매물 상세 정보(sale_type)를 가진 매물의 seq 리스트 반환
	/*
	 * @RequestMapping("/act_sale_type_search.do")
	 * 
	 * @ResponseBody JSONObject act_sale_type_search( // house_type 리스트
	 * 
	 * @RequestParam List<String> saleTypeList,
	 * 
	 * @RequestParam String priceMin,
	 * 
	 * @RequestParam String priceMax,
	 * 
	 * @RequestParam String lDepositMin,
	 * 
	 * @RequestParam String lDepositMax,
	 * 
	 * @RequestParam String mDepositMin,
	 * 
	 * @RequestParam String mDepositMax,
	 * 
	 * @RequestParam String monthlyFeeMin,
	 * 
	 * @RequestParam String monthlyFeeMax) { System.out.println("saleTypeList :" +
	 * saleTypeList); System.out.println("priceMin :" + priceMin);
	 * System.out.println("priceMax :" + priceMax);
	 * System.out.println("lDepositMin :" + lDepositMin);
	 * System.out.println("lDepositMax :" + lDepositMax);
	 * System.out.println("mDepositMin :" + mDepositMin);
	 * System.out.println("mDepositMax :" + mDepositMax);
	 * System.out.println("monthlyFeeMin :" + monthlyFeeMin);
	 * System.out.println("monthlyFeeMax :" + monthlyFeeMax);
	 * 
	 * JSONObject result = new JSONObject(); List<String> saleSeqs =
	 * mapper.getSaleSeqBySaleTypes( saleTypeList, priceMin, priceMax, lDepositMin,
	 * lDepositMax, mDepositMin, mDepositMax, monthlyFeeMin, monthlyFeeMax );
	 * result.put("saleSeqs", saleSeqs);
	 * 
	 * return result; }
	 */
	@RequestMapping("/act_sale_type_search.do")
	@ResponseBody
	public JSONObject actSaleTypeSearch(
	        @RequestParam List<String> saleTypeList,
	        @RequestParam String priceMin, 
	        @RequestParam String priceMax, 
	        @RequestParam String lDepositMin, 
	        @RequestParam String lDepositMax, 
	        @RequestParam String mDepositMin, 
	        @RequestParam String mDepositMax, 
	        @RequestParam String monthlyFeeMin, 
	        @RequestParam String monthlyFeeMax) {

	    // 요금 정보
	    Map<String, String> fee = new HashMap<>();
	    
	    fee.put("priceMin", priceMin);
	    fee.put("priceMax", priceMax);
	    fee.put("lDepositMin", lDepositMin);
	    fee.put("lDepositMax", lDepositMax);
	    fee.put("mDepositMin", mDepositMin);
	    fee.put("mDepositMax", mDepositMax);
	    fee.put("monthlyFeeMin", monthlyFeeMin);
	    fee.put("monthlyFeeMax", monthlyFeeMax);

	    // saletype list => seq list
	    JSONObject result = sdao.getSeqsBySaleType(saleTypeList, fee);
	    
	    
	    return result;
	}

}

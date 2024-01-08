package com.dockbang.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.dockbang.mapper.SqlMapperInter;
import com.dockbang.model.MemberDAO;
import com.dockbang.model.SaleDAO;
import com.dockbang.model.SaleTO;
import com.dockbang.model.SubwayStationTO;
import com.dockbang.util.DijkstraAlgo;

@Controller
public class SaleController {
	@Autowired
	MemberDAO mdao;
	@Autowired
	SaleDAO sdao;

	// 나중에 DAO로 옮기기
	@Autowired
	private SqlMapperInter mapper;
	
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
	ModelAndView page_survey(@RequestParam String startStation) {
		
		// view(.jsp) 설정
		ModelAndView modelAndView = new ModelAndView();
		
		// 전체 역 리스트
		List<SubwayStationTO> stations = mapper.getStations();
		// 출발점 기준 5분이내 도달가능한 역 리스트
		List<SubwayStationTO> stationsNearStart = new DijkstraAlgo().getStationsNearStart(stations, startStation, 5);
		
		// Map<역이름, List<매물>> - 페이지로 반환할 결과
		Map<String, List<SaleTO>> salesNearStationMap = new HashMap<>();
		
		// 역 하나하나 1km이내 매물리스트 찾아오기
		for(SubwayStationTO stationTO:stationsNearStart) {
			String stationName = stationTO.getName();
			// 이름으로 지하철 역 정보 get
			stationTO = mapper.getStation(stationName);
//			System.out.println("stationTO: " + stationTO.getName());
			
			// 공간DB로 역 위치 기준 1km 이내 매물리스트
			List<SaleTO> salesNearStation = sdao.getSaleNearStation(stationTO.getLongitude(), stationTO.getLatitude());
			salesNearStationMap.put(stationName, salesNearStation);
		}
		
		// 출력용
//		for(Map.Entry<String, List<SaleTO>> entry:salesNearStationMap.entrySet()) {
//			System.out.println(entry.getKey() + "역 근처 매물 리스트");
//			// 역 하나에 대한 근처 매물 리스트
//			for(SaleTO saleTO:entry.getValue()) {
//				System.out.println(saleTO.getTitle());
//			} System.out.println();
//		}
		

		
		modelAndView.setViewName("page_survey");
		modelAndView.addObject("salesNearStationMap", salesNearStationMap);

		// view 페이지로 반환
		return modelAndView;
	}

	@RequestMapping("/page_search.do")
	ModelAndView page_search(String keyword) {

		// view(.jsp) 설정
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("page_search");
		
		// 매물 정보 저장
		List<String> lats = mapper.getLat();
		List<String> lons = mapper.getLon();
		modelAndView.addObject("lats", lats);
		modelAndView.addObject("lons", lons);
		
		// 예외에 null일 경우 추가 - 순서 중요
		if(keyword == null || keyword.equals("")) {
			modelAndView.addObject("lat", 37.3595704);
			modelAndView.addObject("lon", 127.105399);
			modelAndView.addObject("keyword", keyword);
		} else {
			List<String> lat = mapper.selectlat(keyword);
			List<String> lon = mapper.selectlon(keyword);
			// 데이터 전송
			modelAndView.addObject("keyword", keyword);
			modelAndView.addObject("lat", lat);
			modelAndView.addObject("lon", lon);
		}
		
		// view 페이지로 반환
		return modelAndView;
	}

	@RequestMapping("/page_saleInfo.do")
	ModelAndView page_saleInfo() {

		// view(.jsp) 설정
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("page_saleInfo");
		// 데이터 전송
		// modelAndView.addObject("data_name", data);

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

}

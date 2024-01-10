package com.dockbang.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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

	/* 였던것
	 * @RequestMapping("/page_survey.do") ModelAndView page_survey() {
	 * 
	 * // view(.jsp) 설정 ModelAndView modelAndView = new ModelAndView(); //
	 * List<SubwayStationTO> stations = sdao.getStations(); // List<SaleTO> sales =
	 * sdao.getSales();
	 * 
	 * // sdao.saveSaleNearStation(); // DB에 저장할때만 실행 List<SaleNearStationTO>
	 * salesNearStation = sdao.getSaleNearStation();
	 * 
	 * modelAndView.setViewName("page_survey"); //
	 * modelAndView.addObject("stations", stations);
	 * modelAndView.addObject("salesNearStation", salesNearStation);
	 * 
	 * // view 페이지로 반환 return modelAndView; }
	 */

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
			@RequestParam(value = "keyword", defaultValue = "서울특별시 강남구 역삼동 819-10") String keyword, 
			@Param(value = "startStation") String startStation) {

		// view(.jsp) 설정
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("page_search");

		
		//매줄 정보 저장 
		List<SaleTO> sale = mapper.getSales();
		modelAndView.addObject("sale", sale);
		
		//역 정보 저장
		List<SubwayStationTO> station = mapper.getStationsGroupByName();
		modelAndView.addObject("station", station);
		
		List<String> lat = mapper.selectlat();
		List<String> lon = mapper.selectlon();
		List<String> local = mapper.selectlocal();
		
		// 경계선 데이터 전송
		modelAndView.addObject("keyword", keyword);
		modelAndView.addObject("lineLat", lat);
		modelAndView.addObject("lineLon", lon);
		modelAndView.addObject("lineLocal", local);

		
		// 출발역이 주어지면 - 역 이동시간 기반 검색이면
		if(startStation != null && !startStation.equals("")) {
			// 전체 역 리스트
			List<SubwayStationTO> stations = mapper.getStations();
			// 출발점 기준 5분이내 도달가능한 역 리스트
			List<SubwayStationTO> stationsNearStart = new DijkstraAlgo().getStationsNearStart(stations, startStation, 5);
			
			// Map<역이름, List<매물>> - 페이지로 반환할 결과
			Map<String, List<SaleTO>> salesNearStationMap = new HashMap<>();
			
			// 역 하나하나 1km이내 매물리스트 찾아오기
			for (SubwayStationTO stationTO : stationsNearStart) {
				String stationName = stationTO.getName();
				// 이름으로 지하철 역 정보 get
				stationTO = mapper.getStation(stationName);
//			System.out.println("stationTO: " + stationTO.getName());
				
				// 공간DB로 역 위치 기준 1km 이내 매물리스트
				List<SaleTO> salesNearStation = sdao.getSaleNearStation(stationTO.getLongitude(), stationTO.getLatitude());
				salesNearStationMap.put(stationName, salesNearStation);
			}
			
			// 출발점 기준 5분이내 도달가능한 역 위치 기준 1km 이내 매물리스트
			modelAndView.addObject("salesNearStationMap", salesNearStationMap);
			
//			System.out.println(salesNearStationMap.get("서초").get(0).getTitle());
		}
		

		// view 페이지로 반환
		return modelAndView;
	}

	// 매물 상세정보 + 매물 주변 편의시설 정보 반환
	@RequestMapping("/page_saleInfo.do")
	ModelAndView page_saleInfo(@RequestParam String sale_seq) {
		// 매물 상세정보
		SaleTO saleTO = mapper.getSale(sale_seq);

		// 매물 주변 편의시설 정보 - 음식점
		FoodTO foodTO = mapper.getFoodNearPoint(saleTO.getLon(), saleTO.getLat());

		// 매물 주변 편의시설 정보 - 영화관
		MovieTO movieTO = mapper.getMovieNearPoint(saleTO.getLon(), saleTO.getLat());

		// 매물 주변 편의시설 정보 - 경찰서
		PoliceTO policeTO = mapper.getPopliceNearPoint(saleTO.getLon(), saleTO.getLat());

		
		
		// view(.jsp) 설정
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("page_saleInfo");
		
		// 데이터 전송
		
		// 매물 상세정보
		modelAndView.addObject("saleTO", saleTO);
		
		// 매물 주변 편의시설 상세정보
		modelAndView.addObject("foodTO", foodTO);
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

}

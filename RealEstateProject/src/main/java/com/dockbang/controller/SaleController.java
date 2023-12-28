package com.dockbang.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.dockbang.mapper.SqlMapperInter;
import com.dockbang.model.MemberDAO;
import com.dockbang.model.SaleDAO;
import com.dockbang.model.SaleNearStationTO;
import com.dockbang.model.SaleTO;
import com.dockbang.model.SubwayStationTO;

@Controller
public class SaleController {
	@Autowired
	MemberDAO mdao;
	@Autowired
	SaleDAO sdao;

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
	ModelAndView page_survey() {

		// view(.jsp) 설정
		ModelAndView modelAndView = new ModelAndView();
//		List<SubwayStationTO> stations = sdao.getStations();
//		List<SaleTO> sales = sdao.getSales();
		
//		sdao.saveSaleNearStation(); // DB에 저장할때만 실행
		List<SaleNearStationTO> salesNearStation = sdao.getSaleNearStation();
		
		modelAndView.setViewName("page_survey");
//		modelAndView.addObject("stations", stations);
		modelAndView.addObject("salesNearStation", salesNearStation);

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

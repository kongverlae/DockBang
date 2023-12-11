package com.real.estate.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class RealEstateController {
	// 컨트롤러 템플릿
	// 반환형: ModelAndView
	@RequestMapping("")
	ModelAndView index() {
		
		// view(.jsp) 설정
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("index");
		
		// view 페이지로 반환
		return modelAndView;
	}
	
	
}

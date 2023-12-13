package com.dockbang.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class RealEstateController {
	// 컨트롤러 템플릿
	// 반환형: ModelAndView
	@RequestMapping("/index.do")
	ModelAndView index() {
		
		// view(.jsp) 설정
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("index");
		
		// view 페이지로 반환
		return modelAndView;
	}
	@RequestMapping("/page_main.do")
	ModelAndView page_main() {
		
		// view(.jsp) 설정
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("page_main");
		
		// view 페이지로 반환
		return modelAndView;
	}
	@RequestMapping("/page_search.do")
	ModelAndView page_search() {
		
		// view(.jsp) 설정
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("page_search");
		
		// view 페이지로 반환
		return modelAndView;
	}
	
	@RequestMapping("/page_login.do")
	ModelAndView page_login() {
		
		// view(.jsp) 설정
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("page_login");
		
		// view 페이지로 반환
		return modelAndView;
	}
	
	
	@RequestMapping("/page_signup.do")
	ModelAndView page_signup() {
		
		// view(.jsp) 설정
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("page_signup");
		
		// view 페이지로 반환
		return modelAndView;
	}
	
	
}

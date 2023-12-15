package com.dockbang.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.dockbang.model.BoardDAO;

@Controller
public class BoardController {
	@Autowired
	BoardDAO bdao;
	
	@RequestMapping("/page_boardList.do")
	ModelAndView page_boardList(@RequestParam("category") String category) {
		
		// view(.jsp) 설정
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/board/page_boardList");
		
		
		// 데이터 전송
		modelAndView.addObject("category", category);

		// view 페이지로 반환
		return modelAndView;
	}
	
	
	@RequestMapping("/page_boardWrite.do")
	ModelAndView page_boardWrite(@RequestParam("category") String category) {

		// view(.jsp) 설정
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/board/page_boardWrite");
		// 데이터 전송
		// modelAndView.addObject("data_name", data);
		modelAndView.addObject("category", category);

		// view 페이지로 반환
		return modelAndView;
	}
	
	@RequestMapping("/page_boardView.do")
	ModelAndView page_boardView(@RequestParam("category") String category) {

		// view(.jsp) 설정
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/board/page_boardView");
		// 데이터 전송
		// modelAndView.addObject("data_name", data);
		modelAndView.addObject("category", category);

		// view 페이지로 반환
		return modelAndView;
	}
	
	@RequestMapping("/page_boardModify.do")
	ModelAndView page_boardFreeModify(@RequestParam("category") String category) {

		// view(.jsp) 설정
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/board/page_boardModify");
		// 데이터 전송
		// modelAndView.addObject("data_name", data);
		modelAndView.addObject("category", category);

		// view 페이지로 반환
		return modelAndView;
	}
	
	@RequestMapping("/page_boardDelete.do")
	ModelAndView page_boardDelete(@RequestParam("category") String category) {

		// view(.jsp) 설정
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/board/page_boardDelete");
		// 데이터 전송
		// modelAndView.addObject("data_name", data);
		modelAndView.addObject("category", category);

		// view 페이지로 반환
		return modelAndView;
	}

}

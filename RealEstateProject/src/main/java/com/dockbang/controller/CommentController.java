package com.dockbang.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dockbang.model.BoardDAO;

@Controller
public class CommentController {
	@Autowired
	BoardDAO bDao;
	
	@RequestMapping("/page_commentWriteOk.do")
	ModelAndView page_commentWriteOk() {

		// view(.jsp) 설정
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("page_commentWriteOk");
		// 데이터 전송
		// modelAndView.addObject("data_name", data);

		// view 페이지로 반환
		return modelAndView;
	}
	
	
	@RequestMapping("/page_commentModifyOk.do")
	ModelAndView page_commentModifyOk() {
		
		// view(.jsp) 설정
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("page_commentModifyOk");
		// 데이터 전송
		// modelAndView.addObject("data_name", data);
		
		// view 페이지로 반환
		return modelAndView;
	}
	
	
	@RequestMapping("/page_commentDeleteOk.do")
	ModelAndView page_commentDeleteOk() {
		
		// view(.jsp) 설정
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("page_commentDeleteOk");
		// 데이터 전송
		// modelAndView.addObject("data_name", data);
		
		// view 페이지로 반환
		return modelAndView;
	}
	
	
}

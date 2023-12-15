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
	
	@RequestMapping("/act_commentWrite.do")
	ModelAndView page_commentWriteOk() {

		// view(.jsp) 설정
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/board/act_commentWrite");
		// 데이터 전송
		// modelAndView.addObject("data_name", data);

		// view 페이지로 반환
		return modelAndView;
	}
	
	
	@RequestMapping("/act_commentModify.do")
	ModelAndView page_commentModifyOk() {
		
		// view(.jsp) 설정
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/board/act_commentModify");
		// 데이터 전송
		// modelAndView.addObject("data_name", data);
		
		// view 페이지로 반환
		return modelAndView;
	}
	
	
	@RequestMapping("/act_commentDelete.do")
	ModelAndView page_commentDeleteOk() {
		
		// view(.jsp) 설정
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/board/act_commentDelete");
		// 데이터 전송
		// modelAndView.addObject("data_name", data);
		
		// view 페이지로 반환
		return modelAndView;
	}
	
	
}

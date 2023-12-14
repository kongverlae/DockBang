package com.dockbang.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dockbang.model.BoardDAO;

@Controller
public class BoardController {
	@Autowired
	BoardDAO bdao;

	@RequestMapping("/page_boardNotice.do")
	ModelAndView page_boardNotice() {

		// view(.jsp) 설정
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("page_boardNotice");
		// 데이터 전송
		// modelAndView.addObject("data_name", data);

		// view 페이지로 반환
		return modelAndView;
	}
	
	@RequestMapping("/page_boardFree.do")
	ModelAndView page_boardFree() {

		// view(.jsp) 설정
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("page_boardFree");
		// 데이터 전송
		// modelAndView.addObject("data_name", data);

		// view 페이지로 반환
		return modelAndView;
	}
	
	@RequestMapping("/page_boardNews.do")
	ModelAndView page_boardNews() {

		// view(.jsp) 설정
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("page_boardNews");
		// 데이터 전송
		// modelAndView.addObject("data_name", data);

		// view 페이지로 반환
		return modelAndView;
	}

	@RequestMapping("/page_boardNoticeWrite.do")
	ModelAndView page_boardNoticeWrite() {

		// view(.jsp) 설정
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("page_boardNoticeWrite");
		// 데이터 전송
		// modelAndView.addObject("data_name", data);

		// view 페이지로 반환
		return modelAndView;
	}
	
	@RequestMapping("/page_boardFreeWrite.do")
	ModelAndView page_boardFreeWrite() {

		// view(.jsp) 설정
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("page_boardFreeWrite");
		// 데이터 전송
		// modelAndView.addObject("data_name", data);

		// view 페이지로 반환
		return modelAndView;
	}
	
	@RequestMapping("/page_boardNewsWrite.do")
	ModelAndView page_boardNewsWrite() {

		// view(.jsp) 설정
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("page_boardNewsWrite");
		// 데이터 전송
		// modelAndView.addObject("data_name", data);

		// view 페이지로 반환
		return modelAndView;
	}

	@RequestMapping("/page_boardNoticeView.do")
	ModelAndView page_boardNoticeView() {

		// view(.jsp) 설정
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("page_boardNoticeView");
		// 데이터 전송
		// modelAndView.addObject("data_name", data);

		// view 페이지로 반환
		return modelAndView;
	}
	
	@RequestMapping("/page_boardFreeView.do")
	ModelAndView page_boardFreeView() {

		// view(.jsp) 설정
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("page_boardFreeView");
		// 데이터 전송
		// modelAndView.addObject("data_name", data);

		// view 페이지로 반환
		return modelAndView;
	}
	@RequestMapping("/page_boardNewsView.do")
	ModelAndView page_boardNewsView() {

		// view(.jsp) 설정
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("page_boardNewsView");
		// 데이터 전송
		// modelAndView.addObject("data_name", data);

		// view 페이지로 반환
		return modelAndView;
	}

	@RequestMapping("/page_boardNoticeModify.do")
	ModelAndView page_boardNoticeModify() {

		// view(.jsp) 설정
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("page_boardNoticeModify");
		// 데이터 전송
		// modelAndView.addObject("data_name", data);

		// view 페이지로 반환
		return modelAndView;
	}
	
	@RequestMapping("/page_boardFreeModify.do")
	ModelAndView page_boardFreeModify() {

		// view(.jsp) 설정
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("page_boardFreeModify");
		// 데이터 전송
		// modelAndView.addObject("data_name", data);

		// view 페이지로 반환
		return modelAndView;
	}
	
	@RequestMapping("/page_boardNewsModify.do")
	ModelAndView page_boardNewsModify() {

		// view(.jsp) 설정
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("page_boardNewsModify");
		// 데이터 전송
		// modelAndView.addObject("data_name", data);

		// view 페이지로 반환
		return modelAndView;
	}

	@RequestMapping("/page_boardModifyOk.do")
	ModelAndView page_boardModifyOk() {

		// view(.jsp) 설정
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("page_boardModifyOk");
		// 데이터 전송
		// modelAndView.addObject("data_name", data);

		// view 페이지로 반환
		return modelAndView;
	}
	
	@RequestMapping("/page_boardNoticeDelete.do")
	ModelAndView page_boardNoticeDelete() {

		// view(.jsp) 설정
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("page_boardNoticeDelete");
		// 데이터 전송
		// modelAndView.addObject("data_name", data);

		// view 페이지로 반환
		return modelAndView;
	}
	
	@RequestMapping("/page_boardFreeDelete.do")
	ModelAndView page_boardFreeDelete() {

		// view(.jsp) 설정
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("page_boardFreeDelete");
		// 데이터 전송
		// modelAndView.addObject("data_name", data);

		// view 페이지로 반환
		return modelAndView;
	}
	
	@RequestMapping("/page_boardNewsDelete.do")
	ModelAndView page_boardNewsDelete() {

		// view(.jsp) 설정
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("page_boardNewsDelete");
		// 데이터 전송
		// modelAndView.addObject("data_name", data);

		// view 페이지로 반환
		return modelAndView;
	}

	@RequestMapping("/page_boardView.do")
	ModelAndView page_boardView() {

		// view(.jsp) 설정
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("page_boardView");
		// 데이터 전송
		// modelAndView.addObject("data_name", data);

		// view 페이지로 반환
		return modelAndView;
	}

}

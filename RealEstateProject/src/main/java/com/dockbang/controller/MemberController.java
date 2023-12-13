package com.dockbang.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dockbang.model.BoardDAO;
import com.dockbang.model.MemberDAO;
import com.dockbang.model.SaleDAO;

@Controller
public class MemberController {
	@Autowired
	MemberDAO mdao;
	@Autowired
	SaleDAO sdao;
	@Autowired
	BoardDAO bdao;

	@RequestMapping("/page_memberLogin.do")
	ModelAndView page_memberLogin() {

		// view(.jsp) 설정
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("page_memberLogin");
		// 데이터 전송
		// modelAndView.addObject("data_name", data);

		// view 페이지로 반환
		return modelAndView;
	}
	

	@RequestMapping("/page_memberRegister.do")
	ModelAndView page_memberRegister() {

		// view(.jsp) 설정
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("page_memberRegister");
		// 데이터 전송
		// modelAndView.addObject("data_name", data);

		// view 페이지로 반환
		return modelAndView;
	}
	

	@RequestMapping("/page_memberRegisterOk.do")
	ModelAndView page_memberRegisterOk() {

		// view(.jsp) 설정
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("page_memberRegisterOk");
		// 데이터 전송
		// modelAndView.addObject("data_name", data);

		// view 페이지로 반환
		return modelAndView;
	}
	

	@RequestMapping("/page_memberModify.do")
	ModelAndView page_memberModify() {

		// view(.jsp) 설정
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("page_memberModify");
		// 데이터 전송
		// modelAndView.addObject("data_name", data);

		// view 페이지로 반환
		return modelAndView;
	}
	
	
	@RequestMapping("/page_memberModifyOk.do")
	ModelAndView page_memberModifyOk() {
		
		// view(.jsp) 설정
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("page_memberModifyOk");
		// 데이터 전송
		// modelAndView.addObject("data_name", data);
		
		// view 페이지로 반환
		return modelAndView;
	}
	
	
	@RequestMapping("/page_memberDelete.do")
	ModelAndView page_memberDelete() {
		
		// view(.jsp) 설정
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("page_memberDelete");
		// 데이터 전송
		// modelAndView.addObject("data_name", data);
		
		// view 페이지로 반환
		return modelAndView;
	}
	
	
	@RequestMapping("/page_memberDeleteOk.do")
	ModelAndView page_memberDeleteOk() {
		
		// view(.jsp) 설정
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("page_memberDeleteOk");
		// 데이터 전송
		// modelAndView.addObject("data_name", data);
		
		// view 페이지로 반환
		return modelAndView;
	}
	
	
	@RequestMapping("/page_surveyHistory.do")
	ModelAndView page_surveyHistory() {
		
		// view(.jsp) 설정
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("page_surveyHistory");
		// 데이터 전송
		// modelAndView.addObject("data_name", data);
		
		// view 페이지로 반환
		return modelAndView;
	}
	
	
	@RequestMapping("/page_memberInfo.do")
	ModelAndView page_memberInfo() {
		
		// view(.jsp) 설정
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("page_memberInfo");
		// 데이터 전송
		// modelAndView.addObject("data_name", data);
		
		// view 페이지로 반환
		return modelAndView;
	}
	
	
	@RequestMapping("/page_bookmarkList.do")
	ModelAndView page_bookmarkList() {
		
		// view(.jsp) 설정
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("page_bookmarkList");
		// 데이터 전송
		// modelAndView.addObject("data_name", data);
		
		// view 페이지로 반환
		return modelAndView;
	}
	
	
	@RequestMapping("/page_bookmarkDelete.do")
	ModelAndView page_bookmarkDelete() {
		
		// view(.jsp) 설정
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("page_bookmarkDelete");
		// 데이터 전송
		// modelAndView.addObject("data_name", data);
		
		// view 페이지로 반환
		return modelAndView;
	}
	
	
	@RequestMapping("/page_bookmarkDeleteOk.do")
	ModelAndView page_bookmarkDeleteOk() {
		
		// view(.jsp) 설정
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("page_bookmarkDeleteOk");
		// 데이터 전송
		// modelAndView.addObject("data_name", data);
		
		// view 페이지로 반환
		return modelAndView;
	}
	
	
	@RequestMapping("/page_searchHistory.do")
	ModelAndView page_searchHistory() {
		
		// view(.jsp) 설정
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("page_searchHistory");
		// 데이터 전송
		// modelAndView.addObject("data_name", data);
		
		// view 페이지로 반환
		return modelAndView;
	}
	
	
	@RequestMapping("/page_searchHistoryDelete.do")
	ModelAndView page_searchHistoryDelete() {
		
		// view(.jsp) 설정
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("page_searchHistoryDelete");
		// 데이터 전송
		// modelAndView.addObject("data_name", data);
		
		// view 페이지로 반환
		return modelAndView;
	}
	
	
	@RequestMapping("/page_searchHistoryDeleteOk.do")
	ModelAndView page_searchHistoryDeleteOk() {
		
		// view(.jsp) 설정
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("page_searchHistoryDeleteOk");
		// 데이터 전송
		// modelAndView.addObject("data_name", data);
		
		// view 페이지로 반환
		return modelAndView;
	}
	

}

package com.dockbang.controller;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.dockbang.mapper.SqlMapperInter;
import com.dockbang.model.BoardDAO;
import com.dockbang.model.MemberDAO;
import com.dockbang.model.SaleDAO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@MapperScan(basePackages = {"com.dockbang.mapper"})
public class MemberController {
	@Autowired
	MemberDAO mdao;
	
	@Autowired
	SaleDAO sdao;
	
	@Autowired
	BoardDAO bdao;	

	@Autowired
	private SqlMapperInter mapper;
	
	// kakao api 관리자 키 
	@Value("${kakao.client_id}")
    private String client_id;
    @Value("${kakao.redirect_uri}")
    private String redirect_uri;

	@RequestMapping("/page_memberLogin.do")
	ModelAndView page_memberLogin() {

		// view(.jsp) 설정
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("page_memberLogin");
		
		// kakao 로그인 페이지 전송
		String location = "https://kauth.kakao.com/oauth/authorize?response_type=code&client_id="+client_id+"&redirect_uri="+redirect_uri;
		modelAndView.addObject("location", location);
		
		// 데이터 전송
		// modelAndView.addObject("data_name", data);

		// view 페이지로 반환
		return modelAndView;
	}
	
	@RequestMapping("/act_memberLogin.do")
	ModelAndView act_memberLogin(
			@RequestParam("email") String email,
			@RequestParam("password") String password,
			HttpServletRequest request) {

		// view(.jsp) 설정
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("act_memberLogin");
		
		//유저 존재 여부 확인
		int flag = mapper.selectUser(email);
		
		// 회원가입이 정상적으로 되면 세션 생성
		if(flag==1) {
			HttpSession session = request.getSession();
	    	session.setAttribute("email",email);
	    	String name = mapper.selectUserNmae(email);
	    	session.setAttribute("nickname",name);
		}
		
		// 데이터 전송
		modelAndView.addObject("flag", flag);

		// view 페이지로 반환
		return modelAndView;
	}

	// 로그아웃시 세션 초기화
	@RequestMapping("act_memberLogout.do")
	ModelAndView act_memberLogout(HttpServletRequest request) {

		// view(.jsp) 설정
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/page_main.do");
		
		HttpSession session = request.getSession(false);
		session.invalidate();
		
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
	
	
	// 유저 회원가입 함수
	@RequestMapping("/act_memberRegister.do")
	ModelAndView page_memberRegisterOk(
			@RequestParam("name") String name,
			@RequestParam("email") String email,
			@RequestParam("password") String password,
			HttpServletRequest request
			) {

		// view(.jsp) 설정
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("act_memberRegister");
		
		//오류면 0 // 정상이면 1
		int flag = mapper.insertUser(name, email, password);
		
		// 회원가입이 정상적으로 되면 세션 생성
		if(flag==1) {
			HttpSession session = request.getSession();
	    	session.setAttribute("email",email);
	    	session.setAttribute("nickname",name);
		}
		
		// 데이터 전송
		modelAndView.addObject("flag", flag);

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

package com.dockbang.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dockbang.mapper.SqlMapperInter;
import com.dockbang.model.BoardDAO;
import com.dockbang.model.KakaoDAO;
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

    @Autowired
    private KakaoDAO kakaoService;    
	
	// kakao api 관리자 키 
	@Value("${kakao.client_id}")
    private String client_id;
    @Value("${kakao.redirect_uri}")
    private String redirect_uri;
    
    // KakaoDAO에서 토큰을 받아와 getUserInfo에서 토큰을 통해 유저 정보를 가져와 반환하는 함수
    @RequestMapping("/callback")
    ModelAndView act_callBack(@RequestParam("code") String code, HttpServletRequest request) throws IOException {
        String accessToken = kakaoService.getAccessTokenFromKakao(client_id, code);
        HashMap<String, Object> userInfo = kakaoService.getUserInfo(accessToken);        
        // User 로그인, 또는 회원가입 로직 추가
        int flag = kakaoService.setKakaoUser(userInfo);
        
        // 로그인이 정상적으로 되면 세션 생성
        if(flag == 2||flag ==1) {
        	HttpSession session = request.getSession();
        	session.setAttribute("email",userInfo.get("email").toString());
        	session.setAttribute("nickname",userInfo.get("nickname").toString());
        }
        
        // view(.jsp) 설정
 		ModelAndView modelAndView = new ModelAndView();
 		modelAndView.setViewName("redirect:/page_main.do");
        
        return modelAndView;
    }

	@RequestMapping("/page_memberLogin.do")
	ModelAndView page_memberLogin() {

		// view(.jsp) 설정
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/member/page_memberLogin");
		
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
		modelAndView.setViewName("/member/act_memberLogin");
		
		//유저 존재 여부 확인
		int flag = mapper.selectUser(email,password);
		
		// 회원가입이 정상적으로 되면 세션 생성
		if(flag==1) {
			HttpSession session = request.getSession();
	    	session.setAttribute("email",email);
	    	String name = mapper.selectUserName(email);
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
		modelAndView.setViewName("/member/page_memberRegister");
		// 데이터 전송
		// modelAndView.addObject("data_name", data);

		// view 페이지로 반환
		return modelAndView;
	}
	
	
	// 유저 회원가입 함수
	@RequestMapping("/act_memberRegister.do")
	ModelAndView act_memberRegister(
			@RequestParam("name") String name,
			@RequestParam("email") String email,
			@RequestParam("password") String password,
			HttpServletRequest request
			) {

		// view(.jsp) 설정
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/member/act_memberRegister");
		
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
		modelAndView.setViewName("/member/page_memberModify");
		// 데이터 전송
		// modelAndView.addObject("data_name", data);

		// view 페이지로 반환
		return modelAndView;
	}
	
	
	@RequestMapping("/act_memberModify.do")
	ModelAndView act_memberModify() {
		
		// view(.jsp) 설정
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/member/act_memberModify");
		// 데이터 전송
		// modelAndView.addObject("data_name", data);
		
		// view 페이지로 반환
		return modelAndView;
	}
	
	
	@RequestMapping("/page_memberDelete.do")
	ModelAndView page_memberDelete() {
		
		// view(.jsp) 설정
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/member/page_memberDelete");
		// 데이터 전송
		// modelAndView.addObject("data_name", data);
		
		// view 페이지로 반환
		return modelAndView;
	}
	
	
	@RequestMapping("/act_memberDelete.do")
	ModelAndView act_memberDelete() {
		
		// view(.jsp) 설정
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/member/act_memberDelete");
		// 데이터 전송
		// modelAndView.addObject("data_name", data);
		
		// view 페이지로 반환
		return modelAndView;
	}
	
	
	@RequestMapping("/page_surveyHistory.do")
	ModelAndView page_surveyHistory() {
		
		// view(.jsp) 설정
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/member/page_surveyHistory");
		// 데이터 전송
		// modelAndView.addObject("data_name", data);
		
		// view 페이지로 반환
		return modelAndView;
	}
	
	
	@RequestMapping("/page_memberInfo.do")
	ModelAndView page_memberInfo() {
		
		// view(.jsp) 설정
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/member/page_memberInfo");
		// 데이터 전송
		// modelAndView.addObject("data_name", data);
		
		// view 페이지로 반환
		return modelAndView;
	}
	
	
	@RequestMapping("/page_bookmarkList.do")
	ModelAndView page_bookmarkList() {
		
		// view(.jsp) 설정
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/member/page_bookmarkList");
		// 데이터 전송
		// modelAndView.addObject("data_name", data);
		
		// view 페이지로 반환
		return modelAndView;
	}
	
	
	@RequestMapping("/page_bookmarkDelete.do")
	ModelAndView page_bookmarkDelete() {
		
		// view(.jsp) 설정
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/member/page_bookmarkDelete");
		// 데이터 전송
		// modelAndView.addObject("data_name", data);
		
		// view 페이지로 반환
		return modelAndView;
	}
	
	
	@RequestMapping("/act_bookmarkDelete.do")
	ModelAndView act_bookmarkDelete() {
		
		// view(.jsp) 설정
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/member/page_bookmarkDeleteOk");
		// 데이터 전송
		// modelAndView.addObject("data_name", data);
		
		// view 페이지로 반환
		return modelAndView;
	}
	
	
	@RequestMapping("/page_searchHistory.do")
	ModelAndView page_searchHistory() {
		
		// view(.jsp) 설정
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/member/page_searchHistory");
		// 데이터 전송
		// modelAndView.addObject("data_name", data);
		
		// view 페이지로 반환
		return modelAndView;
	}
	
	
	@RequestMapping("/page_searchHistoryDelete.do")
	ModelAndView page_searchHistoryDelete() {
		
		// view(.jsp) 설정
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/member/page_searchHistoryDelete");
		// 데이터 전송
		// modelAndView.addObject("data_name", data);
		
		// view 페이지로 반환
		return modelAndView;
	}
	
	
	@RequestMapping("/act_searchHistoryDelete.do")
	ModelAndView act_searchHistoryDelete() {
		
		// view(.jsp) 설정
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/member/page_searchHistoryDeleteOk");
		// 데이터 전송
		// modelAndView.addObject("data_name", data);
		
		// view 페이지로 반환
		return modelAndView;
	}

	@RequestMapping("/json_getUserCount.do")
	@ResponseBody
	Map<String, Integer> json_getUserCount(@RequestParam String email) {
		Map<String, Integer> map = new HashMap<>();

		// userCount: 해당 이메일을 가진 유저 수 (1 or 0)
		int userCount = mapper.selectKakaoUser(email);
		map.put("userCount", userCount);

		return map;
	}
	

}

package com.dockbang.controller;

import org.json.simple.JSONObject;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dockbang.mapper.SqlMapperInter;
import com.dockbang.model.BoardDAO;
import com.dockbang.model.MemberTO;

import java.util.Map;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@MapperScan(basePackages = {"com.dockbang.mapper"})
public class MypageController {
    @Autowired
    BoardDAO bdao;

    @Autowired
	private SqlMapperInter mapper;

    @RequestMapping("/page_mypage.do")
    ModelAndView page_mypage(HttpServletRequest request) {
        // view(.jsp) 설정
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/mypage/page_mypage");

        // 세션에서 이메일 가져오기
        HttpSession session = request.getSession();
        String userEmail = (String) session.getAttribute("email");

        if (userEmail != null) {
            // 사용자 정보 조회
//            Map<String, String> userInfo = mapper.selectUserInfo(userEmail);
            MemberTO userInfo = mapper.selectUserInfo(userEmail);

            // 데이터 전송
            modelAndView.addObject("userInfo", userInfo);
        }

        // view 페이지로 반환
        return modelAndView;
    }
    
    @RequestMapping("/act_addBookmark.do")
    @ResponseBody
    JSONObject act_addBookmark(String userEmail, String saleSeq, String memo) {
    	JSONObject obj = new JSONObject();
    	
    	// 0:실패 1:성공
    	int flag = mapper.addUserBookmark(userEmail, saleSeq, memo);
    	
    	obj.put("flag", flag);
    	
    	return obj;
    }
    
}
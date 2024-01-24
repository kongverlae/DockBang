package com.dockbang.controller;

import com.dockbang.model.BookmarkTO;
import com.dockbang.model.HistoryTO;
import com.dockbang.model.MemberDAO;
import com.dockbang.model.SaleTO;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.json.simple.JSONObject;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dockbang.model.MemberTO;
import com.dockbang.model.SaleDAO;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@MapperScan(basePackages = {"com.dockbang.mapper"})
public class MypageController {
    @Autowired
    MemberDAO mdao;
    
    @Autowired
    SaleDAO sdao;

    @RequestMapping("/page_mypage.do")
    ModelAndView page_mypage(HttpServletRequest request) {
        // view(.jsp) 설정
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/mypage/page_mypage");

        // 세션에서 이메일 가져오기
        HttpSession session = request.getSession();
        String userEmail = (String) session.getAttribute("email");
        
        // 유저 히스토리 리스트
        List<HistoryTO> historyTOList = null;
        // 유저 히스토리 매물 리스트 가져오기
        List<SaleTO> historySaleList = null;

        // 로그인한 유저면
        if (userEmail != null) {
            // 사용자 정보 조회
//            Map<String, String> userInfo = mapper.selectUserInfo(userEmail);
            MemberTO userInfo = mdao.getMemberTO(userEmail);

            // 데이터 전송
            modelAndView.addObject("userInfo", userInfo);

//            System.out.println("userinfo: " + userInfo);
            
            // 유저 히스토리 리스트 가져오기
            historyTOList = mdao.getHistoryTOList(userInfo);
//            System.out.println("historyTOList size: " + historyTOList.size());

            // 유저 히스토리 매물 리스트 가져오기
            historySaleList = new ArrayList<>();
            for(HistoryTO historyTO:historyTOList){
                // sale seq로 매물정보 불러오기
                SaleTO saleTO = sdao.getSaleInfo(historyTO.getSaleseq());
                historySaleList.add(saleTO);
            }
        }
        

        // 북마크 정보
        List<BookmarkTO> bookmarkTOList = mdao.getBookmarkTOList(userEmail);
        // 북마크에 등록된 매물 정보
        List<SaleTO> bookmarkSaleList = new ArrayList<>();

        for(BookmarkTO bookmarkTO:bookmarkTOList){
            // sale seq로 매물정보 불러오기
        	SaleTO saleTO = sdao.getSaleInfo(bookmarkTO.getSaleseq());
            bookmarkSaleList.add(saleTO);
        }

        // js의 array로 표현하기
        ObjectMapper objectMapper = new ObjectMapper();
        String bookmarkSaleListJson = "";
        String bookmarkTOListJson = "";
        String historyTOListJson = "";
        String historySaleListJson = "";
        try {
            // 북마크 리스트
            Collections.reverse(bookmarkTOList);
            bookmarkTOListJson = objectMapper.writeValueAsString(bookmarkTOList);
        	// 북마크 매물 리스트
            Collections.reverse(bookmarkSaleList);
            bookmarkSaleListJson = objectMapper.writeValueAsString(bookmarkSaleList);
            // 유저 히스토리 리스트
            Collections.reverse(historyTOList);
            historyTOListJson = objectMapper.writeValueAsString(historyTOList);
            // 유저 히스토리 매물 리스트
            Collections.reverse(historySaleList);
            historySaleListJson = objectMapper.writeValueAsString(historySaleList);

        } catch (JsonProcessingException e) {
            System.out.println("에러: " + e.getMessage());
        } finally {

            // 북마크 리스트
            modelAndView.addObject("bookmarkTOListJson", bookmarkTOListJson);
        	// 북마크 매물 리스트
            modelAndView.addObject("bookmarkSaleListJson", bookmarkSaleListJson);
            // 유저 히스토리 리스트
            modelAndView.addObject("historyTOListJson", historyTOListJson);
            // 유저 히스토리 매물 리스트
            modelAndView.addObject("historySaleListJson", historySaleListJson);
        }

        // view 페이지로 반환
        return modelAndView;
    }
    
    @RequestMapping("/act_addBookmark.do")
    @ResponseBody
    JSONObject act_addBookmark(String userEmail, String saleSeq, String memo) {
    	JSONObject obj = new JSONObject();
    	
    	// 0:실패 1:성공
    	int flag = mdao.addUserBookmark(userEmail, saleSeq, memo);
    	
    	obj.put("flag", flag);
    	
    	return obj;
    }
    
}
package com.dockbang.controller;

import com.dockbang.model.KakaoDAO;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

@Slf4j
@RestController
@RequestMapping("")
public class KakaoLoginController {

    @Value("${kakao.client_id}")
    private String client_id;

    @Autowired
    private KakaoDAO kakaoService;

    @GetMapping("/callback")
    ModelAndView callback(@RequestParam("code") String code) throws IOException {
        String accessToken = kakaoService.getAccessTokenFromKakao(client_id, code);
        HashMap<String, Object> userInfo = kakaoService.getUserInfo(accessToken);
        // User 로그인, 또는 회원가입 로직 추가
        System.out.println(userInfo.toString());
        
        // view(.jsp) 설정
 		ModelAndView modelAndView = new ModelAndView();
 		modelAndView.setViewName("redirect:/page_main.do");
        
        return modelAndView;
    }
}

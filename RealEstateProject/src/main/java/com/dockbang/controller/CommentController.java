package com.dockbang.controller;

import org.apache.catalina.mapper.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.dockbang.mapper.SqlMapperInter;
import com.dockbang.model.BoardDAO;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class CommentController {
	@Autowired
	BoardDAO bDao;
	
	@Autowired
	private SqlMapperInter mapper;
	
	@RequestMapping("/act_commentWrite.do")
	ModelAndView act_commentWrite(HttpServletRequest request,
			@RequestParam("category") String category,
			@RequestParam("content") String content,
			@RequestParam("userseq") String userseq,
			@RequestParam("writer") String writer,
			@RequestParam("boardseq") int boardseq
			) {
		System.out.println(writer);
		System.out.println(boardseq);
		int flag = 0;
		
			flag = mapper.insertComment(content,userseq, writer, boardseq);
		
		// view(.jsp) 설정
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/board/act_commentWrite");
		
		modelAndView.addObject("flag", flag);
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
	ModelAndView page_commentDeleteOk(HttpServletRequest request,
			@RequestParam("userseq") String userseq
			) {
		
		System.out.println(userseq);
		
		
		
		int flag = 0;
		
		
		
		System.out.println(userseq);
		if ("비회원".equals(userseq)) {
		    flag = 2;
		} else if (!"비회원".equals(userseq)) {
		    flag = mapper.deleteComment(userseq);
		}
		System.out.println(flag);
		// view(.jsp) 설정
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/board/act_commentDelete");
		
		modelAndView.addObject("flag", flag);
		// 데이터 전송
		// modelAndView.addObject("data_name", data);
		
		// view 페이지로 반환
		return modelAndView;
	}
	
	
}

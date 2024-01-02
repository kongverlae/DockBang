package com.dockbang.controller;

import java.io.File;
import java.io.IOException;
import java.net.InetAddress;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.dockbang.mapper.SqlMapperInter;
import com.dockbang.model.BoardDAO;
import com.dockbang.model.BoardTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class BoardController {
	@Autowired
	BoardDAO bdao;
	
	@Autowired
	private SqlMapperInter mapper;
	
	@RequestMapping("/page_boardChoose.do")
	ModelAndView page_boardChoose() {
		// view(.jsp) 설정
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/board/page_boardChoose");

		// 데이터 전송
		// modelAndView.addObject("data_name", data);

		// view 페이지로 반환
		return modelAndView;
	}
	
	/* 였던것
	 * @RequestMapping("/page_boardList.do") ModelAndView
	 * page_boardList(@RequestParam("category") String category) {
	 * 
	 * // view(.jsp) 설정 ModelAndView modelAndView = new ModelAndView();
	 * modelAndView.setViewName("/board/page_boardList");
	 * 
	 * List<BoardTO> boardList = mapper.selectBoard(category);
	 * 
	 * // 데이터 전송 modelAndView.addObject("category", category);
	 * modelAndView.addObject("boardList", boardList);
	 * 
	 * // view 페이지로 반환 return modelAndView; }
	 */
	
	@RequestMapping("/page_boardList.do")
	ModelAndView page_boardList() {
		
		// view(.jsp) 설정
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/board/page_boardList");
		
		// 데이터 전송

		// view 페이지로 반환
		return modelAndView;
	}
	
	
	@RequestMapping("/page_boardWrite.do")
	ModelAndView page_boardWrite(@RequestParam("category") String category) {

		// view(.jsp) 설정
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/board/page_boardWrite");
		// 데이터 전송
		// modelAndView.addObject("data_name", data);
		modelAndView.addObject("category", category);

		// view 페이지로 반환
		return modelAndView;
	}
	
	@RequestMapping("/act_boardWrite.do")
	ModelAndView act_boardWrite(MultipartFile upload, HttpServletRequest request, 
			@RequestParam("category") String category,
			@RequestParam("subject") String subject,
			@RequestParam("writer") String writer,
			@RequestParam("content") String content
			) {		
		int flag = 0;
		try {
			if(!upload.isEmpty()) {
				String wip = InetAddress.getLocalHost().getHostAddress();
				String filename = upload.getOriginalFilename();
				long filesize = upload.getSize();
				upload.transferTo(new File("C:\\DockBang\\RealEstateProject\\src\\main\\webapp\\images\\board",upload.getOriginalFilename()));
				HttpSession session = request.getSession();
		    	String email = (String)session.getAttribute("email");
				flag = mapper.insertBoard(subject, writer, content, filename, filesize, wip, email, category);
			}
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// view(.jsp) 설정
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/board/act_boardWrite");
		// 데이터 전송
		// modelAndView.addObject("data_name", data);
		modelAndView.addObject("category", category);
		modelAndView.addObject("flag", flag);

		// view 페이지로 반환
		return modelAndView;
	}
	
	@RequestMapping("/page_boardView.do")
	ModelAndView page_boardView(@RequestParam("category") String category) {

		// view(.jsp) 설정
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/board/page_boardView");
		// 데이터 전송
		// modelAndView.addObject("data_name", data);
		modelAndView.addObject("category", category);

		// view 페이지로 반환
		return modelAndView;
	}
	
	@RequestMapping("/page_boardModify.do")
	ModelAndView page_boardFreeModify(@RequestParam("category") String category) {

		// view(.jsp) 설정
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/board/page_boardModify");
		// 데이터 전송
		// modelAndView.addObject("data_name", data);
		modelAndView.addObject("category", category);

		// view 페이지로 반환
		return modelAndView;
	}
	
	@RequestMapping("/page_boardDelete.do")
	ModelAndView page_boardDelete(@RequestParam("category") String category) {

		// view(.jsp) 설정
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/board/page_boardDelete");
		// 데이터 전송
		// modelAndView.addObject("data_name", data);
		modelAndView.addObject("category", category);

		// view 페이지로 반환
		return modelAndView;
	}

}

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
	ModelAndView page_boardList(@RequestParam("category") String category) {
		
		// view(.jsp) 설정
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/board/page_boardList");
		
		List<BoardTO> boardList = mapper.selectBoard(category);
		modelAndView.addObject("category", category);
		modelAndView.addObject("boardList", boardList);
		 
		
		// 데이터 전송

		// view 페이지로 반환
		return modelAndView;
	}
	
	
	@RequestMapping("/page_boardWrite.do")
	//ModelAndView page_boardWrite(@RequestParam("category") String category) {
	ModelAndView page_boardWrite(@RequestParam("category") String category) {

		// view(.jsp) 설정
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/board/page_boardWrite");
		// 데이터 전송
		// modelAndView.addObject("data_name", data);
		
		// 임시로 지움
		modelAndView.addObject("category", category);

		// view 페이지로 반환
		
		
		return modelAndView;
	}
	
	@RequestMapping("/act_boardWrite.do")
	ModelAndView act_boardWrite(MultipartFile upload, HttpServletRequest request, 
			@RequestParam("subject") String subject,
			@RequestParam("content") String content,
			@RequestParam("category") String category
			
			) {		
		int flag = 0;
		//String category = request.getParameter("category");
		try {
			if(!upload.isEmpty()) {
				String wip = InetAddress.getLocalHost().getHostAddress();
				String filename = upload.getOriginalFilename();
				long filesize = upload.getSize();
				upload.transferTo(new File("C:\\project_dockbang\\DockBang\\RealEstateProject\\src\\main\\webapp\\images\\file",upload.getOriginalFilename()));
				HttpSession session = request.getSession();
		    	String email = (String)session.getAttribute("email");
		    	String name = (String)session.getAttribute("nickname");
		    	//String category1 = (String)session.getAttribute("category");
		    System.out.println(category);
				flag = mapper.insertBoard(subject, name, content, filename, filesize, wip, email, category);
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
	
	@RequestMapping("/act_boardModify.do")
	public ModelAndView act_boardModify(
	    @RequestParam(value = "upload", required = false) MultipartFile upload,
	    HttpServletRequest request,
	    @RequestParam("subject") String subject,
	    @RequestParam("content") String content,
	    @RequestParam("category") String category,
	    @RequestParam("boardseq") int boardseq) {

	    int flag = 0;
	    String filename = "";
	    long filesize = 0; // filesize 변수를 블록 외부에서 선언

	    try {
	        // 파일이 업로드되었는지 확인
	        if (upload != null && !upload.isEmpty()) {
	            filename = upload.getOriginalFilename();
	            filesize = upload.getSize();
	            // 파일 저장 경로
	            String uploadPath = "C:\\project_dockbang\\DockBang\\RealEstateProject\\src\\main\\webapp\\images\\file";
	            upload.transferTo(new File(uploadPath, filename));
	        }

	        // 게시글 수정
	        flag = mapper.updateBoard(subject, content, filename, filesize, category, boardseq);
	    } catch (IllegalStateException | IOException e) {
	        // 파일 업로드 또는 게시글 수정 중 예외 처리
	        e.printStackTrace();
	        // 예외에 대한 적절한 응답을 클라이언트에게 전달하거나, 로깅하여 나중에 디버깅에 사용
	    }

	    // ModelAndView 설정
	    ModelAndView modelAndView = new ModelAndView();
	    modelAndView.setViewName("/board/act_boardModify");
	    modelAndView.addObject("category", category);
	    modelAndView.addObject("boardseq", boardseq);
	    modelAndView.addObject("flag", flag);

	    return modelAndView;
	}
	
	@RequestMapping("/act_boardDelete.do")
	public ModelAndView act_boardDelete(HttpServletRequest request,
	        @RequestParam("password") String password,
	        @RequestParam("category") String category,
	        @RequestParam("boardseq") int boardseq) {

	    
	    int flag = 0;
	    // 세션에서 비밀번호 가져오기
	    String sessionPassword = (String) request.getSession().getAttribute("password");

	    if (password.equals(sessionPassword)) {
	
	       flag = mapper.deleteBoard(category, boardseq);
	    } 
	    ModelAndView modelAndView = new ModelAndView();
	    modelAndView.addObject("category", category);
	    modelAndView.addObject("boardseq", boardseq);
	    modelAndView.addObject("flag", flag);
	    
	    
	    return modelAndView;
	}
	
	@RequestMapping("/page_boardView.do")
	ModelAndView page_boardView(HttpServletRequest request, @RequestParam("boardseq") Integer boardseq, @RequestParam("category") String category) {
	    
	    // view(.jsp) 설정
	    ModelAndView modelAndView = new ModelAndView();
	    modelAndView.setViewName("/board/page_boardView");
	    
	    // 게시글 조회
	    List<BoardTO> boardView = mapper.selectView(boardseq);
	    
	    // 조회수 증가
	    mapper.updateHit(boardseq);
	    
	    // 데이터 전송
	    modelAndView.addObject("boardseq", boardseq);
	    modelAndView.addObject("category", category);
	    modelAndView.addObject("boardView", boardView);
	    
	    // view 페이지로 반환
	    return modelAndView;
	}

	/*
	 * @RequestMapping("/page_boardView.do") ModelAndView
	 * page_boardView(@RequestParam("category") String category) {
	 * 
	 * // view(.jsp) 설정 ModelAndView modelAndView = new ModelAndView();
	 * modelAndView.setViewName("/board/page_boardView"); // 데이터 전송 //
	 * modelAndView.addObject("data_name", data); modelAndView.addObject("category",
	 * category);
	 * 
	 * // view 페이지로 반환 return modelAndView; }
	 */	
	@RequestMapping("/page_boardModify.do")
	ModelAndView page_boardModify(HttpServletRequest request, @RequestParam("boardseq") Integer boardseq, @RequestParam("category") String category) {

		// view(.jsp) 설정
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/board/page_boardModify");
		List<BoardTO> boardView = mapper.selectView(boardseq);
		
		modelAndView.addObject("boardseq",boardseq);
		modelAndView.addObject("category",category);
		
		modelAndView.addObject("boardView", boardView);
		// 데이터 전송
		// modelAndView.addObject("data_name", data);

		// view 페이지로 반환
		return modelAndView;
	}

	/*
	 * @RequestMapping("/page_boardModify.do") ModelAndView
	 * page_boardFreeModify(@RequestParam("category") String category) {
	 * 
	 * // view(.jsp) 설정 ModelAndView modelAndView = new ModelAndView();
	 * modelAndView.setViewName("/board/page_boardModify"); // 데이터 전송 //
	 * modelAndView.addObject("data_name", data); modelAndView.addObject("category",
	 * category);
	 * 
	 * // view 페이지로 반환 return modelAndView; }
	 */	
	@RequestMapping("/page_boardDelete.do")
	ModelAndView page_boardDelete(HttpServletRequest request, @RequestParam("boardseq") Integer boardseq, @RequestParam("category") String category) {

		// view(.jsp) 설정
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/board/page_boardDelete");
		List<BoardTO> boardView = mapper.selectView(boardseq);
		// 데이터 전송
		// modelAndView.addObject("data_name", data);
		
		modelAndView.addObject("boardseq",boardseq);
		modelAndView.addObject("category",category);
		
		modelAndView.addObject("boardView", boardView);
		// view 페이지로 반환
		return modelAndView;
	}

}

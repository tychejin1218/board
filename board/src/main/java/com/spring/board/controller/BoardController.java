package com.spring.board.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.board.dto.BoardDto;
import com.spring.board.form.BoardForm;
import com.spring.board.service.BoardService;

@Controller
@RequestMapping(value = "/board")
public class BoardController {

	@Autowired
	private BoardService boardService;

	/** 게시판 - 목록 페이지 이동 */
	@RequestMapping( value = "/boardList")
	public String boardList(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		return "board/boardList";
	}
		
	/** 게시판 - 목록 조회  */
	@RequestMapping(value = "/getBoardList")
	@ResponseBody
	public List<BoardDto> getBoardList(HttpServletRequest request, HttpServletResponse response, BoardForm boardForm) throws Exception {

		List<BoardDto> boardList = boardService.getBoardList(boardForm);

		return boardList;
	}
	
	/** 게시판 - 상세 페이지 이동 */
	@RequestMapping( value = "/boardDetail")
	public String boardDetail(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		return "board/boardDetail";
	}	
	
	/** 게시판 - 상세 조회  */
	@RequestMapping(value = "/getBoardDetail")
	@ResponseBody
	public BoardDto getBoardDetail(HttpServletRequest request, HttpServletResponse response, BoardForm boardForm) throws Exception {
		System.out.println("@@@@@@@@@@@@@@@@@@@@");
		System.out.println(boardForm.getBoard_seq());
		BoardDto boardDetail = boardService.getBoardDetail(boardForm);

		return boardDetail;
	}
}

package com.spring.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.board.dao.BoardDao;
import com.spring.board.dto.BoardDto;
import com.spring.board.form.BoardForm;

@Service
public class BoardService {

	@Autowired
	private BoardDao boardDao;

	/** 게시판 - 목록 조회  */
	public List<BoardDto> getBoardList(BoardForm boardForm) throws Exception {

		return boardDao.getBoardList(boardForm);
	}
	
	/** 게시판 - 상세 조회  */
	public BoardDto getBoardDetail(BoardForm boardForm) throws Exception {
		System.out.println("@@@@@@@@@@@@@@@@@@@@");
		System.out.println(boardForm.getBoard_seq());
		return boardDao.getBoardDetail(boardForm);
	}
}

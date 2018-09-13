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

	public List<BoardDto> getBoardList(BoardForm boardForm) throws Exception {

		return boardDao.getBoardList(boardForm);
	}
}

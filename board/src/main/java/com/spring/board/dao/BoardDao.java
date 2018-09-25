package com.spring.board.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.board.dto.BoardDto;
import com.spring.board.form.BoardForm;

@Repository
public class BoardDao {

	@Resource(name = "sqlSession")
	private SqlSession sqlSession;

	private static final String NAMESPACE = "com.spring.board.boardMapper";

	/** 게시판 - 목록 조회  */
	public List<BoardDto> getBoardList(BoardForm boardForm) throws Exception {

		return sqlSession.selectList(NAMESPACE + ".getBoardList");
	}
	
	/** 게시판 - 상세 조회  */
	public BoardDto getBoardDetail(BoardForm boardForm) throws Exception {
		System.out.println("@@@@@@@@@@@@@@@@@@@@");
		System.out.println(boardForm.getBoard_seq());
		return sqlSession.selectOne(NAMESPACE + ".getBoardDetail");
	}
}

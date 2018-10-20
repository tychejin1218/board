package com.spring.board.service;

import java.io.FileNotFoundException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.board.dao.BoardDao;
import com.spring.board.dto.BoardDto;
import com.spring.board.form.BoardForm;

@Service()
public class BoardService {

	@Autowired
	private BoardDao boardDao;

	/** 게시판 - 목록 조회 */
	public List<BoardDto> getBoardList(BoardForm boardForm) throws Exception {

		return boardDao.getBoardList(boardForm);
	}

	/** 게시판 - 상세 조회 */
	public BoardDto getBoardDetail(BoardForm boardForm) throws Exception {

		BoardDto boardDto = new BoardDto();

		String searchType = boardForm.getSearch_type();

		if ("S".equals(searchType)) {

			int updateCnt = boardDao.updateBoardHits(boardForm);

			if (updateCnt > 0) {
				boardDto = boardDao.getBoardDetail(boardForm);
			}

		} else {

			boardDto = boardDao.getBoardDetail(boardForm);
		}

		return boardDto;
	}

	/** 게시판 - 등록 */
	public BoardDto insertBoard(BoardForm boardForm) throws Exception {

		BoardDto boardDto = new BoardDto();

		int insertCnt = 0;
		
		insertCnt = boardDao.insertBoard(boardForm);
		
		//insertCnt = boardDao.insertBoardFail(boardForm);

		if (insertCnt > 0) {
			boardDto.setResult("SUCCESS");
		} else {
			boardDto.setResult("FAIL");
		}

		return boardDto;
	}

	/** 게시판 - 삭제 */
	public BoardDto deleteBoard(BoardForm boardForm) throws Exception {

		BoardDto boardDto = new BoardDto();

		int deleteCnt = boardDao.deleteBoard(boardForm);

		if (deleteCnt > 0) {
			boardDto.setResult("SUCCESS");
		} else {
			boardDto.setResult("FAIL");
		}

		return boardDto;
	}

	/** 게시판 - 수정 */
	public BoardDto updateBoard(BoardForm boardForm) throws Exception {

		BoardDto boardDto = new BoardDto();

		int deleteCnt = boardDao.updateBoard(boardForm);

		if (deleteCnt > 0) {
			boardDto.setResult("SUCCESS");
		} else {
			boardDto.setResult("FAIL");
		}

		return boardDto;
	}
}

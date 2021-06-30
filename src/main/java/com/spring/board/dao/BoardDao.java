package com.spring.board.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.board.dto.BoardDto;
import com.spring.board.dto.BoardFileDto;
import com.spring.board.form.BoardFileForm;
import com.spring.board.form.BoardForm;

@Repository
public class BoardDao {

	@Resource(name = "sqlSession")
	private SqlSession sqlSession;

	private static final String NAMESPACE = "com.spring.board.boardMapper";

	/** 게시판 - 목록 수 */
	public int getBoardCnt(BoardForm boardForm) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".getBoardCnt", boardForm);
	}

	/** 게시판 - 목록 조회 */
	public List<BoardDto> getBoardList(BoardForm boardForm) throws Exception {		
		return sqlSession.selectList(NAMESPACE + ".getBoardList", boardForm);
	}

	/** 게시판 - 조회 수 수정 */
	public int updateBoardHits(BoardForm boardForm) throws Exception {
		return sqlSession.update(NAMESPACE + ".updateBoardHits", boardForm);
	}

	/** 게시판 - 상세 조회 */
	public BoardDto getBoardDetail(BoardForm boardForm) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".getBoardDetail", boardForm);
	}
	
	/** 게시판 - 첨부파일 조회 */
	public List<BoardFileDto> getBoardFileList(BoardFileForm boardFileForm) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".getBoardFileList", boardFileForm);
	}

	/** 게시판 - 그룹 번호 조회 */
	public int getBoardReRef(BoardForm boardForm) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".getBoardReRef", boardForm);
	}
	
	/** 게시판 - 등록 */
	public int insertBoard(BoardForm boardForm) throws Exception {
		return sqlSession.insert(NAMESPACE + ".insertBoard", boardForm);
	}
	
	/** 게시판 - 첨부파일 등록 */
	public int insertBoardFile(BoardFileForm boardFileForm) throws Exception {
		return sqlSession.insert(NAMESPACE + ".insertBoardFile", boardFileForm);
	}

	/** 게시판 - 등록 실패(트랜잭션 테스트) */
	public int insertBoardFail(BoardForm boardForm) throws Exception {
		return sqlSession.insert(NAMESPACE + ".insertBoardFail", boardForm);
	}

	/** 게시판 - 삭제 */
	public int deleteBoard(BoardForm boardForm) throws Exception {
		return sqlSession.delete(NAMESPACE + ".deleteBoard", boardForm);
	}

	/** 게시판 - 수정 */
	public int updateBoard(BoardForm boardForm) throws Exception {
		return sqlSession.update(NAMESPACE + ".updateBoard", boardForm);
	}
	
	/** 게시판 - 답글 정보  조회 */
	public BoardDto getBoardReplyInfo(BoardForm boardForm) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".getBoardReplyInfo", boardForm);
	}
	
	/** 게시판 - 답글의 순서 수정 */
	public int updateBoardReSeq(BoardForm boardForm) throws Exception {
		return sqlSession.update(NAMESPACE + ".updateBoardReSeq", boardForm);
	}
	
	/** 게시판 - 답글 등록 */
	public int insertBoardReply(BoardForm boardForm) throws Exception {
		return sqlSession.insert(NAMESPACE + ".insertBoardReply", boardForm);
	}
	
	/** 게시판 - 첨부파일 삭제 */
	public int deleteBoardFile(BoardFileForm boardFileForm) throws Exception {
		return sqlSession.update(NAMESPACE + ".deleteBoardFile", boardFileForm);
	}
}
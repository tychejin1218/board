package com.spring.board;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.board.dto.BoardDto;
import com.spring.board.form.BoardForm;
import com.spring.board.service.BoardService;

@RunWith(SpringJUnit4ClassRunner.class)
// @ContextConfiguration(locations = { "file:src/test/resources/appContext/appServlet/servlet-context.xml" ,
// "file:src/test/resources/appContext/root-context.xml" })
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/*.xml", "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" })
public class BoardTest {

	protected final Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private BoardService boardService;

	@Test
	public void getBoardList() {

		BoardForm boardForm = new BoardForm();

		try {

			List<BoardDto> boardList = boardService.getBoardList(boardForm);

			logger.info("boardList.size() : [{}]", boardList.size());

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

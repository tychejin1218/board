package com.spring.board;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/*.xml" })
public class MyBatisTest {
	
	protected final Logger logger = LoggerFactory.getLogger(this.getClass());

	@Inject
	private SqlSessionFactory sqlSessionFactory;

	@Test
	public void MyBatisSessionTest() throws Exception {
		
		SqlSession sessios = null;

		try {
			logger.debug("sqlSessionFactory : [{}]", sqlSessionFactory);
			sessios = sqlSessionFactory.openSession();
			logger.debug("sessios : [{}]", sessios);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

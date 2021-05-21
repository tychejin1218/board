package com.spring.board;

import java.sql.Connection;

import javax.inject.Inject;
import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/*.xml" })
public class DataSourceTest {

	protected final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Inject
	private DataSource dataSource;

	@Test
	public void dataSourceConnectionTest() throws Exception {
		
		Connection connection = null;
		
		try {
			connection = dataSource.getConnection();
			logger.debug("connection : [{}]", connection);
		} catch (Exception e) {
			e.getMessage();
		}
	}
}


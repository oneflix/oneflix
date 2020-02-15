package com.spring.one;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

public class OracleTest {

	private static final String DRIVER = "oracle.jdbc.driver.OracleDriver";
	private static final String URL = "jdbc:oracle:thin:@onedb.cvcgi9hmcvdg.ap-northeast-2.rds.amazonaws.com:1521/ORCL";
	private static final String ID = "oneflix";
	private static final String PASS = "oneflix1";
	
	@Test
	public void testConnection() throws Exception {
		Class.forName(DRIVER);
		try (Connection conn = DriverManager.getConnection(URL, ID, PASS)) {
			System.out.println(conn);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

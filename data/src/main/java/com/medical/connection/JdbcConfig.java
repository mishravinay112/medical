package com.medical.connection;

import java.sql.Connection;

import org.apache.commons.dbcp.BasicDataSource;

public class JdbcConfig {
	static BasicDataSource bds = null;

	static {
		final String driverClassName = "com.mysql.jdbc.Driver";
		final String url = "jdbc:mysql://localhost:3306/medical_card";
		final String username = "root";
		final String password = "root";

		bds = new BasicDataSource();
		bds.setDriverClassName(driverClassName);
		bds.setUrl(url);
		bds.setUsername(username);
		bds.setPassword(password);
		bds.setInitialSize(5);
		bds.setMaxActive(50);

	}

	public static Connection getConnection() throws Exception {

		return bds.getConnection();
	}
}

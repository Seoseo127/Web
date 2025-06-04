package com.mystudy.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class JdbcUtil {
	private static final String DRIVER = "oracle.jdbc.OracleDriver";
	private static final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
	//private static final String URL = "jdbc:oracle:thin:@192.168.18.26:1521:xe";
	private static final String USER = "MYSTUDY";
	private static final String PASSWORD = "mystudypw";
	
	static {
		try {
			Class.forName(DRIVER);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	// DB연결 작업 기능
	public static Connection getConnection() throws SQLException {
		return DriverManager.getConnection(URL, USER, PASSWORD);
	}
	
	public static void close(Connection conn, Statement stmt, ResultSet rs) {
		try {
			if (rs != null) rs.close();
		} catch (SQLException e) {}
		close(conn, stmt);
	}
	
	public static void close(Connection conn, Statement stmt) {
		try {
			if (stmt != null) stmt.close();
		} catch (SQLException e) {}
		try {
			if (conn != null) conn.close();
		} catch (SQLException e) {}
	}
	
}

package com.mystudy.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.mystudy.common.JdbcUtil;
import com.mystudy.vo.EmployeeVO;

public class EmployeeDAO {
	private static final String SELECT_BY_ID = 
			"SELECT SABUN, NAME, REGDATE, PAY " +
			"FROM EMPLOYEE " +
			"WHERE SABUN = ? ";

	public List<EmployeeVO> select() {
		return null;
	}
	
	public EmployeeVO selectById(int sabun) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		EmployeeVO vo = null;
		try {
			conn = JdbcUtil.getConnection();
			pstmt = conn.prepareStatement(SELECT_BY_ID);
			pstmt.setInt(1, sabun);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				vo = new EmployeeVO(
						rs.getInt("SABUN"),
						rs.getString("NAME"),
						rs.getDate("REGDATE"),
						rs.getInt("PAY") );
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt, rs);
		}	
		return vo;
	}
	
	public int insert(EmployeeVO vo) {
		return 0;
	}
	
	public int update(EmployeeVO vo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = JdbcUtil.getConnection();
			
			StringBuilder sql = new StringBuilder();
			sql.append("UPDATE EMPLOYEE ");
			sql.append("   SET NAME = ? "); // 1
			sql.append("     , PAY = ? ");  // 2
			sql.append("     , REGDATE = SYSDATE ");
			sql.append("WHERE SABUN = ? "); // 3
			pstmt = conn.prepareStatement(sql.toString());
			
			pstmt.setString(1, vo.getName());
			pstmt.setInt(2, vo.getPay());
			pstmt.setInt(3, vo.getSabun());
			
			return pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			return -1;
		}
	}
	
	public int delete(int sabun) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		int result = 0;
		try {
			conn = JdbcUtil.getConnection();
			
			String sql = "DELETE FROM EMPLOYEE WHERE SABUN = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, sabun);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			result = -1;
		}
		
		return result;
	}
	
	public int delete(EmployeeVO vo) {
		return 0;
	}
	
}




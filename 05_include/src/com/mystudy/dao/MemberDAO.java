package com.mystudy.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mystudy.common.JdbcUtil;
import com.mystudy.vo.MemberVO;

public class MemberDAO {

	//(실습) 전체 데이터 조회(검색) - SELECT
	public List<MemberVO> selectAll() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		//List<MemberVO> list = new ArrayList<MemberVO>();
		List<MemberVO> list = null; //예외발생시 null 리턴을 위해
		
		try {
			conn = JdbcUtil.getConnection();
			
			StringBuilder sql = new StringBuilder();
			sql.append("SELECT IDX, ID, PWD, NAME, AGE, ADDRESS, REG ");
			sql.append("     , TO_CHAR(REG, 'YYYY-MM-DD') REG2 ");
			sql.append("FROM MEMBER2 ");
			sql.append("ORDER BY IDX ");
			pstmt = conn.prepareStatement(sql.toString());
			
			rs = pstmt.executeQuery();
			
			list = new ArrayList<MemberVO>();
			while (rs.next()) {
				//MemberVO vo = new MemberVO();
				//vo.setIdx(rs.getInt("IDX"));
				//vo.setId(rs.getString("ID"));
				//vo.setPwd(rs.getString("PWD"));
				
				MemberVO vo = new MemberVO(
						rs.getInt("IDX"), 
						rs.getString("ID"), 
						rs.getString("PWD"), 
						rs.getString("NAME"), 
						rs.getInt("AGE"), 
						rs.getString("ADDRESS"), 
						rs.getString("REG"));
				
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt, rs);
		}
		
		return list;
	}
	
	//(실습) ID로 검색 - SELECT
	public MemberVO selectOne(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		MemberVO vo = null; 
		
		try {
			conn = JdbcUtil.getConnection();
			
			StringBuilder sql = new StringBuilder();
			sql.append("SELECT IDX, ID, PWD, NAME, AGE, ADDRESS, REG ");
			sql.append("     , TO_CHAR(REG, 'YYYY-MM-DD') REG2 ");
			sql.append("FROM MEMBER2 ");
			sql.append("WHERE ID = ? ");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				vo = new MemberVO(
						rs.getInt("IDX"), 
						rs.getString("ID"), 
						rs.getString("PWD"), 
						rs.getString("NAME"), 
						rs.getInt("AGE"), 
						rs.getString("ADDRESS"), 
						rs.getString("REG"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt, rs);
		}
		
		return vo;
	}
	
	//(실습) 입력
	public int insert(MemberVO vo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = JdbcUtil.getConnection();
			
			StringBuilder sql = new StringBuilder();
			sql.append("INSERT INTO MEMBER2 ");
			sql.append("       (IDX, ID, PWD, NAME, AGE, ADDRESS) ");
			sql.append("VALUES (MEMBER2_SEQ.NEXTVAL, ?, ?, ?, ?, ?)");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getPwd());
			pstmt.setString(3, vo.getName());
			pstmt.setInt(4, vo.getAge());
			pstmt.setString(5, vo.getAddress());
			
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return -1;
		} finally {
			JdbcUtil.close(conn, pstmt);
		}
	}
	
	//(개인적) 수정
	public int update(MemberVO vo) {
		StringBuilder sql = new StringBuilder();
		sql.append("UPDATE MEMBER2 ");
		sql.append("   SET PWD = ? ");
		sql.append("     , NAME = ? ");
		sql.append("     , AGE = ? ");
		sql.append("     , ADDRESS = ? ");
		sql.append("     , REG = SYSDATE ");
		sql.append("WHERE ID = ?");
		
		try (Connection conn = JdbcUtil.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
			pstmt.setString(1, vo.getPwd());
			pstmt.setString(2, vo.getName());
			pstmt.setInt(3, vo.getAge());
			pstmt.setString(4, vo.getAddress());
			pstmt.setString(5, vo.getId());
			
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return -1;
		} 
	}
	
	//(실습) 삭제
	public int delete(String id) {
		String sql ="DELETE FROM MEMBER2 WHERE ID = ?";
		
		try (Connection conn = JdbcUtil.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);) {
			pstmt.setString(1, id);
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return -1;
		} 
	}
	
	public int delete(MemberVO vo) {
		return 0;
	}
	
}








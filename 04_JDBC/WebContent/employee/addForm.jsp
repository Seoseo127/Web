<%@page import="com.mystudy.common.JdbcUtil"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- DB연동 작업으로 사번구하기(자동채번 MAX + 1 적용) --%>
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	int sabun = -1;
	
	try {
		//2. DB연결 - Connection 객체 생성 <- DriverManager
		conn = JdbcUtil.getConnection();
		
		String sql = "SELECT NVL(MAX(SABUN), 1000) + 1 AS SABUN FROM EMPLOYEE";
		//3. Statement 문 실행(SQL 문 실행)
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		//4. SQL 실행 결과에 대한 처리
		//   - SELECT : 조회(검색) 데이터 결과 값에 대한 처리
		if (rs.next()) {
			sabun = rs.getInt(1);
		}
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		//5. 클로징 처리에 의한 자원 반납
		JdbcUtil.close(conn, pstmt, rs);
	}

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원등록</title>
</head>
<body>
	<h1>사원등록[ addForm.jsp ]</h1>
	<form action="insert.jsp" method="get">
		<table>
			<tr>
				<th>사번</th>
				<td>
					<input type="text" name="sabun" value="<%=sabun %>" readonly>
				</td>
			</tr>
			<tr>
				<th>성명</th>
				<td>
					<input type="text" name="name">
				</td>
			</tr>
			<tr>
				<th>금액</th>
				<td>
					<input type="number" name="pay">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="사원등록">
					<input type="reset" value="초기화">
				</td>
			</tr>
		</table>
	</form>
	
</body>
</html>
<%@page import="com.mystudy.vo.EmployeeVO"%>
<%@page import="com.mystudy.common.JdbcUtil"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--(실습) 전달받은 사번(sabun) 데이터 DB 조회(SELECT)해서 화면에 표시 --%>
<%
	//1. 파라미터 값 추출, 확인(sabun)
	int sabun = Integer.parseInt(request.getParameter("sabun"));

	//2. DB 데이터 조회 - sabun 과 일치하는 데이터 찾기(SELECT)
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	EmployeeVO vo = null;
	
	try {
		//2. DB연결 - Connection 객체 생성 <- DriverManager
		conn = JdbcUtil.getConnection();
		
		String sql = ""
				+ "SELECT SABUN, NAME, REGDATE, PAY "
				+ "FROM EMPLOYEE "
				+ "WHERE SABUN = ? ";
		//3. Statement 문 실행(SQL 문 실행)
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, sabun);
		
		//4. SQL 실행 결과에 대한 처리
		//   - SELECT : 조회(검색) 데이터 결과 값에 대한 처리
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
		//5. 클로징 처리에 의한 자원 반납
		JdbcUtil.close(conn, pstmt, rs);
	}	
	
	//3. 데이터 화면 출력
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세페이지</title>
</head>
<body>
	<h1>상세정보[ detail.jsp ]</h1>
	<%-- 테이블형식으로 사번, 성명, 날짜, 금액 표시 --%>
	<table border>
		<tr>
			<th>사번</th>
			<td><%=sabun %></td>
		</tr>
		<tr>
			<th>성명</th>
			<td><%=vo.getName() %></td>
		</tr>
		<tr>
			<th>날짜</th>
			<td><%=vo.getRegdate() %></td>
		</tr>
		<tr>
			<th>금액</th>
			<td><%=vo.getPay() %></td>
		</tr>
	</table>
	<p>
		<a href="editForm.jsp?sabun=<%=sabun %>">수정</a>
		<a href="list.jsp">전체목록보기</a>
		<a href="delete.jsp?sabun=<%=sabun %>">삭제</a>
	</p>
</body>
</html>








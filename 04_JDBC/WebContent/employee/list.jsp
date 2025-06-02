<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.mystudy.common.JdbcUtil"%>
<%@page import="com.mystudy.vo.EmployeeVO"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%-- JDBC 프로그램으로 DB데이터를 가져와서 화면 출력 --%>
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	//DB 데이터 저장용 변수 선언
	List<EmployeeVO> list = null;
	int count = -1; // 수량
	try {
		//1. JDBC 드라이버 로딩(생략가능)
		//2. DB연결 - Connection 객체 생성 <- DriverManager
		conn = JdbcUtil.getConnection();
		
		String sql = ""
				+ "SELECT SABUN, NAME, REGDATE, PAY "
				+ "FROM EMPLOYEE "
				+ "ORDER BY SABUN ";
		//3. Statement 문 실행(SQL 문 실행)
		pstmt = conn.prepareStatement(sql);
		
		//4. SQL 실행 결과에 대한 처리
		//   - SELECT : 조회(검색) 데이터 결과 값에 대한 처리
		//   - INSERT, UPDATE, DELETE : int 값(건수) 처리
		rs = pstmt.executeQuery();
		
		list = new ArrayList<EmployeeVO>();
		while (rs.next()) {
			EmployeeVO vo = new EmployeeVO(
					rs.getInt("SABUN"),
					rs.getString("NAME"),
					rs.getDate("REGDATE"),
					rs.getInt("PAY") );
			list.add(vo);
		}
		
		rs.close();
		
		rs = pstmt.executeQuery("SELECT COUNT(*) AS CNT FROM EMPLOYEE");
		if (rs.next()) {
			count = rs.getInt(1);
		}
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		//5. 클로징 처리에 의한 자원 반납
		JdbcUtil.close(conn, pstmt, rs);
	}
	
	System.out.println("list : " + list);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체목록</title>
</head>
<body>
	<h1>전체목록[ list.jsp ]</h1>
	<table border>
		<thead>
			<tr>
				<th>사번</th>
				<th>성명</th>
				<th>날짜</th>
				<th>금액</th>
				<th>상세보기</th>
			</tr>
		</thead>
		<tbody>
			<%-- 
			<tr>
				<td>1001-샘플</td>
				<td>홍길동</td>
				<td>2025-05-30</td>
				<td>1000</td>
				<td>상세보기</td>
			</tr>
			--%>
<%
		for (EmployeeVO vo : list) { %>
			<tr>
				<td><%=vo.getSabun() %></td>
				<td><%=vo.getName() %></td>
				<td><%=vo.getRegdate() %></td>
				<td><%=vo.getPay() %></td>
				<td>
					<a href="detail.jsp?sabun=<%=vo.getSabun() %>">상세보기</a>
				</td>
			</tr>
<%
		}
%>			
		</tbody>
	</table>
	<p>전체인원 : <%=count %> 명</p>
	<p><a href="addForm.jsp">사원등록(입력화면으로 이동)</a></p>
</body>
</html>







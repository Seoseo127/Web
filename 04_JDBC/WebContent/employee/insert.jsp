<%@page import="com.mystudy.common.JdbcUtil"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--(실습) 전달받은 데이터를 이용해서 DB에 입력(INSERT) 처리 
	정상입력 : list.jsp 페이지로 이동(입력되었으면)
	예외발생 : 현재 페이지에 오류메시지 출력
--%>
<%
	//1. 파라미터 값 추출, 확인(sabun, name, pay)
	int sabun = Integer.parseInt(request.getParameter("sabun"));
	String name = request.getParameter("name");
	int pay = Integer.parseInt(request.getParameter("pay"));
	
	//2. DB 입력 작업
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	try {
		//2. DB연결 - Connection 객체 생성 <- DriverManager
		conn = JdbcUtil.getConnection();
		
		StringBuilder sql = new StringBuilder();
		sql.append("INSERT INTO EMPLOYEE ");
		sql.append("       (SABUN, NAME, REGDATE, PAY) ");
		sql.append("VALUES (?, ?, SYSDATE, ?) ");
		
		//3. Statement 문 실행(SQL 문 실행)
		//3-1 SQL 준비
		pstmt = conn.prepareStatement(sql.toString());
		//3-2 바인드변수에 값 설정
		pstmt.setInt(1, sabun);
		pstmt.setString(2, name);
		pstmt.setInt(3, pay);
		
		//3-3 준비된 SQL 실행
		int result = pstmt.executeUpdate();
		
		//4. SQL 실행 결과에 대한 처리
		//   - INSERT, UPDATE, DELETE : int 값(건수) 처리
		if (result > 0) {
			response.sendRedirect("list.jsp");
		}
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		//5. 클로징 처리에 의한 자원 반납
		JdbcUtil.close(conn, pstmt);
	}	
	
	//3. 화면전환(페이지 이동)
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예외발생</title>
</head>
<body>
	<h1>사원 등록 실패</h1>
	<p>입력처리를 하지 못했습니다<br>
	담당자(8282)에게 연락하세요</p>
	
	<a href="addForm.jsp">입력페이지로 이동</a>
	<a href="list.jsp">전체목록 보기</a>
	
</body>
</html>



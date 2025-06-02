<%@page import="com.mystudy.dao.EmployeeDAO"%>
<%@page import="com.mystudy.common.JdbcUtil"%>
<%@page import="com.mystudy.vo.EmployeeVO"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--(실습) 전달받은 데이터를 이용해서 DB에서 데이터 조회하고 화면에 표시 --%>
<%
	//1. 파라미터 값 추출, 확인(sabun)
	int sabun = Integer.parseInt(request.getParameter("sabun"));

	//2. DB 데이터 조회 - sabun 과 일치하는 데이터 찾기(SELECT)
	EmployeeDAO dao = new EmployeeDAO();
	EmployeeVO vo = dao.selectById(sabun);
	System.out.println("vo : " + vo);

	//3. 데이터 화면 출력
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정화면</title>
</head>
<body>
	<h1>수정화면[ editForm.jsp ]</h1>
	<form action="update.jsp" method="get">
		<table>
			<tr>
				<th>사번</th>
				<td>
					<input type="text" name="sabun" value="<%=vo.getSabun() %>" readonly>
				</td>
			</tr>
			<tr>
				<th>성명</th>
				<td>
					<input type="text" name="name" value="<%=vo.getName() %>">
				</td>
			</tr>
			<tr>
				<th>금액</th>
				<td>
					<input type="number" name="pay" value="<%=vo.getPay() %>">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="수 정">
					<input type="reset" value="초기화">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>









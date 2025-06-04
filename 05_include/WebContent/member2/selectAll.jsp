<%@page import="com.mystudy.vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@page import="com.mystudy.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--(실습) DB에서 전체 데이터 조회(SELECT)해서 화면 출력 --%>
<%
	//1. 전달받은 데이터 확인
	
	//2. DB 데이터 조회(SELECT)
	MemberDAO dao = new MemberDAO();
	List<MemberVO> list = dao.selectAll();
	
	//3. 화면 출력
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체 데이터 검색</title>
<script src="includee/event.js"></script>
</head>
<body>
	<%@ include file="includee/menu.jspf" %>

	<h1>전체 데이터 검색</h1>
	<table border>
		<thead>
			<tr>
				<th>번호</th>
				<th>아이디</th>
				<th>암호</th>
				<th>이름</th>
				<th>나이</th>
				<th>주소</th>
				<th>날짜</th>
			</tr>
		</thead>
		<tbody>
<%
	if (list == null) {
		out.print("<tr><td colspan='7'>데이터 검색중 오류 발생</td></tr>");
	} else if (list.size() == 0) {
		out.print("<tr><td colspan='7'>데이터가 없습니다(0건)</td></tr>");
	} else {
		for (MemberVO vo : list) {  %>		
			<tr>
				<td><%=vo.getIdx() %></td>
				<td><%=vo.getId() %></td>
				<td><%=vo.getPwd() %></td>
				<td><%=vo.getName() %></td>
				<td><%=vo.getAge() %></td>
				<td><%=vo.getAddress() %></td>
				<td><%=vo.getReg().substring(0, 10) %></td>
			</tr>
<%
		} 
	} %>			
		</tbody>
	</table>
	
</body>
</html>






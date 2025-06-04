<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//한글깨짐 해결
	//request.setCharacterEncoding("UTF-8");

	//파라미터 값 추출
	String name = request.getParameter("name");
	String age = request.getParameter("age");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>두번째페이지</title>
</head>
<body>
	<h1>[ ex02_second.jsp ]</h1>
	<h2>최초 요청시 전달된 파라미터 값</h2>
	<h2>이름 : <%=name %></h2>
	<h2>나이 : <%=age %></h2>
	<hr>

<%
	//forward에서 추가된 파라미터 값 추출
	String name2 = request.getParameter("name2");
	String age2 = request.getParameter("age2");
%>	
	<h2>first 페이지에서 forward 처리시 추가된 값</h2>
	<h2>이름2 : <%=name2 %></h2>
	<h2>나이2 : <%=age2 %></h2>
	
	
	
	
	
	
</body>
</html>
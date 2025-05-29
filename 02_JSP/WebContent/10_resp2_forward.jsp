<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>응답페이지2</title>
</head>
<body>
<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
%>
	<h1>최종응답페이지 [ 10_resp2_forward.jsp ]</h1>
	<h2>아이디 : <%=id %></h2>
	<h2>암호 : <%=pwd %></h2>
</body>
</html>






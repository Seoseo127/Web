<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>응답페이지1</title>
</head>
<body>
	<h1>응답페이지1 - 위임처리 [ 10_resp1_forward.jsp ]</h1>
	<h2>ID : <%=id %></h2>
	<h2>PW : <%=pwd %></h2>
</body>
</html>
<%
	//포워딩처리(위임처리)
	RequestDispatcher rd = request.getRequestDispatcher("10_resp2_forward.jsp");
	rd.forward(request, response);
%>































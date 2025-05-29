<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 스크립트릿(scriptlet)</title>
</head>
<body>
	<h1>JSP 스크립트릿(scriptlet)</h1>
	<h3>자바코드를 작성하는 용도로 사용</h3>
<%
	int a = 100;
	int b = 77;
	System.out.println(">>콘솔창에 출력");
	System.out.println("a + b : " + (a + b));
%>	
	<hr>
	<h3>JSP에서 제공하는 내장객체 out 사용</h3>
<%
	out.println("<hr>");
	out.println("<p>a + b : " + (a + b) + "</p>");
%>	
</body>
</html>









<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>표현식(expression)</title>
</head>
<body>
	<h1>표현식(expression)</h1>
	<p>HTML 문을 사용해서 클라이언트에게 전달</p>
	<hr>
	<% out.print("<h2>out객체를 사용해서 클라이언트에게 전달</h2>"); %>
	<h2><% out.print("out객체를 사용해서 클라이언트에게 전달"); %></h2>
	<hr>
	
	<h2>표현식(expression) 사용해서 클라언트에게 전달</h2>
	<h3><%="표현식 사용 브라우저로 출력" %></h3>
	<hr><hr>
	
	<h2>변수값 num1, num2, sum의 값을 표현식 사용 화면 출력</h2>
<%
	int num1 = 100;
	int num2 = 200;
	int sum = num1 + num2;
%>	
	<h3>출력예) 100 + 200 = 300</h3>
	<h3>표현식1 : <%=num1 %> + <%=num2 %> = <%=sum %> </h3>
	<h3>표현식2 : <%=num1 + " + " + num2 + " = " + sum %></h3>
	
	
	
	<br><br><br><br><br><br><br><br><br><br>
	<br><br><br><br><br><br><br><br><br><br>
</body>
</html>







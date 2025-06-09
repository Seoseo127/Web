<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL 연산자</title>
</head>
<body>
	<h1>EL : 산술연산자, 문자열 연산자, 비교연산자, 논리연산자 </h1>
	<h2>표현식(Expression) : 산술연산자</h2>
	<ul>
		<li>15 + 7 = <%=15 + 7 %></li>
		<li>15 - 7 = <%=15 - 7 %></li>
		<li>15 * 7 = <%=15 * 7 %></li>
		<li>15 / 7 = <%=15 / 7 %></li>
		<li>15 % 7 = <%=15 % 7 %></li>
	</ul>
	
	<h2>EL(Expression Language) : 산술연산자</h2>
	<ul>
		<li>15 + 7 = ${15 + 7 }</li>
		<li>15 - 7 = ${15 - 7 }</li>
		<li>15 * 7 = ${15 * 7 }</li>
		<li>15 / 7 = ${15 / 7 }</li><%--실수형 데이터 처리 --%>
		<li>15 % 7 = ${15 % 7 }</li>
		
		<li>15 div 7 = ${15 div 7 }</li>
		<li>15 mod 7 = ${15 mod 7 }</li>
	</ul>
	<hr>
	
	<h2>문자열 붙이기</h2>
	<p>EL : "Hello" + " World" - ${"Hello" += " World" }</p>
	<p>EL : "Hello" + " World" - ${"Hello"} ${"World" }</p>
	<hr><hr>
	
	<%-- ==================== --%>
	<h2>EL 비교 연산자</h2>
	<h3>비교연산자(부호) : ==, !=, <, >, <=, >=</h3>
	<h3>비교연산자(영문) : eq, ne, lt, gt, le, ge 추가로 사용가능</h3>
	<p>100 > 50 : ${100 > 50 }</p>
	<p>100 gt 50 : ${100 gt 50 }</p>
	
	<p>100 >= 50 : ${100 >= 50 }</p>
	<p>100 ge 50 : ${100 ge 50 }</p>
	
	<p>100 == 50 : ${100 == 50 }</p>
	<p>100 eq 50 : ${100 eq 50 }</p>
	
	<%-- ====================== --%>
	<h2>논리연산자 : &&, ||, !, and, or, not</h2>
	<p>100 > 50 && 200 > 100 : ${100 > 50 && 200 > 100 }</p>
	<p>100 > 50 and 200 > 100 : ${100 > 50 and 200 > 100 }</p>
	<p>100 gt 50 and 200 gt 100 : ${100 gt 50 and 200 gt 100 }</p>
	
	<p>!(100 > 50 && 200 > 100) : ${ !(100 > 50 && 200 > 100) }</p>
	<p>not(100 > 50 && 200 > 100) : ${ not(100 > 50 && 200 > 100) }</p>
	
	<br><br><br><br><br><br><br><br><br><br><br>
	<br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>






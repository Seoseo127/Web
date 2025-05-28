<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선언부(declaration)</title>
</head>
<body>
	<h1>선언부(declaration)</h1>
	<h3>덧셈 : 100 + 200 = 300</h3>
<%
	//스크립트릿 : service() 메소드에 작성되는 코드
	int a = 100;
	int b = 200;
	int sum = a + b;
	System.out.println("sum(a, b) : " + sum(a, b)); //필드에 선언된 메소드 사용
	System.out.println("tot : " + tot); //필드에 선언된 tot 값 사용
	
%>	
	<h3><%=a %> + <%=b %> = <%=sum %></h3>
	<hr>
	
	<h2>선언부(declaration) 사용 메소드 선언(정의, 작성)</h2>
	<h3>sum(a, b) : a + b = <%=sum(a, b) %> </h3>
<%!
	//선언부에 작성된 코드 : 클래스(서블릿)의 필드영역에 작성되는 코드
	int tot = 100; //필드 변수

	// 메소드 선언
	private int sum(int a, int b) {
		return a + b;
	}
%>
	
</body>
</html>













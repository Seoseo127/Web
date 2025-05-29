<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int sum = 0;
	for (int i = 1; i <= 10; i++) {
		sum += i;
	}
	System.out.println("sum : " + sum);
%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>합계구하기</title>
</head>
<body>
	<h1>1부터 10까지의 합계 구하기</h1>
	<h3>(실습) 자바코드로 1~10까지 합계구하기</h3>
	<h3>출력예) 1부터 10까지의 합계 : 55</h3>
	<hr>

	<h3>1부터 10까지의 합계 : <% out.print(sum); %> (스크립트릿 사용)</h3>
	<h3>1부터 10까지의 합계 : <%=sum %> (표현식 사용)</h3>

</body>
</html>




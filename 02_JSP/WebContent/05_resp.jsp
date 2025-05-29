<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--(실습) 전달받은 데이터를 사용해서 계산처리 후 결과를 테이블 형태로 작성 
	데이터 처리 : 스크립트릿(<% %>)
	데이터 출력 : 표현식(<%= %>)
--%>
<%
	//1. 전달받은 데이터(파라미터) 값 추출(확인)
	String name = request.getParameter("name");
	int kor = -1;
	int eng = -1;
	int math = -1;
	int tot = -1;
	double avg = -1;
	boolean isException = false;
	try {
		kor = Integer.parseInt(request.getParameter("kor")) ;
		eng = Integer.parseInt(request.getParameter("eng")) ;
		math = Integer.parseInt(request.getParameter("math")) ;
		
		//2. 계산처리(총점, 평균)
		tot = kor + eng + math;
		avg = tot * 100 / 3 / 100.0;
		avg = Math.round(tot * 100 / 3.0) / 100.0;
	} catch (NumberFormatException e) {
		isException = true;
		System.out.println("[예외발생] 숫자가 아닌 값이 입력됨");
		//return;
	}
	
	//3. 결과 출력(브라우저 화면 - HTML 태그 작성)
%>	

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>성적처리결과</title>
</head>
<body>
	<h2>성적처리결과[ 05_resp.jsp ]</h2>
<%
	if (isException) {
		out.print("<h3>[예외발생] 숫자가 아닌 값이 입력됨<h3>");
	} else {
%>	
	<table border>
		<tr>
			<th>이름</th>
			<td><%=name %></td>
		</tr>
		<tr>
			<th>국어</th>
			<td><%=kor %></td>
		</tr>
		<tr>
			<th>영어</th>
			<td><%=eng %></td>
		</tr>
		<tr>
			<th>수학</th>
			<td><%=math %></td>
		</tr>
		<tr>
			<th>총점</th>
			<td><%=tot %></td>
		</tr>
		<tr>
			<th>평균</th>
			<td><%=avg %></td>
		</tr>
	</table>
<%
	}
%>	
	
</body>
</html>







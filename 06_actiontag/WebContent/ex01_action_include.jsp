<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>액션태그 include</title>
</head>
<body>
<%-- JSP 액션태그 : JSP 페이지 흐름제어, 데이터 처리
	사용형태 : <jsp:액션명령></jsp:액션명령>
	      또는 <jsp:액션명령 />
--%>
	<h1>디렉티브/액션태그 - include</h1>
	<hr>
	<h2>디렉티브(지시어) - include : 복사 & 붙여넣기</h2>
	<h3>지시어 include(정적처리) : 포함시킬 내용을 삽입후 컴파일 처리</h3>
	<%@ include file="ex01_includee.jsp" %>
	<p>--------------</p>
	<%@ include file="ex01_includee2.jspf" %>
	<hr><hr>
	
	<%-- =============================== --%>
	<h2>액션태그 - jsp:include 사용시엔 *.jsp 사용할 것</h2>
	<h3>동적처리방식 : 실행시 요청 결과를 받아서 사용(포함, 추가)</h3>
	<jsp:include page="ex01_includee.jsp"></jsp:include>
	<p>--------------</p>
	<jsp:include page="ex01_includee2.jspf" />
	<hr><hr>

	<%-- ======================== --%>
<%
	request.setCharacterEncoding("UTF-8");
%>	
	<h2>액션태그 - jsp:include(파라미터값 전달)</h2>
	<h3>동적처리방식 : 실행시 요청 결과를 받아서 사용(포함, 추가)</h3>
	<jsp:include page="ex01_includee3_param.jsp">
		<jsp:param value="홍길동" name="name"/>
		<jsp:param value="25" name="age"/>
	</jsp:include>
	

	<br><br><br><br><br><br><br><br><br><br>
	<br><br><br><br><br><br><br><br><br><br>
</body>
</html>

















<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시작페이지</title>
</head>
<body>
	<h1>시작페이지[ JSTL02_main_req.jsp ] - 요청페이지</h1>
	<h2>JSTL redirect 사용하기</h2>
	<a href="JSTL02_redirect.jsp">JSTL - redirect 처리 페이지 호출(JSTL02_redirect.jsp)</a><br>
	<a href="JSTL02_redirect.jsp?id=hong">JSTL - redirect 처리 페이지 호출2(JSTL02_redirect.jsp?id=hong)</a>
	<hr>
	
	<h3>JSTL url 태그(상대주소, 절대주소 방식 적용)</h3>
	<c:url var="req" value="JSTL02_redirect.jsp"></c:url>
	<c:url var="req2" value="/JSTL02_redirect.jsp">
		<c:param name="id">kim</c:param>
		<c:param name="name">김유신</c:param>
	</c:url>
	url 상대주소방식 : <a href="${req }">url태그 - redirect 호출(JSTL02_redirect.jsp)</a><br>
	url 절대주소방식 : <a href="${req2 }">url태그 - redirect 호출(/JSTL02_redirect.jsp)</a><br>
	
</body>
</html>










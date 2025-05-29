<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String site = request.getParameter("site");
	System.out.println(">> 09_resp_redirect.jsp site : " + site);
	
	//재요청 처리
	switch (site) {
	case "naver" : //네이버 웹페이지로 이동처리(재요청)
		response.sendRedirect("https://www.naver.com");
		break;
	case "daum" : //다음 웹페이지로 이동처리(재요청)
		response.sendRedirect("https://www.daum.net");
		break;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>응답페이지</title>
</head>
<body>
	<h2>응답페이지[ 09_resp_redirect.jsp ]</h2>
	<h3>이동할 웹 사이트 : <%=site %></h3>
</body>
</html>
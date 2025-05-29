<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- session 에 전달받은 데이터를 저장하고 다시 되돌아가기 --%>
<%
	// request 객체를 통해 전달된 파라미터
	String name = request.getParameter("name");
	String age = request.getParameter("age");
	System.out.println("> param name: " + name + ", age: " + age);
	
	//================
	// request scope에 저장
	request.setAttribute("req_name", "req-" + name);
	request.setAttribute("req_age", "req-" + age);
	String req_name = (String) request.getAttribute("req_name");
	String req_age = (String) request.getAttribute("req_age");
	System.out.println("> req_name: " + req_name + ", req_age: " + req_age);
	
	// session scope에 저장
	session.setAttribute("session_name", "session-" + name);
	session.setAttribute("session_age", "session-" + age);
	String session_name = (String) session.getAttribute("session_name");
	String session_age = (String) session.getAttribute("session_age");
	System.out.println("> session_name: " + session_name + ", session_age: " + session_age);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex01_sessionSet.jsp</title>
</head>
<body>
	<h1>[ ex01_sessionSet.jsp ]</h1>
	<h1>전달받은 파라미터 값</h1>
	<h2>이름(param) : <%=name %></h2>
	<h2>나이(param) : <%=age %></h2>
	<hr>
	
	<h1>request 객체 저장 데이터(request scope)</h1>
	<h2>이름(request req_name) : <%=req_name %></h2>
	<h2>나이(request req_age) : <%=req_age %></h2>
	<hr>
	
	<h1>session 객체 저장 데이터(session scope)</h1>
	<h2>이름(session_name) : <%=session_name %></h2>
	<h2>나이(session_age) : <%=session_age %></h2>
<%
	//재요청 처리
	response.sendRedirect("ex01_session.jsp");
%>
	
</body>
</html>










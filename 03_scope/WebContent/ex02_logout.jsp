<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--(실습) 세션 무효화(초기화) 후 페이지 전환(login.jsp) --%>
<%
	// 세션 무효화(초기화) 후 페이지 전환(login.jsp)
	session.invalidate();
	response.sendRedirect("ex02_login.jsp");
%>

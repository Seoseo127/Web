<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 사용중인 세션(session) 무효화(초기화) 처리후 되돌아가기 --%>
<%
	// 사용중인 세션(session) 무효화(초기화)
	session.invalidate();

	// ex01_session.jsp 페이지로 이동(되돌아가기) - 재요청처리 방식으로 
	response.sendRedirect("ex01_session.jsp");
%>

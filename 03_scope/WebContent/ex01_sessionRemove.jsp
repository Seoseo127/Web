<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 세션에 설정된 속성 삭제(remove) --%>
<%
	//세션에 저장된 데이터 삭제
	session.removeAttribute("session_age"); 

	//세션에 저장된 데이터명 확인
	Enumeration<String> names = session.getAttributeNames();
	while (names.hasMoreElements()) {
		System.out.println("-- attribute name : " + names.nextElement());
	}
	
	// 재요청 처리
	response.sendRedirect("ex01_session.jsp");
%>

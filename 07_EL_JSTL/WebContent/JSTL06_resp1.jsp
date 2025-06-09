<%@page import="com.mystudy.MemberVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.mystudy.PersonVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL06_resp1.jsp</title>
</head>
<body>
	<h1>[ JSTL06_resp1.jsp ]</h1>
<%
	System.out.println(">> JSTL06_resp1.jsp -----------");

	List<PersonVO> list = new ArrayList<>();
	list.add(new PersonVO("홍길동", 25));
	list.add(new PersonVO("김유신", 33));
	list.add(new PersonVO("강감찬", 40));
	list.add(new PersonVO("을지문덕", 50));
	System.out.println("list : " + list);

	request.setAttribute("personList", list);
	
	//===========================
	List<MemberVO> list2 = new ArrayList<>();
	list2.add(new MemberVO("hong", "h1234", "홍길동", "hong@test.com", 
			"M", new String[]{"운동"}));
	list2.add(new MemberVO("kim", "kim1234", "김유신", "kim@test.com", 
			"F", new String[]{"운동", "게임", "영화"}));
	System.out.println("list2 : " + list2);

	request.setAttribute("memberList", list2);
	
	request.getRequestDispatcher("JSTL06_resp2.jsp").forward(request, response);
%>	
</body>
</html>







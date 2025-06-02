<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<h2>로그인[ ex02_login.jsp ]</h2>
<%
	//로그인 성공여부 확인
	String login_chk = (String) session.getAttribute("login_chk");
	System.out.println(">> login.jsp login_chk : " + login_chk);
	if (login_chk == null) { // 새로운 로그인(최초 로그인 또는 세션초기화)
%>	
	<form action="ex02_loginProc.jsp">
		<p>아이디 : <input type="text" name="id"></p>
		<p>암호 : <input type="text" name="pwd"></p>
		<input type="submit" value="로그인">
	</form>
<%
	} else if ("ok".equals(login_chk)) { //로그인 성공시 처리
%>
	<h2>로그인 성공!!! 환영합니다</h2>
	<a href="ex02_logout.jsp">로그아웃</a>
<%
	} else { // 로그인 실패시 처리
		//session.invalidate(); //세션무효화되고, 세션 새로 생성
		session.removeAttribute("login_chk"); //세션 유지하되 session 속성 삭제
		response.sendRedirect("ex02_loginFailMessage.jsp");
	}
%>	
	
	
	
</body>
</html>
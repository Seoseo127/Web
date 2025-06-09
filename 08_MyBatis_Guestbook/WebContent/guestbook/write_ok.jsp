<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.mystudy.mybatis.DBService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 전달받은 데이터를 DB에 저장(INSERT)
	입력성공 : 목록페이지로 이동(list.jsp)
	입력실패(예외) : 메시지 표시 후 이전화면(입력화면) 이동 
--%>
<%
	//0. 한글처리
	request.setCharacterEncoding("UTF-8");

	//1. 파라미터 값 추출해서 GuestbookVO 에 저장
%>
	<jsp:useBean id="guestbookVO" class="com.mystudy.mybatis.GuestbookVO" />
	<jsp:setProperty property="*" name="guestbookVO"/>
<%	
	System.out.println("> guestbookVO : " + guestbookVO);
	
	//2. DB에 입력처리
	//2-1. SqlSession 객체 생성
	SqlSession ss = DBService.getFactory().openSession(true); //자동커밋 상태로 세션객체 생성
	
	int result = 0;
	try {
		//2-2. SqlSession 객체 사용 DB에 입력(INSERT)
		result = ss.insert("guestbook.insert", guestbookVO);
		System.out.println(">> 입력 성공");
	} catch (Exception e) {
		result = -999;
		System.out.println(">>[예외발생] 입력실패~~");
		e.printStackTrace();
	} finally {
		ss.close();
	}
	
	//3. 페이지 전환(화면 이동)
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>처리결과</title>
<script>
	let result = <%=result %>;
	if (result >= 1) {
		alert("정상 입력되었습니다\n목록페이지로 이동합니다");
		location.href = "list.jsp";
	}
	if (result <= 0) {
		alert("[예외발생] 입력작업 중 오류발생\n"
				+ "담당자(8282)에게 연락하세요\n"
				+ "이전페이지로 이동합니다");
		history.back();
	}
</script>
</head>
<body>
	<h1>처리결과[ write_ok.jsp ]</h1>
</body>
</html>







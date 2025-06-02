<%@page import="com.mystudy.vo.EmployeeVO"%>
<%@page import="com.mystudy.dao.EmployeeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--(실습) 전달받은 데이터를 이용해서 DB에서 수정(UPDATE) 처리 
	수정완료 : list.jsp 페이지로 이동 또는 detail.jsp 페이지로 이동
	예외발생 : 현재 페이지에 오류메시지 출력
--%>
<%
	//1. 전달받은 데이터 확인
	int sabun = Integer.parseInt(request.getParameter("sabun"));
	String name = request.getParameter("name");
	int pay = Integer.parseInt(request.getParameter("pay"));
	
	//2. DB 수정 작업
	EmployeeDAO dao = new EmployeeDAO();
	//EmployeeVO vo = new EmployeeVO(sabun, name, null, pay);
	//dao.update(vo);
	int result = dao.update(new EmployeeVO(sabun, name, null, pay));
	System.out.println("result : " + result);
	
	//3. 화면전환(페이지 이동)
	if (result > 0) { // 수정처리 성공
		//response.sendRedirect("list.jsp");
		response.sendRedirect("detail.jsp?sabun=" + sabun);
		return;
	}
	if (result == 0) { // SQL문 정상실행 + 데이터 수정 안된 경우
%>		
		<script>
			alert("[수정실패] 대상이 없어서 수정하지 못했습니다\n"
					+"목록페이지로 이동합니다");
			location.href = "list.jsp";
		</script>
<%
		return;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예외발생</title>
</head>
<body>
	<h1>[오류]사원 수정 실패</h1>
	<p>수정처리를 하지 못했습니다<br>
	담당자(8282)에게 연락하세요</p>
	
	<a href="detail.jsp?sabun=<%=sabun %>">상세페이지로 이동</a>
	<a href="list.jsp">전체목록 보기</a>
	
</body>
</html>







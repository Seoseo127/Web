<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//세션 ID 및 상태 확인
	System.out.println("-------------------------");
	System.out.println(":: session ID : " + session.getId()
			+ ", 새로운 세션여부(new) : " + session.isNew());

	// request, session scope에 설정된 값 사용
	// request scope 설정값 읽기
	String req_name = (String) request.getAttribute("req_name");
	String req_age = (String) request.getAttribute("req_age");
	System.out.println(":: req_name: " + req_name + ", req_age: " + req_age);
	
	// session scope 설정값 읽기
	String session_name = (String) session.getAttribute("session_name");
	String session_age = (String) session.getAttribute("session_age");
	System.out.println(":: session_name: " + session_name + ", session_age: " + session_age);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세션(session) 사용범위</title>
<script>
	function sessionSet() {
		alert(">> sessionSet() 실행~~");
		location.href = "ex01_sessionSet.jsp?name=hong&age=25";
	}
	function sessionRemove() {
		location.href = "ex01_sessionRemove.jsp";
	}
	function sessionInvalidate() {
		location.href = "ex01_sessionInvalidate.jsp";
	}
</script>
</head>
<body>
	<h1>세션(session) 사용범위 - [ex01_session.jsp]</h1>
	<button onclick="sessionSet()">세션 세션에 저장</button>
	<button onclick="sessionRemove()">세션 속성 삭제</button>
	<button onclick="sessionInvalidate()">세션 초기화(무효화)</button>
	<hr>
	<form action="ex01_sessionSet.jsp">
		이름 : <input type="text" name="name" value="홍길동"><br>
		나이 : <input type="number" name="age" value="27"><br>
		<input type="submit" value="세션에 저장">
	</form>
	<hr>
	
	<h1>리퀘스트 스코프(request scope)</h1>
	<h2>이름(req_name) : <%=req_name %></h2>
	<h2>나이(req_age) : <%=req_age %></h2>
	<hr>
	
	<h1>세션 스코프(session scope)</h1>
	<h2>이름(session_name) : <%=session_name %></h2>
	<h2>나이(session_age) : <%=session_age %></h2>
	
</body>
</html>







<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--(실습) 전달받은 데이터 화면에 표시 --%>
<%
	//0. 한글처리
	request.setCharacterEncoding("UTF-8");
	
	//1. 요청정보(request)에 있는 데이터(파라미터) 값 확인(추출)
	String userid = request.getParameter("userid");
	if (userid.trim().length() < 1) {
		System.out.println(":: 아이디가 입력되지 않았습니다");
%>
	<script>
		alert("아이디가 입력되지 않았습니다. 입력하세요.");
		history.back();
	</script>
<%
		return;
	}
	
	String check = "ok";
	String pwd = request.getParameter("pwd");
	if (pwd.trim().length() < 1) {
		check = "error";
	}
	
	String username = request.getParameter("username");
	String email = request.getParameter("email");
	String gender = request.getParameter("gender");
	if (gender == null) {
		check = "error";
	}
	
	String[] hobbies = request.getParameterValues("hobby");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입데이터</title>
<script>
	let isError = "<%=check %>";
	if (isError == "error") {
		alert(":: 잘못된 데이터가 입력되었습니다\n회원가입 페이지로 이동합니다.");
		history.back();
	}
</script>
</head>
<body>
	<h1>회원가입 정보[ 07_resp.jsp ]</h1>
	<ul>
		<li>아이디 : <%=userid %></li>
		<li>암호 : <%=pwd %></li>
		<li>이름 : <%=username %></li>
		<li>이메일 : <%=email %></li>
		<li>성별 : <%=gender %></li>
		<li>취미(배열객체) : <%=hobbies %></li>
		<li>취미(배열데이터 사용) : 
<%
		if (hobbies == null) {
			out.print("선택취미 없음");
		} else {
			for (String hobby : hobbies) {
				out.print(hobby + " ");
			}
		}
%>		
			
		</li>
	</ul>
	
</body>
</html>







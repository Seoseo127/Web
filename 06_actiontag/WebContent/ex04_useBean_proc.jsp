<%@page import="com.mystudy.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--(실습) 전달받은 데이터(파라미터값)를 VO에 저장하고 화면 출력 
	1. MemberVO 타입의 객체(memberVO)를 생성
	2. 전달받은 파라미터 값을 memberVO 객체(인스턴스)에 저장
	3. memberVO 데이터를 화면 출력
--%>
<%--
	//1. MemberVO 타입의 객체(memberVO)를 생성
	MemberVO memberVO = new MemberVO();

	//2. 전달받은 파라미터 값을 memberVO 객체(인스턴스)에 저장
	memberVO.setId(request.getParameter("id"));
	memberVO.setPwd(request.getParameter("pwd"));
	memberVO.setHobby(request.getParameterValues("hobby"));
	System.out.println("> memberVO : " + memberVO);
--%>
	<jsp:useBean id="memberVO" class="com.mystudy.MemberVO" scope="page"/>
	<jsp:setProperty property="*" name="memberVO"/>

<%
	System.out.println(":: memberVO : " + memberVO);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입정보</title>
</head>
<body>
	<h1>회원가입정보 확인</h1>
	<ul>
		<li>아이디 : <%=memberVO.getId() %></li>
		<li>암호 : <%=memberVO.getPwd() %></li>
		<li>이름 : <%=memberVO.getName() %></li>
		<li>이메일 : <%=memberVO.getEmail() %></li>
		<li>성별 : <%=memberVO.getGender() %></li>
		<li>성별(null체크) : 
<%
		if (memberVO.getGender() != null) {
			out.print(memberVO.getGender());
		} else {
			out.print("선택안함");
		}
%>
		</li>
		<li>취미(배열) : <%=memberVO.getHobby() %></li>
		<li>취미(배열데이터) : 
<%
		if (memberVO.getHobby() == null) {
			out.print("선택안함");
		} else {
			for (String hobby : memberVO.getHobby()) {
				out.print(hobby + " ");
			}
		}
%>		
		</li>
	</ul>
	<hr>
	
	<h2>EL 사용(EL에서 사용가능 데이터는 scope 상에 있는 데이터만)</h2>
	<ol>
		<li>아이디 : ${memberVO.id }</li>
		<li>성별 : ${memberVO.gender }</li>
		<li>취미(배열) : ${memberVO.hobby }</li>
		<li>취미(배열데이터) : 
			${memberVO.hobby[0] }
			${memberVO.hobby[1] }
			${memberVO.hobby[2] }
			${memberVO.hobby[3] }
		</li>
	</ol>
	
</body>
</html>



















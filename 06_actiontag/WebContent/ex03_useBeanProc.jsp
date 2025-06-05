<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 한글처리
	request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>응답페이지</title>
</head>
<body>
	<h1>(응답)jsp:useBean 사용 [ ex03_useBeanProc.jsp ]</h1>
<%
	//파라미터 값 추출(확인)
	String name = request.getParameter("name");
	String age = request.getParameter("age");
%>
	<h2>일반적인 처리방식(로컬변수)</h2>
	<h2>이름 : <%=name %></h2>
	<h2>나이 : <%=age %></h2>
	<hr>
	
	<!-- ==== scope에 저장 사용 ======== -->
<%
	request.setAttribute("req_name", name);
	request.setAttribute("req_age", age);
%>	
	<h2>scope 상의 속성(attribute)에 저장 사용</h2>
	<h2>이름(request) : <%=request.getAttribute("req_name") %></h2>
	<h2>나이(request) : <%=request.getAttribute("req_age") %></h2>
	<hr>
	
	<%-- ====== useBean 액션 태그 사용 ========== --%>
	<jsp:useBean id="person" class="com.mystudy.PersonVO" scope="request" />
	<jsp:setProperty property="*" name="person"/>
	
	<%-- <jsp:setProperty property="name" name="person"/>
	<jsp:setProperty property="age" name="person"/> --%>
	
	<jsp:setProperty property="age" name="person" param="age2"/>
<%
	
	System.out.println("> person : " + person);
	System.out.println("> request person : " + request.getAttribute("person"));
%>	
	<h2>빈(Bean) 저장값 표시</h2>
	<h2>이름(표현식) : <%=person.getName() %></h2>
	<h2>나이(표현식) : <%=person.getAge() %></h2>
	<hr>
	
	<h2>데이터 읽기 : getProperty 액션태그</h2>
	<h2>이름(액션태그) : <jsp:getProperty property="name" name="person"/> </h2>
	<h2>나이(액션태그) : <jsp:getProperty property="age" name="person"/> </h2>
	<hr>
	
	<h2>EL getter 이용 데이터 출력</h2>
	<h2>이름(EL) : ${person.getName() }</h2>
	<h2>나이(EL) : ${person.getAge() }</h2>
	<p>----------</p>
	<h2>이름(EL) : ${person.name }</h2>
	<h2>나이(EL) : ${person.age }</h2>
	
	<br><br><br><br><br><br><br><br><br><br><br>
	<br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>











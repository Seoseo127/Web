<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//한글깨짐 해결
	request.setCharacterEncoding("UTF-8");

	//파라미터 값 추출
	String name = request.getParameter("name");
	String age = request.getParameter("age");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>첫페이지</title>
</head>
<body>
	<h1>[ ex02_first.jsp ]</h1>
	<h2>이름 : <%=name %></h2>
	<h2>나이 : <%=age %></h2>
	
	<!-- ===== 액션태그 forward ====== -->
	<h2>액션태그 forward</h2>
	<jsp:forward page="ex02_second.jsp">
		<jsp:param name="name2" value="<%=name + \"-forward\" %>" />
		<jsp:param name="age2" value='<%=age + "-forward" %>' />
	</jsp:forward>

</body>
</html>



















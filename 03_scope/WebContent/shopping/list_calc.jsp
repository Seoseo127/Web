<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 품목 계산하기</title>
</head>
<body>
	<h2>계산(장바구니 보기)</h2>
	<p>[ <%=session.getAttribute("username") %> ] 님 계산할 목록</p>
	<h2>계산할 품목</h2>
<%--(실습) ul, li 사용해서 장바구니 목록 출력
	없으면 : <p>계산할 품목이 없습니다</p>
	있으면 : ul, li 태그로 목록으로 화면 출력
 --%>
 <%
 	List<String> list = (List<String>) session.getAttribute("product_list");
 	System.out.println("> list : " + list);
 	
 	if (list == null) { // 장바구니 목록이 없으면
 		out.println("<p>::계산할 품목이 없습니다</p>");
 	} else { // 장바구니 목록이 있으면
 		out.println("<ul>");
 		for (int i = 0; i < list.size(); i++) {
 			out.println("<li>" + list.get(i) + "</li>");
 		}
 		out.println("</ul>");
%>
		<hr><hr>
		<ol>
<%		for (String product : list) {  %>		
			<li><%=product %></li>
<%      } %>
		</ol>
<% 		
 	} // end else
%>
 	<hr>
 	<p><a href="logout.jsp">로그아웃</a></p>
 
</body>
</html>







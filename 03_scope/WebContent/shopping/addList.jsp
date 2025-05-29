<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 전달받은 품목을 장바구니에 담고, 쇼핑페이지로 이동 --%>
<%
	//1. 전달받은 데이터 확인
	String product = request.getParameter("product");
	
	//2. 장바구니에 담기 : ArrayList 에 저장
	// 세션에 있으면 사용하고, 없으면 List 만들기
	ArrayList<String> list = (ArrayList<String>) session.getAttribute("product_list");
	System.out.println("session product_list : " + session.getAttribute("product_list"));
	System.out.println("저장전 list : " + list);
	
	if (list == null) {
		list = new ArrayList<String>();
		session.setAttribute("product_list", list);
	}
	list.add(product); //목록(장바니구)에 추가
	System.out.println("저장후 list : " + list);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니담기</title>
<script>
	//3. 쇼핑페이지로 이동(페이지 전환)
	alert("[ <%=product %> ] 추가되었습니다");
	history.back(); //이전 페이지로 이동(뒤로 이동)
	//history.go(-1);
</script>
</head>
<body>
	
</body>
</html>







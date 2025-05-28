<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 주문한 내역에 따라 계산하고 결과 표시 --%>
<%
	//(실습)주문한 내역에 따라 계산하고 결과 표시 
	//08_resp.jsp?menu=1&count=3&money=10000
	//1. 파라미터 값 확인
	String menu = request.getParameter("menu");
	int count = Integer.parseInt(request.getParameter("count"));
	int money = Integer.parseInt(request.getParameter("money"));
	
	//2. 계산처리 - 구입금액, 잔액
	//2-1. 선택메뉴의 메뉴명과 단가 설정 및 확인
	String menuName = "선택안됨";
	int danga = 0; //선택 메뉴 금액(단가)
/*	
	if ("1".equals(menu)) {
		menuName = "아메리카노";
		danga = 3000;
	} else if ("2".equals(menu)) {
		menuName = "카페모카";
		danga = 3500;
	}
*/
	switch (menu) {
	case "1" : 
		menuName = "아메리카노"; 
		danga = 3000;
		break;
	case "2" : menuName = "카페모카"; danga = 3500; break;
	case "3" : menuName = "에스프레소"; danga = 2500; break;
	case "4" : menuName = "카페라떼"; danga = 4000; break;
	}
	
	//2-2. 구입금액(total), 잔액(change) 계산처리
	int total = danga * count;
	int change = money - total;

	//3. 결과화면 표시
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문결과</title>
</head>
<body>
	<h2>주문 계산 결과(응답)</h2>
<%--
	커피종류 : 아메리카노
	단가 : 3000원
	수량 : 3
	구입금액 : 9000원 (단가 * 수량)
	----------------
	입금액 : 10000원
	잔액 : 1000원 (입금액 - 구입금액)
--%>
	<ul>
		<li>메뉴 : <%=menuName %></li>
		<li>단가 : <%=danga %> 원</li>
		<li>수량 : <%=count %> 개</li>
		<li>입금액 : <%=money %> 원</li>
		<li>구입금액 : <%=total %> 원</li>
		<li>잔액 : <%=change %> 원</li>
	</ul>
	
</body>
</html>











<%@page import="com.mystudy.shop.ProductVO"%>
<%@page import="java.util.List"%>
<%@page import="com.mystudy.shop.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 전달받은 제품분류목록(category) 값에 해당하는 제품정보를 DB에서 조회 후
	화면에 목록형태(테이블)로 표시 --%>

	<jsp:useBean id="dao" class="com.mystudy.shop.ProductDAO" scope="session"/>
<%
	//전달받은 파라미터 값 추출(확인)
	String category = request.getParameter("category");
	
	//ProductDAO dao = new ProductDAO();
	List<ProductVO> list = dao.list(category);
	System.out.println("> list : " + list);
	System.out.println("> list.size() : " + list.size());
	
	pageContext.setAttribute("list", list);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품목록</title>
<link rel="stylesheet" href="css/menu.css">
<style>
	table {
		width: 900px;
		margin: 30px auto;
		border: 1px solid navy;
		border-collapse: collapse;
	}
	th, td { border: 1px solid navy; padding: 4px; }
	th { background-color: orange; }
	.red { color: red; }
	.center { text-align: center; }
</style>
</head>
<body>
	<%@ include file="common/menu.jspf" %>
	
	<table>
		<thead>
			<tr>
				<th width="15%">제품번호</th>
				<th width="15%">이미지</th>
				<th width="30%">제품명</th>
				<th width="20%">판매가격</th>
				<th>비고</th>
			</tr>
		</thead>
		<tbody>
		<!-- 등록된 제품이 있는 경우 -->
		<c:forEach var="pvo" items="${list }">
			<tr>
				<td class="center">${pvo.pnum }</td>
				<td>
					<img src="images/${pvo.imageSmall }" width="100px" height="95px">
				</td>
				<td>
					<a href="product_content.jsp?pnum=${pvo.pnum }">${pvo.name }</a>
				</td>
				<td>
					<div>할인가 : ${pvo.saleprice }원</div>
					<div class="red">(할인율: ${pvo.percent }%)</div>
				</td>
				<td>정가 : ${pvo.price }원</td>
			</tr>
		</c:forEach>
		
		<!-- 등록된 제품이 없는 경우 -->
		<c:if test="${empty list }">
			<tr>
				<td colspan="5" class="center">현재 등록된 제품이 없습니다</td>
			</tr>
		</c:if>
		</tbody>
	</table>
	
</body>
</html>











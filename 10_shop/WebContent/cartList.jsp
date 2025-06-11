<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- 장바구니(cart)에 있는 제품목록을 화면에 표시 --%>
	<jsp:useBean id="cart" class="com.mystudy.shop.Cart" scope="session" />	
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니(cart)보기</title>
<link rel="stylesheet" href="css/menu.css">
<link rel="stylesheet" href="css/data_table.css">
</head>
<body>
<%@ include file="common/menu.jspf" %>

	<table>
		<thead>
			<tr>
				<td colspan="6">::장바구니 내용</td>
			</tr>
			<tr>
				<th width="10%">제품번호</th>
				<th>제품명</th>
				<th width="25%">판매가격</th>
				<th width="15%">수량</th>
				<th width="10%">금액</th>
				<th width="10%">삭제</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="pvo" items="${cart.list }">
			<tr>
				<td>${pvo.pnum }</td>
				<td>${pvo.name }</td>
				<td>정가: ${pvo.price }원 <span class="red">판매가: ${pvo.saleprice }원</span></td>
				<td class="center">
					<form action="editCount.jsp">
						<input type="number" name="count" value="${pvo.count }">
						<input type="submit" value="수정">
						<input type="hidden" name="pnum" value="${pvo.pnum }">
					</form>
				</td>
				<td class="right">${pvo.totalPrice } 원</td>
				<td class="center">
					<input type="button" value="삭제" onclick='delProduct("${pvo.pnum }")'>
				</td>
			</tr>
		</c:forEach>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="6">총결재금액 : ${cart.total }원</td>
			</tr>
		</tfoot>
	</table>
	
	<p><a href="logout.jsp">다시 쇼핑하기(로그아웃)</a></p>

<script>
	function delProduct(pnum) {
		//alert("pnum : " + pnum);
		location.href = "delProduct.jsp?pnum=" + pnum;
	}
</script>

</body>
</html>



















<%@page import="com.mystudy.shop.ProductVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 전달받은 제품번호(pnum) 사용해서 DB 조회 후 화면 표시 --%>
	<%-- useBean 액션태그 scope 상에 id명의 데이터가 
		있으면 사용하고, 없으면 새로 생성 --%>
	<jsp:useBean id="dao" class="com.mystudy.shop.ProductDAO" scope="session" />
<%
	//전달받은 값 추출(확인)
	String pnum = request.getParameter("pnum");
	System.out.println("pnum : " + pnum);
	
	//제품번호(pnum) 사용해서 DB 조회
	//ProductVO pvo = dao.selectOne(pnum);
	//System.out.println("pvo : " + pvo);
	
	//EL, JSTL 사용을 위한 속성값 설정
	pageContext.setAttribute("pvo", dao.selectOne(pnum));
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품상세정보</title>
<link rel="stylesheet" href="css/menu.css">
<link rel="stylesheet" href="css/data_table.css">
</head>
<body>
<%-- \${pvo } : ${pvo } --%>

<%@ include file="common/menu.jspf" %>
	
	<table>
		<tbody>
			<tr>
				<th width="30%">품목코드</th>
				<td>${pvo.category }</td>
			</tr>
			<tr>
				<th>제품번호</th>
				<td>${pvo.pnum }</td>
			</tr>
			<tr>
				<th>제품명</th>
				<td>${pvo.name }</td>
			</tr>
			<tr>
				<th>제조사</th>
				<td>${pvo.company }</td>
			</tr>
			<tr>
				<th>정가/할인가</th>
				<td>정가 : ${pvo.price }원<span class="red">(할인가격 : ${pvo.saleprice }원)</span></td>
			</tr>
			<tr>
				<th>제품상세설명</th>
				<td>${pvo.content }</td>
			</tr>
			<tr>
				<td colspan="2">
					<img src="images/${pvo.imageLarge }" alt="제품이미지">
				</td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="2">
					<input type="button" value="장바구니 담기" onclick="add()">
					<input type="button" value="장바구니 보기" onclick="cart_go()">
				</td>
			</tr>
		</tfoot>
	</table>
	
<script>
	function add() {
		location.href = "addProduct.jsp?pnum=${pvo.pnum}";
	}
	function cart_go() {
		location.href = "cartList.jsp";
	}
</script>


</body>
</html>












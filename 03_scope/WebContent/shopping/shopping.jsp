<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 전달받은 이름을 세션에 저장하고 물건을 선택하기 --%>
<%
	// 전달받은 데이터(파라미터) 값 확인(추출)
	String name = request.getParameter("name");
	if (name != null) { //전달받은 파라미터 값이 있으면
		// 세션에 저장 - 페이지전환시 이름을 사용하기 위해서
		session.setAttribute("username", name);
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품선택</title>
<script>
	function addList(frm) {
		frm.action = "addList.jsp";
		frm.submit();
	}
</script>
</head>
<body>
	<h2>상품선택[ shopping.jsp ]</h2>
	<hr>
	[ <%=session.getAttribute("username") %> ] 님 로그인 상태입니다
	<hr>
	<form>
		<select name="product">
			<option selected disabled>::선택</option>
			<option>수박</option>
			<option value="apple">사과</option>
			<option value="딸기">딸기</option>
			<option>참외</option>
			<option>망고</option>
		</select>
		<input type="button" value="장바구니에 추가" onclick="addList(this.form)">
	</form>
	<p><a href="list_calc.jsp">계산하기(장바구니 보기)</a></p>
	<p><a href="logout.jsp">로그아웃</a></p>

</body>
</html>








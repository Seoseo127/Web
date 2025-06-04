<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>액션태그 useBean</title>
</head>
<body>
	<h1>(요청)액션태그 useBean 사용[ ex03_useBean.jsp ]</h1>
	<form action="ex03_useBeanProc.jsp" method="get">
		이름 : <input type="text" name="name" value="홍길동"><br>
		나이 : <input type="number" name="age" value="25"><br>
		나이2 : <input type="number" name="age2" value="999"><br>
		<input type="submit" value="전달(제출)">
	</form>
</body>
</html>








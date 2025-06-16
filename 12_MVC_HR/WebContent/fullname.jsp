<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이름검색화면</title>
</head>
<body>
	<h1>이름(성,이름) 검색화면[ fullname.jsp ]</h1>
	<form action="fullnameList" method="get">
		이름(성,이름) : <input type="text" name="fullname">
		<input type="submit" value="이름으로 검색">
	</form>
</body>
</html>
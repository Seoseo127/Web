<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부서코드검색화면</title>
</head>
<body>
	<h1>부서코드 검색화면[ dept.jsp ]</h1>
	<h2>POST 방식 요청</h2>
	<form action="controller?command=deptList" method="post">
		부서코드 : <input type="text" name="deptno">
		<input type="submit" value="부서코드로 검색">
	</form>
	<hr>
	
	<h2>POST 방식 요청2 - hidden 사용</h2>
	<form action="controller" method="post">
		부서코드 : <input type="text" name="deptno">
		<input type="submit" value="부서코드로 검색">
		
		<input type="hidden" name="command" value="deptList">
	</form>
	<hr>
	
	<h2>GET 방식 요청 : 요청URL에 파라미터 값 표시(작성)</h2>
	<h3>input type="hidden" name="command" 사용</h3>
	<form action="controller" method="get">
		부서코드 : <input type="text" name="deptno">
		<input type="submit" value="부서코드로 검색">
		
		<input type="hidden" name="command" value="deptList">
	</form>

	
	
	
	
</body>
</html>





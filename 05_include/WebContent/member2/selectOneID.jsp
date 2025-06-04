<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--(실습) 전달받은 데이터 사용 DB 데이터 조회 후 화면에 출력 --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID검색결과</title>
<script src="includee/event.js"></script>
</head>
<body>
	<%@ include file="includee/menu.jspf" %>

	<h1>ID검색 결과</h1>
	<table border>
		<thead>
			<tr>
				<th>번호</th>
				<th>아이디</th>
				<th>암호</th>
				<th>이름</th>
				<th>나이</th>
				<th>주소</th>
				<th>날짜</th>
			</tr>
		</thead>
		<tbody>
	
			<tr>
				<td>1-샘플</td>
				<td>아이디</td>
				<td>암호</td>
				<td>이름</td>
				<td>나이</td>
				<td>주소</td>
				<td>날짜</td>
			</tr>
		
		</tbody>
	</table>

</body>
</html>
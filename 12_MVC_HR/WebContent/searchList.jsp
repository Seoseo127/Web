<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동적검색결과</title>
</head>
<body>
<%-- \${list } : ${list } --%>
\${list.size() } : ${list.size() }

	<h1>동적(${option })검색 결과[ searchList.jsp ]</h1>
	<p>[사번, 이름, 직종, 부서] 검색결과</p>
	<ul>
	<c:forEach var="vo" items="${list }">
		<li>${vo.employeeId }, ${vo.firstName }, ${vo.lastName }, 
			${vo.jobId }, ${vo.salary }, ${vo.departmentId }</li>
	</c:forEach>
	</ul>
	
	
</body>
</html>






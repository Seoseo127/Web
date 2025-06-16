<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체목록보기</title>
</head>
<body>
<%-- \${list } : ${list } --%>
\${list.size() } : ${list.size() }

	<h1>전체목록[ list.jsp ]</h1>
	<p>사번, 이름, 직종, 급여, 부서코드</p>
	<ul>
	<c:forEach var="vo" items="${list }">
		<li>${vo.employeeId }, ${vo.firstName }, ${vo.jobId },
			${vo.salary }, ${vo.departmentId }</li>
	</c:forEach>
	</ul>
	
	
</body>
</html>






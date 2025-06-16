<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시작(작업선택)</title>
</head>
<body>
	<h1>작업선택[ index.jsp ]</h1>
	<p><a href="list">전체보기</a></p>
	<p><a href="dept">부서코드검색 화면으로 이동</a></p>
	<p><a href="fullname">이름 검색(성, 이름) 화면으로 이동 </a></p>
	<p><a href="search">동적검색 화면으로 이동 </a></p>
	
	
	<hr>
	
	<h2>form 태그 method="post"</h2>
	<form method="post">
		<input type="button" value="전체보기" onclick="searchAll(this.form)">
	</form>

<script>
	function searchAll(form) {
		alert("searchAll(form) 실행~~");
		form.action = "list";
		form.submit();
	}
</script>	
</body>
</html>









<%@page import="com.mystudy.mybatis.GuestbookVO"%>
<%@page import="com.mystudy.mybatis.DBService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 전달받은 데이터(idx)로 DB 데이터 조회(SELECT) 후 화면 출력 --%>
<%
	//1. 전달받은 데이터(idx) 확인(추출)
	int idx = Integer.parseInt(request.getParameter("idx"));
	
	//2. DB 관련작업 - idx 값으로 DB데이터 가져오기(SELECT)
	//2-1. SqlSession 객체 생성
	SqlSession ss = DBService.getFactory().openSession();
	
	//2-2. idx 값 전달해서 DB SELECT
	GuestbookVO vo = ss.selectOne("guestbook.one", idx);
	ss.close();
	
	System.out.println("> onelist.jsp vo : " + vo);
	
	//3. 전달받은 데이터 화면 표시
	//3-1. EL, JSTL 사용 + 데이터 계속 사용하기 위해 session에 등록(수정, 삭제시 사용)
	session.setAttribute("guestbookVO", vo);
	System.out.println("> onelist.jsp session guestbookVO : " 
			+ session.getAttribute("guestbookVO") );
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세화면</title>
<link rel="stylesheet" href="../css/guestbook.css">
<script>
	function update_go() {
		location.href = "update.jsp"; // 수정 작업 페이지로 이동
	}
	function delete_go() {
		location.href = "delete.jsp"; // 삭제 작업 페이지로 이동
	}
</script>

</head>
<body>

<div id="container">
	<h2>방명록 : 상세보기</h2>
	<hr>
	<p><a href="list.jsp">[목록으로 이동]</a></p>
	
	<table>
		<tbody>
			<tr>
				<th>작성자</th>
				<td>${guestbookVO.name}</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>${guestbookVO.subject}</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>${guestbookVO.email }</td>
			</tr>
			<tr>
				<td colspan="2">${guestbookVO.content }</td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="2">
					<input type="button" value="수 정" onclick="update_go()">
					<input type="button" value="삭 제" onclick="delete_go()">
				</td>
			</tr>
		</tfoot>
	</table>
</div>

</body>
</html>
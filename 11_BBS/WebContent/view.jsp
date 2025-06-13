<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<%-- 전달받은 파라미터 값 게시글번호(bbsIdx)
	1. 게시글(bbsIdx) 데이터 조회 후 화면 표시
	2. 게시글(bbsIdx)에 딸린 댓글이 있으면 화면 표시
	3. 게시글 조회수(hit) 1 증가
 --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글상세</title>
<script>
	function modify_go() {
		location.href = "modify.jsp";
	}
	function delete_go() {
		location.href = "delete.jsp";
	}
	function list_go() {
		location.href = "list.jsp";
	}
</script>
</head>
<body>

<div id="bbs">
	<%--게시글 내용 표시 --%>
	<table border>
		<caption>상세보기</caption>
		<tbody>
			<tr>
				<th>제목</th>
				<td>제목표시</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>홍길동</td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td>첨부파일다운로드링크</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>작성내용~~~</td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td>
					<input type="button" value="수정" onclick="modify_go()">
					<input type="button" value="삭제" onclick="delete_go()">
					<input type="button" value="목록보기" onclick="list_go()">
				</td>
			</tr>
		</tfoot>
	</table>
	<hr>
	
	<%--게시글에 대한 댓글 작성 영역 --%>
	<form action="comment_write_ok.jsp" method="post">
		<p>
			작성자 : <input type="text" name="writer">
			비밀번호 : <input type="password" name="pwd">
		</p>
		<p>내용 : <textarea name="content" rows="4" cols="40"></textarea></p>
		<input type="submit" value="댓글저장">
		<input type="hidden" name="bbsIdx" value="전달받은글번호">
	</form>
	
	<hr>
	
	<%--게시글에 딸린 댓글 표시 영역 --%>
	<c:forEach var="commVO" items="${commList }">
	<div class="comment">
		<form action="comment_del.jsp" method="post">
			<p>작성자 : 작성자이름 &nbsp;&nbsp; 작성일 : 2025-06-02</p>
			<p>내용 : 작성된댓글내용</p>
			<input type="submit" value="댓글삭제">
			<input type="hidden" name="commentIdx" value="댓글번호값">
		</form>
	</div>
	</c:forEach>

	
</div>








</body>
</html>
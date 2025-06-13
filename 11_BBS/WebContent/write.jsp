<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글작성</title>
</head>
<body>

<div id="bbs">
	<form action="write_ok.jsp" method="post" enctype="multipart/form-data" id="writeForm">
	<table>
		<caption>게시판 글쓰기</caption>
		<tbody>
			<tr>
				<th>제목</th>
				<td>
					<input type="text" name="subject" title="제목">
				</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>
					<input type="text" name="writer" title="작성자">
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<textarea name="content" rows="8" cols="50"></textarea>
				</td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td>
					<input type="file" name="filename">
				</td>
			</tr>
			<tr>
				<th>암호</th>
				<td>
					<input type="password" name="pwd" title="암호">
				</td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="2">
					<input type="button" value="저장" onclick="sendData()">
					<input type="reset" value="초기화">
				</td>
			</tr>
		</tfoot>
	</table>
	</form>
</div>

<script>
	function sendData() {
		//alert("sendData() 실행~");
		//입력값 체크
		let firstForm = document.forms[0];
		//alert("firstForm.id : " + firstForm.id);
		firstForm.submit();
	}
</script>

</body>
</html>






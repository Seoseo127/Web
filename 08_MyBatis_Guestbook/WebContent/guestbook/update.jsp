<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정화면</title>
<link rel="stylesheet" href="../css/guestbook.css">
<script>
	function save_go(form) {
		//비밀번호 확인 후 일치하면 수정 요청 처리
		//(주의)화면에 비밀번호 노출되므로 사용하지 말것(학습용으로만 작성)
		let pwd1 = form.pwd.value; // 지금 작성한 암호
		pwd1 = document.querySelector("input[type=password]").value;
		let pwd2 = "${guestbookVO.pwd}"; // DB에 저장된 암호(노출되면 안됨)
		alert("pwd1 : " + pwd1 + ", pwd2 : " + pwd2);
		if (pwd1 !== pwd2) {
			alert("암호불일치, 암호를 확인하세요");
			form.pwd.value = "";
			form.pwd.focus();
			return false;
		}
		
		//암호일치하면
		form.action = "update_ok.jsp"; // DB 수정 처리
		form.submit();
	}
</script>
</head>
<body>
\${guestbookVO } : ${guestbookVO }

<div id="container">
	<h2>방명록 : 수정화면[ update.jsp ]</h2>
	<hr>
	<p><a href="list.jsp">[목록으로 이동]</a></p>
	
	<form method="post">
		<table>
			<tbody>
				<tr>
					<th>작성자</th>
					<td><input type="text" name="name" value="${guestbookVO.name }"></td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input type="text" name="subject" value="${guestbookVO.subject }"></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input type="text" name="email" value="${guestbookVO.email }"></td>
				</tr>
				<tr>
					<th>비밀번호확인</th>
					<td><input type="password" name="pwd"></td>
				</tr>
				<tr>
					<td colspan="2">
						<textarea name="content" rows="5" cols="60">${guestbookVO.content }</textarea>
					</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="2">
						<input type="button" value="수 정" onclick="save_go(this.form)">
						<input type="reset" value="취 소">
						<input type="hidden" name="idx" value="${guestbookVO.idx }">
					</td>
				</tr>
			</tfoot>
		</table>
	</form>
</div>

</body>
</html>
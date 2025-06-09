<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--전달받은 파라미터 값을 자바빈(Bean) VO에 저장 사용 --%>

<jsp:useBean id="vo" class="com.mystudy.MemberVO" />
<jsp:setProperty property="*" name="vo"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bean 사용</title>
</head>
<body>
	<h1>결과보기 Bean 사용[ el03_result_bean.jsp ]</h1>
	<ul>
		<li>아이디(표현식) : <%=vo.getId() %></li>
		<li>아이디 : ${vo.id }</li>
		<li>암호 : ${vo.pwd }</li>
		<li>이름 : ${vo.name }</li>
		<li>이메일 : ${vo.email }</li>
		<li>성별 : ${vo.gender }</li>
		<li>취미(배열) : ${vo.hobby }</li>
		<li>취미(배열데이터) : 
			${vo.hobby[0] }
			${vo.hobby[1] }
			${vo.hobby[2] }
			${vo.hobby[3] }
		</li>
	</ul>
</body>
</html>







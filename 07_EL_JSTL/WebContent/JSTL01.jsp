<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL</title>
</head>
<body>
<%--JSTL(JSP Standard Tag Labrary)
  0. 라이브러리 구하기(인터넷)
     다운로드 : https://tomcat.apache.org/download-taglibs.cgi
     다운로드 : https://mvnrepository.com/ > jstl 검색
     https://mvnrepository.com/artifact/javax.servlet/jstl/1.2
  1. 라이브러리 등록
     WebContent > WEB-INF > lib > jar 파일 등록
  2. JSTL 디렉티브(지시어) taglib 추가
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
--%>
	<h1>JSTL 사용</h1>
	<h3>속성(변수) 설정 : set</h3>
	<c:set var="test" value="Hello JSTL - page" />
	<c:set var="test" value="Hello JSTL - request" scope="request"/>
	<c:set var="test" value="Hello JSTL - session" scope="session"/>
<%
	//System.out.println("test : " + test); //컴파일 오류(로컬변수로 사용못함)
	System.out.println("test : " + pageContext.getAttribute("test"));
	out.print(pageContext.getAttribute("test"));
%>
	<hr>
	<h3>속성값 출력 : out</h3>
	<p><c:out value="Hello World~~~" /></p>
	<p>page test(c:out) : <c:out value="${pageScope.test }" /></p>
	<p>page test(EL) : ${pageScope.test }</p>
	<p>request test(EL) : ${requestScope.test }</p>
	<p>session test(EL) : ${sessionScope.test }</p>
	
	<p>application test(EL) : ${applicationScope.test }</p>
	<p>application test(c:out) : 
		<c:out value="${applicationScope.test }" default="데이터없음!!!"/>
	</p>
	<hr>
	
	<h3>삭제 : remove</h3>
	<c:remove var="test" scope="page"/>
	
	<p>EL(scope 지정 안함) : ${test }</p>
	<p>page test(EL) : ${pageScope.test }</p>
	<p>request test(EL) : ${requestScope.test }</p>
	<p>session test(EL) : ${sessionScope.test }</p>
	<p>application test(EL) : ${applicationScope.test }</p>
	
	<%-- ======= if 문 ========== --%>
	<h2>JSTL : if 태그 test 속성 확인</h2>
	<h3>JSTL에는 else 는 없음</h3>
	<c:if test="${30 > 20 }">
		<p>30 &gt; 20 결과 true인 경우 실행 문장</p>
	</c:if>
	<c:if test="${30 <= 20 }">
		<p>30 le 20 결과 true인 경우 실행 문장</p>
	</c:if>
	<p>---------------</p>
	
	<h3>JSTL : if 태그2</h3>
	<c:set var="n1" value="5" /> <%--주의!!! 문자열 처리 --%>
	<c:set var="n2" value="20" />
	
	<h3>${n1 } > ${n2 } 비교</h3>
	<c:if test="${n1 > n2 }" var="result">
		<p>if문 결과 ${n1 }이 ${n2 }보다 큽니다 : ${result }</p>
	</c:if>
	비교결과 : ${result }
	<p>---------------</p>
	
	<h3>parseInt 처리해서 숫자 비교</h3>
	<h3>parseInt(${n1 }) > parseInt(${n2 }) 비교처리</h3>
	<c:if test="${Integer.parseInt(n1) > Integer.parseInt(n2) }" var="result">
		<p>if문 결과 ${n1 }이 ${n2 }보다 큽니다</p>
	</c:if>
	비교결과(n1 > n2) : ${result }
	<p>---------------</p>
	<c:if test="${Integer.parseInt(n1) <= Integer.parseInt(n2) }" var="result">
		<p>if문 결과 ${n1 }이 ${n2 }보다 작거나 같습니다</p>
	</c:if>
	비교결과(n1 &lt;= n2) : ${result }
	
	<%-- ====== choose ~ when ~ otherwise ======== --%>
	<h2>JSTL : choose ~ when ~ otherwise</h2>
	<p>자바코드 if ~ else if ~ else if ~ else 처럼 동작</p>
	<c:set var="score" value="100" />
	<c:choose>
		<c:when test="${score >= 90 }">
			<p>판정결과(${score }) : A</p>
		</c:when>
		<c:when test="${score >= 80 }">
			<p>판정결과(${score }) : B</p>
		</c:when>
		<c:when test="${score >= 70 }">
			<p>판정결과(${score }) : C</p>
		</c:when>
		<c:otherwise>
			<p>판정결과(${score }) : 노력필요</p>
		</c:otherwise>
	</c:choose>
	<hr>
	
	<%-- ======= 반복문 forEach ========== --%>
	<h2>JSTL 반복문 : forEach</h2>
	<p>1~10 까지의 숫자 출력</p>
	<c:forEach var="i" begin="1" end="10" step="1"><%--step 값은 1 이상만 허용 --%>
		${i }
	</c:forEach>
	<p>forEach 문 종료후 \${i} 값 출력 : -${i }-</p>
	<p>-------------</p>
	
	<p>(실습)1~10까지의 숫자 중 짝수만 출력(step="2") 사용</p>
	<c:forEach var="i" begin="2" end="10" step="2">
		${i }
	</c:forEach>
	<p>-------------</p>
	
	<p>(실습)1~10까지의 숫자 중 짝수만 출력(step="1") 사용</p>
	<ul>
	<c:forEach var="i" begin="1" end="10" step="1">
		<c:if test="${i % 2 == 0 }">
			<li>${i }</li>
		</c:if>
	</c:forEach>
	</ul>
	
	<p>(실습)1~10까지의 합계 구하기</p>
	<c:set var="sum" value="0" />
	<c:forEach var="i" begin="1" end="10" step="1">
		<c:set var="sum" value="${sum + i }" />
		<%-- ${sum = sum + i } --%> <%--연산결과 저장도 되고, 과정 출력 --%>
		<%-- ${sum += i } --%> <%--문자열 붙이기 처리됨 : 01 02 03 --%>
	</c:forEach>
	<h3>합계 sum : ${sum }</h3>

	<%-- ====== forEach 문(개선된 for문 형태로) --%>
<%
	String[] arr = {"홍길동1", "홍길동2", "홍길동3", "홍길동4"};
	for (String name : arr) {
		out.print(name + " ");
	}
	//JSTL, EL 에서 사용할 수 있게 page scope에 저장
	//pageContext.setAttribute("page_names", arr);
	request.setAttribute("req_names", arr);
%>	
	<h2>forEach 문(배열데이터 처리)</h2>
	<h3>배열값 사용-표현식(로컬변수)</h3>
	<c:set var="page_names" value="<%=arr %>" />
	<p>page_names : ${page_names }</p>
	<p>-----------------</p>
	
	<h3>배열값 출력 - forEach 문(개선된 for문 형태로)</h3>
	<c:forEach var="name" items="${page_names}">
		${name },
	</c:forEach>
	<p>-----------------</p>
	<hr>
	
	<%-- ===== forTokens ========= --%>
	<h2>forTokens 태그 : 문자열 자르기</h2>
	<c:set var="names" value="김유신,이순신/홍길동,일지매/둘리,고길동" />
	<p>문자열 데이터 : ${names }</p>
	
	<h3>forTokens 태그 : / 구분자로 문자열 자르기</h3>
	<c:forTokens var="name" items="${names }" delims="/">
		<p>${name }</p>
	</c:forTokens>
	<p>--------------</p>
	
	<h3>forTokens 태그 : / 와 , 구분자로 문자열 자르기</h3>
	<c:forTokens var="name" items="${names }" delims="/,">
		<p>${name }</p>
	</c:forTokens>
	
	
	

	<br><br><br><br><br><br><br><br><br><br><br>
	<br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>









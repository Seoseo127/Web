<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL</title>
</head>
<body>
<%--■ EL(Expression Language) : 표현언어
	1. 표현식을 대신해서 사용 : ${ }
		<%=데이터 %> :::: ${데이터 } : 데이터 - 상수, 계산식, ....
	2. 사용할 데이터가 반드시 scope 상에 존재해야 한다
		scope 객체 : pageContext, request, session, application
		해당 scope 상에 setAttribute 설정된 변수(속성) 값만 사용 가능
		(주의 : 로컬변수에 있는 데이터 사용 못함)
	3. 같은 이름이 다른 scope 상에 존재하는 경우 접근 우선순위가 적용
		scope 명칭 : page < request < session < application
		저장변수명 : pageContext -> request -> session -> application
		(단, scope 지정 없으면 page ---> application 순으로 찾는다
		명시적으로 scope 지정하면 해당 scope에서만 찾는다)
	4. 저장객체 타입(Tomcat 기준)
		pageContext : javax.servlet.jsp.PageContext
		request : javax.servlet.http.HttpServletRequest
		session : javax.servlet.http.HttpSession
		application : javax.servlet.ServletContext
■ EL 사용할 수 있는 위치
  - HTML, CSS, JavaScript 작성 영역
  - 액션태그, JSTL의 속성값	
■ EL 사용할 수 없는 위치
  - JSP 스크립트 요소(선언부, 표현식, 스크립트릿)		
--%>
	<h1>EL(Expression Language) 사용시 데이터 사용범위(scope)</h1>
	<h2>(중요)EL 사용 데이터 처리하려면 scope상에 등록되어 있어야함</h2>
	<hr>
	<%! int globalNum = 999; %>
	<% int localNum = 20; %>
	<ul>
		<li>표현식 globalNum : <%=globalNum %></li>
		<li>표현식 localNum : <%=localNum %></li>
	</ul>
	<ol>
		<li>EL globalNum : -${globalNum }-</li>
		<li>EL  localNum : -${localNum }-</li>
	</ol>
	<hr>
	
	<h2>EL에서 사용하려면 스코프(scope)에 속성 정의 후 사용</h2>
	<% pageContext.setAttribute("p_globalNum", globalNum); %>
	<ol>
		<li>EL p_globalNum : ${p_globalNum }</li>
	</ol>

	<%-- ================================ --%>
	<h2>동일한 이름의 명칭으로 여러 scope에 존재 할때</h2>
<%
	pageContext.setAttribute("pc", "1세대컴퓨터 - pageScope");
	request.setAttribute("pc", "2세대컴퓨터 - requestScope");
	session.setAttribute("pc", "3세대컴퓨터 - sessionScope");
	application.setAttribute("pc", "4세대컴퓨터 - applicationScope");
%>	
	<h3>scope 지정없이 데이터 사용</h3>
	<ul>
		<li>scope 지정없이 pc : ${pc }</li>
	</ul>
	
	<h3>명시적 scope 지정 사용(해당 영역에서만 찾음)</h3>
	<ul>
		<li>pageScope 지정 : ${pageScope.pc }</li>
		<li>requestScope 지정 : ${requestScope.pc }</li>
		<li>sessionScope 지정 : ${sessionScope.pc }</li>
		<li>applicationScope 지정 : ${applicationScope.pc }</li>
	</ul>
	<hr><hr>
	\${pageScope.pc } : ${pageScope.pc }
	
	
	<br><br><br><br><br><br><br><br><br><br> 
	<br><br><br><br><br><br><br><br><br><br> 
</body>
</html>
























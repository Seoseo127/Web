<%@page import="com.mystudy.PersonVO"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL forEach</title>
</head>
<body>
	<h1>JSTL forEach 구문</h1>
	<h2>Array, List, Set, Map</h2>
<%
	String[] strs = {"a", "ab", "abc", "abcd"};
	pageContext.setAttribute("arr", strs);
	System.out.println("strs.length : " + strs.length);
	pageContext.setAttribute("arr_length", strs.length);
%>	
	<p>배열 데이터 : <%=Arrays.toString(strs) %></p>
	<c:forEach var="str" items="${arr }">
		<p>${str }</p>
	</c:forEach>
	
	<h3>배열(Array) 일부 데이터만 사용(2,3번째 : 1,2번 인덱스)</h3>
	<h3>forEach var="str" items="\${arr }" begin="1" end="2"</h3>
	<ul>
	<c:forEach var="str" items="${arr }" begin="1" end="2">
		<li>${str }</li>
	</c:forEach>
	</ul>
	<p>----------------</p>
	
	<p>첫번째 부터 맨뒤에서 2번째 까지</p>
	length : ${arr_length }
	<ol>
	<c:forEach var="str" items="${arr }" begin="0" end="${arr_length - 2 }">
		<li>${str }</li>
	</c:forEach>
	</ol>
	
	<!-- ======= List 출력 ======= -->
	<h2>List 출력 ===================</h2>
<%
	List<Integer> list = new ArrayList<Integer>();
	list.add(123);
	list.add(45);
	list.add(678);
	list.add(90);
	pageContext.setAttribute("alist", list);
	
	System.out.println("list : " + list);
	System.out.println("list.toString() : " + list.toString());
	System.out.println("list.size() : " + list.size());
	System.out.println("list.contains(123) : " + list.contains(123));
	System.out.println("list.get(0) : " + list.get(0));
	System.out.println("list.get(list.size() - 2) : " + list.get(list.size() - 2));
%>	
	<p>alist : ${alist }</p>
	<p>alist.toString() : ${alist.toString() }</p>
	<p>alist.size() : ${alist.size() }</p>
	<p>alist.contains(123) : ${alist.contains(123) }</p><%--false : 문자열처리됨 --%>
	<p>alist.contains(Integer.valueOf(123)) : ${alist.contains(Integer.valueOf(123)) }</p>

	<ul>
	<c:forEach var="listItem" items="${alist }">
		<li>${listItem }</li>
	</c:forEach>
	</ul>
	
	<p>첫번째 부터 맨뒤에서 2번째 까지</p>
	<ol>
	<c:forEach var="listItem" items="${alist }" begin="0" end="${alist.size() - 2 }">
		<li>${listItem }</li>
	</c:forEach>
	</ol>
	
	<%-- ========= Set 출력 ============== --%>
	<h2>Set 출력 ==============</h2>
<%
	Set<String> set = new HashSet<>();
	set.add("홍길동");
	set.add("김유신");
	set.add("강감찬");
	set.add("을지문덕");
	set.add("을지문덕");
	pageContext.setAttribute("hset", set);
	
	System.out.println("set : " + set);
	System.out.println("set.size() : " + set.size());
	System.out.println("set.contains(\"홍길동\") : " + set.contains("홍길동"));
%>	
	<p>hset : ${hset }</p>
	<p>hset.size() : ${hset.size() }</p>
	<p>hset.contains("홍길동") : ${hset.contains("홍길동") }</p>
	
	<ul>
	<c:forEach var="name" items="${hset }">
		<li>${name }</li>
	</c:forEach>
	</ul>
	
	<ol>
	<c:forEach var="name" items="${hset }" begin="1" end="2">
		<li>${name }</li>
	</c:forEach>
	</ol>
	<hr><hr>
	
	<%--===== Map key-value 데이터 출력 ============== --%>
	<h2>Map 사용 =============</h2>
<%
	Map<String, String> map = new HashMap<>();
	map.put("k1", "a");
	map.put("k2", "ab");
	map.put("k3", "abc");
	map.put("k4", "abcd");
	map.put("k5", "abcde");
	System.out.println("> map : " + map);
	System.out.println("> map.keySet() : " + map.keySet());
	System.out.println("> map.values() : " + map.values());
	pageContext.setAttribute("hmap", map);
%>
	<h3>\${hmap } : ${hmap }</h3>
	\${hmap.k1 } : ${hmap.k1 }<br>
	\${hmap.k2 } : ${hmap.k2 }<br>
	\${hmap['k3'] } : ${hmap['k3'] }<br>
	\${hmap["k4"] } : ${hmap["k4"] }<br>
	
	<p>==== Map 전체 데이터 조회 ===</p>
	<c:forEach var="mapData" items="${hmap }">
		<p>\${mapData } : ${mapData }<br>
		\${mapData.key } : ${mapData.key }<br>
		\${mapData.value } : ${mapData.value }</p>
	</c:forEach>
	<p>-----------------</p>
	
	<p>hmap.keySet() 사용 key값 확인</p>
	<c:forEach var="key" items="${hmap.keySet() }">
		${key }
	</c:forEach>
	<p>-----------------</p>
	
	<p>hmap.values() 사용 value값 확인</p>
	<c:forEach var="value" items="${hmap.values() }">
		${value }
	</c:forEach>
	<hr><hr>
	
	<h1>VO가 담긴 List 사용================</h1>
<%
	List<PersonVO> listBean = new ArrayList<>();
	listBean.add(new PersonVO("홍길동", 25));
	listBean.add(new PersonVO("김유신", 33));
	listBean.add(new PersonVO("강감찬", 40));
	listBean.add(new PersonVO("을지문덕", 50));
	System.out.println("listBean : " + listBean);
	System.out.println("listBean.size() : " + listBean.size());
	
	request.setAttribute("persons", listBean);
	out.print("persons : " + listBean);
%>
	
	<%--(실습) persons에 있는 PersonVO 데이터의 이름, 나이를 화면 출력 --%>
	persons 데이터 존재여부 확인 - \${empty persons } : ${empty persons }
	
	<p>출력예시) 이름: 홍길동, 나이: 25</p>
	<c:forEach var="person" items="${persons }">
		<p>이름 : ${person.name }, 나이 : ${person.age }</p>
	</c:forEach>
	<p>--------------</p>
	
	
	<br><br><br><br><br><br><br><br><br><br><br>
	<br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>














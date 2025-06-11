<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--장바구니(cart)에 추가하고, 제품상세페이지로 이동
	전달받은 제품번호(pnum)에 해당하는 제품 장바구니 담기
	1. 장바구니(cart) 객체를 생성(카트만들기)
	  - 없으면 : 장바구니 생성후 세션에 저장(재사용 가능) 
	  - 있으면 : 재사용
	2. 장바구니에 제품 추가(전달받은 제품번호 사용)
	3. 장바구니에 담은 후 제품상세페이지로 이동
--%>
	<jsp:useBean id="cart" class="com.mystudy.shop.Cart" scope="session" />	
	<jsp:useBean id="dao" class="com.mystudy.shop.ProductDAO" scope="session" />	
<%
	// 전달받은 파라미터 값 추출(확인)
	String pnum = request.getParameter("pnum");
	
	// 장바구니(cart)에 제품 담기(추가)
	cart.addProduct(pnum, dao);
	
	System.out.println("> 카트 제품목록 : " + cart.getList());
	System.out.println("> 카트 품목종류 : " + cart.getList().size());
	System.out.println("> 카트 금액합계 : " + cart.getTotal());
	
	// 제품 상세페이지로 이동
	response.sendRedirect("product_content.jsp?pnum=" + pnum);
%>











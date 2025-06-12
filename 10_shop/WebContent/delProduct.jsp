<%@page import="com.mystudy.shop.Cart"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--(실습) 제품번호(pnum)를 전달받아 장바구니(cart) 데이터 삭제 후
	장바구니 페이지로 이동 --%>
	<%-- <jsp:useBean id="cart" class="com.mystudy.shop.Cart" scope="session" /> --%>
<%
	//1. 파라미터 값 확인(추출)
	String pnum = request.getParameter("pnum");
	
	//2. 카트(cart)에서 제품 삭제
	Cart cart = (Cart) session.getAttribute("cart");
	//System.out.println("cart : " + cart);
	
	cart.delProduct(pnum);
	
	//3. 화면전환(페이지 이동) - cartList.jsp
	response.sendRedirect("cartList.jsp");
	
%>







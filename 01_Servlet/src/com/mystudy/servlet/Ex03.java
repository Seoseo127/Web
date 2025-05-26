package com.mystudy.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/test03")
public class Ex03 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		System.out.println(">> Ex03 doGet() 실행~~~");
		
		// 클라이언트가 전달한 데이터를 받아서 HTML문서를 만들어서 되돌려줌
		// URL 요청형식 : 요청명?파라미터명=값&파라미터명=값
		// URL 요청내용 예) /test03?name=hong&age=26
		//---------------
		// 이름 : hong
		// 나이 : 26
		
		// request 객체(인스턴스)로 부터 파라미터 값 추출(확인)
		String name = request.getParameter("name"); //1개의 파라미터 값 추출(확인)
		String age = request.getParameter("age");
		System.out.println("> name : " + name + ", age : " + age);
		
		// 응답처리
		// 한글 깨짐 방지를 위한 문자타입(UTF-8) 처리
		response.setContentType("text/html;charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		out.println("<h1>전달 받은 이름, 나이</h1>");
		out.println("<h3>이름 : " + name + "</h3>");
		out.println("<h3>나이 : " + age + "</h3>");
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println(">> Ex03 doPost() 실행!!!");
		
		//한글깨짐 방지를 위한 인코딩시 사용할 문자셋 지정(설정)
		// post 방식 : request body 데이터 한글처리(UTF-8)
		req.setCharacterEncoding("UTF-8");
		
		doGet(req, resp);
		
	}

}







package com.mystudy.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/signup")
public class Ex04 extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		System.out.println(">> Ex04 doGet() 실행");
		
		//전달받은 데이터 추출 후 응답처리
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		
		//String hobby = request.getParameter("hobby"); //1개만 읽을 수 있음
		
		//취미(hobby) 값 추출
		String[] hobby = request.getParameterValues("hobby");
		
		// 서버 콘솔(console)에 출력
		System.out.println("id : " + id);
		System.out.println("pwd : " + pwd);
		System.out.println("name : " + name);
		System.out.println("email : " + email);
		
		//System.out.println("hobby : " + hobby);
		
		System.out.println(":: String[] hobby : " + hobby);
		System.out.println(":: hobby 배열값 : " + Arrays.toString(hobby));
		
		//======================
		// 클라이언트(브라우저) 쪽으로 응답 처리
		response.setContentType("text/html;charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		out.println("<h2>회원가입정보</h2>");
		out.println("<ul>");
		out.println("<li>아이디 : " + id + "</li>");
		out.println("<li>암호 : " + pwd + "</li>");
		out.println("<li>이름 : " + name + "</li>");
		out.println("<li>이메일 : " + email + "</li>");
		out.println("<li>취미 : ");
		if (hobby == null) {
			out.print("선택안함");
		} else {
			for (String str : hobby) {
				out.print(str + "&nbsp;&nbsp;");
			}
		}
		out.println("</li>");
		out.println("</ul>");
		
	}
	
}













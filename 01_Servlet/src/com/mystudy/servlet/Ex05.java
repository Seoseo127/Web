package com.mystudy.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = { "/sungjuk" })
public class Ex05 extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(">> Ex05 doGet() 실행~~");
		
		//1. 전달된 데이터(파라미터값) 확인(추출)
		String name = request.getParameter("name");
		String sKor = request.getParameter("kor");
		int kor = Integer.parseInt(sKor);
		int eng = Integer.parseInt(request.getParameter("eng"));
		int math = Integer.parseInt(request.getParameter("math"));
		
		System.out.println("name : " + name);
		System.out.println("kor : " + kor);
		System.out.println("eng : " + eng);
		System.out.println("math : " + math);
		
		//2. 계산처리(총점, 평균)
		int tot = kor + eng + math;
		double avg = tot * 100 / 3 / 100.0;
		
		//3. 출력-응답처리(브라우저 화면 - HTML 태그 작성)
		
		//한글깨짐 해결을 위해 문자셋 설정
		response.setContentType("text/html;charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		out.println("<h3>성적처리 결과</h3>");
		out.println("<p>이름 : " + name + "</p>");
		out.println("<p>국어 : " + kor + "</p>");
		out.println("<p>영어 : " + eng + "</p>");
		out.println("<p>수학 : " + math + "</p>");
		out.println("<p>총점 : " + tot + "</p>");
		out.println("<p>평균 : " + avg + "</p>");
		
		
		
	}
	
}




